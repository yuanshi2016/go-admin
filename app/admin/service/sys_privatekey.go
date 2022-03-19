package service

import (
	"crypto/ecdsa"
	"errors"
	"fmt"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/ethclient"
	"github.com/ethereum/go-ethereum/rpc"
	"github.com/gin-gonic/gin"
	"github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth"
	"go-admin/app/admin/service/contract"
	"math/big"
	"strconv"

	"github.com/go-admin-team/go-admin-core/sdk/service"
	"gorm.io/gorm"

	"go-admin/app/admin/models"
	"go-admin/app/admin/service/dto"
	"go-admin/common/actions"
	cDto "go-admin/common/dto"
)

type SysPrivatekey struct {
	service.Service
}

// GetPage 获取SysPrivatekey列表
func (e *SysPrivatekey) GetPage(c *dto.SysPrivatekeyGetPageReq, p *actions.DataPermission, list *[]*models.SysPrivatekey, count *int64, d *gin.Context) error {
	var err error
	var data models.SysPrivatekey
	if p.UserId != 1 {

	}
	err = e.Orm.Model(&data).
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error

	datat, _ := d.Get(jwtauth.JwtPayloadKey)
	v := datat.(jwtauth.MapClaims)

	if v["rolekey"] != "admin" {
		for _, item := range *list {
			item.Privatekey = string(p.UserId)
		}
	}
	if err != nil {
		e.Log.Errorf("SysPrivatekeyService GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取SysPrivatekey对象
func (e *SysPrivatekey) Get(d *dto.SysPrivatekeyGetReq, p *actions.DataPermission, model *models.SysPrivatekey) error {
	var data models.SysPrivatekey

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		First(model, d.GetId()).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetSysPrivatekey error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建SysPrivatekey对象
func (e *SysPrivatekey) Insert(c *dto.SysPrivatekeyInsertReq) error {
	var err error
	var data models.SysPrivatekey
	Private, err := crypto.HexToECDSA(c.Privatekey)
	if err != nil {
		return err
	}
	BaseAddress := crypto.PubkeyToAddress(Private.PublicKey)
	c.Address = BaseAddress.String()
	c.Generate(&data)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Errorf("SysPrivatekeyService Insert error:%s \r\n", err)
		return err
	}
	return nil
}

// Update 修改SysPrivatekey对象
func (e *SysPrivatekey) Update(c *dto.SysPrivatekeyUpdateReq, p *actions.DataPermission) error {
	var err error
	var data = models.SysPrivatekey{}
	e.Orm.Scopes(
		actions.Permission(data.TableName(), p),
	).First(&data, c.GetId())
	c.Generate(&data)

	db := e.Orm.Save(&data)
	if db.Error != nil {
		e.Log.Errorf("SysPrivatekeyService Save error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysPrivatekey
func (e *SysPrivatekey) Remove(d *dto.SysPrivatekeyDeleteReq, p *actions.DataPermission) error {
	var data models.SysPrivatekey

	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysPrivatekey error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权删除该数据")
	}
	return nil
}

// ApprovalForAll 操作员授权
func (e *SysPrivatekey) ApprovalForAll(d *dto.SysPrivatekeyApprovalForAllReq, p *actions.DataPermission) (_Return []models.SysPrivatekeyReturn, err error) {
	var data models.SysPrivatekey
	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).First(&data, d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysPrivatekey error:%s \r\n", err)
		return _Return, err
	}
	if db.RowsAffected == 0 {
		return _Return, errors.New("该私钥不存在")
	}
	DataPrivate, err := crypto.HexToECDSA(data.Privatekey)
	if err != nil {
		return _Return, errors.New("该私钥解析失败,请联系管理员")
	}
	_, BaseAddress, err := e.GetPrivate()
	if err != nil {
		return _Return, err
	}
	//查询系统中的合约
	var contracts []models.SysContractJoin
	err = e.Orm.Raw("SELECT contract.address,network.* from sys_contract contract JOIN sys_network network on network.id = contract.network_id").Find(&contracts).Error
	if err != nil {
		return _Return, errors.New("获取合约失败,联系管理员!")
	}
	for _, item := range contracts {
		rpcDial, err := rpc.Dial(item.RpcUrl)
		if err != nil {
			return _Return, err
		}
		client := ethclient.NewClient(rpcDial)
		ContractClient, _ := contract.NewHemaNft(common.HexToAddress(item.Address), client)
		//获取签名
		ChainId, err := strconv.Atoi(item.ChainId)
		if err != nil {
			return _Return, errors.New("区块链网络ID解析失败")
		}
		auth, err := bind.NewKeyedTransactorWithChainID(DataPrivate, big.NewInt(int64(ChainId)))
		tx, err := ContractClient.SetApprovalForAll(auth, BaseAddress, true)
		_Return = append(_Return, models.SysPrivatekeyReturn{Tx: tx.Hash().String(), BlockUrl: item.BlockUrl, Title: fmt.Sprintf("合约：%s授权hash", item.Name)})
	}
	return _Return, err
}

// GetPrivate 获取后台配置的私钥以及私钥地址
func (e *SysPrivatekey) GetPrivate() (*ecdsa.PrivateKey, common.Address, error) {
	var err error
	var object = new(models.SysConfig)
	e.Orm.Raw("SELECT * from sys_config where config_key='eth_private'").Scan(object)
	if len(object.ConfigValue) <= 0 {
		return &ecdsa.PrivateKey{}, common.Address{}, errors.New("私钥未配置")
	}
	Private, err := crypto.HexToECDSA(object.ConfigValue)
	BaseAddress := crypto.PubkeyToAddress(Private.PublicKey)
	return Private, BaseAddress, err
}
