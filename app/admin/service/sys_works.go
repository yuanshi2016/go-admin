package service

import (
	"bytes"
	"context"
	"crypto/ecdsa"
	"encoding/json"
	"errors"
	"fmt"
	"go-admin/app/admin/models"
	"go-admin/app/admin/service/contract"
	"go-admin/app/admin/service/dto"
	"go-admin/common/actions"
	cDto "go-admin/common/dto"
	"math/big"
	"strconv"
	"strings"

	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/ethclient"
	"github.com/ethereum/go-ethereum/rpc"
	"github.com/go-admin-team/go-admin-core/sdk/service"
	IPFS "github.com/ipfs/go-ipfs-api"
	"gorm.io/gorm"
)

type SysWorks struct {
	service.Service
}

// GetPage 获取作品列表
func (e *SysWorks) GetPage(c *dto.SysWorksGetPageReq, p *actions.DataPermission, list *[]models.SysWorksJoin, count *int64) error {
	var err error
	var data models.SysWorks
	err = e.Orm.Model(&data).
		Scopes(
			cDto.OrderDest("sys_works.id", true),
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Select("sys_works.*,sysuser.nick_name as create_name,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
		Joins("JOIN sys_contract contract on sys_works.contract_id = contract.id ", nil).
		Joins("JOIN sys_network network on contract.network_id = network.id ").
		Joins("JOIN sys_user sysuser on sys_works.create_by = sysuser.user_id ").
		//Order("sys_works.id DESC").
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetSysWorks  GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取作品对象
func (e *SysWorks) Get(d *dto.SysWorksGetReq, p *actions.DataPermission, model *models.SysWorksJoin) error {
	var data models.SysWorks

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		Select("sys_works.*,sysuser.nick_name as create_name,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
		Joins("JOIN sys_contract contract on sys_works.contract_id = contract.id ", nil).
		Joins("JOIN sys_network network on contract.network_id = network.id ").
		Joins("LEFT JOIN sys_user sysuser on sys_works.create_by = sysuser.user_id ").
		Where("sys_works.id = ? or sys_works.token_id = ?", d.GetId(), d.GetId()).
		First(model).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetSysWorks error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建SysWorks对象
func (e *SysWorks) Insert(c *dto.SysWorksInsertReq, p *actions.DataPermission) error {
	var err error
	var data models.SysWorks
	var Privatekey models.SysPrivatekey
	// 查看私钥是否存在
	err = e.Orm.Raw("select * from sys_privatekey where id = ?", c.PrivatekeyId).First(&Privatekey).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("区块链管理员地址不存在")
		e.Log.Errorf("Service GetSysContractToken error:%s \r\n", err)
		return err
	}
	//效验铸币数量是否正确
	err = e.CheckAmount(c)
	if err != nil {
		err = errors.New("发行数量超出可配数量,请联系管理员")
		e.Log.Errorf("Service GetSysContractToken error:%s \r\n", err)
		return err
	}
	var content = models.MetadataContent{}
	json.Unmarshal([]byte(c.MetadataContent), &content)
	content.Tokenid = int64(c.TokenId)
	content.Image = fmt.Sprintf("ipfs://%v", c.ImgUrl)
	c.MetadataContent = content.Tojson()
	data.MetadataContent = c.MetadataContent
	c.Generate(&data)

	err = e.Orm.Transaction(func(tx *gorm.DB) error {
		err = tx.Create(&data).Error
		if err != nil {
			e.Log.Errorf("SysWorksService Insert error:%s \r\n", err)
			return err
		}
		for i := 0; i < c.Quantity; i++ {
			addData := models.SysContractToken{
				WorksId:   data.Id,
				TokenId:   c.TokenId,
				Stock:     1,
				ControlBy: c.ControlBy,
			}
			if err := tx.Create(&addData).Error; err != nil {
				// 回滚事务
				return err
			}
			fmt.Println(err)
		}
		return nil
	})
	return err
}

// CheckAmount 检查铸币数量是否正确
func (e *SysWorks) CheckAmount(i *dto.SysWorksInsertReq) error {
	var object = new(models.SysConfig)
	e.Orm.Raw("SELECT * from sys_config where config_key='token_amount'").Scan(object)
	if len(object.ConfigValue) <= 0 {
		return nil
	}
	var configAmount, _ = strconv.Atoi(object.ConfigValue)
	if i.Quantity > configAmount {
		return errors.New("铸币数量超出范畴")
	}
	return nil
}

// Update 修改SysWorks对象
func (e *SysWorks) Update(c *dto.SysWorksUpdateReq, p *actions.DataPermission) error {
	var err error
	var data = models.SysWorks{}
	e.Orm.Scopes(
		actions.Permission(data.TableName(), p),
	).First(&data, c.GetId())
	c.Generate(&data)

	db := e.Orm.Save(&data)
	if db.Error != nil {
		e.Log.Errorf("SysWorksService Save error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysWorks
func (e *SysWorks) Remove(d *dto.SysWorksDeleteReq, p *actions.DataPermission) error {
	var data models.SysWorks
	var contracttoken models.SysContractToken
	//检查是否有子项
	var count int64
	e.Orm.Raw("select count(*) from sys_contract_token where is_del = TRUE and works_id in (?)", d.GetId()).Count(&count)
	if count > 0 {
		return errors.New("当前作品有复制品，无法删除")
	}
	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysWorks error:%s \r\n", err)
		return err
	}
	e.Orm.Model(&contracttoken).
		Scopes(
			actions.Permission(contracttoken.TableName(), p),
		).Delete(&contracttoken, "works_id = ?", d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysWorksTokens error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权删除该数据")
	}
	return nil
}

// ToMit 铸币
func (e *SysWorks) ToMit(d *dto.SysWorksToMitReq, p *actions.DataPermission) ([]models.SysWorksToMitReturn, error) {
	//var _Return []models.SysWorksToMitReturn
	var data []models.SysWorksJoin
	group := models.SysWorksToMitGroup{}
	//先按照作品查询
	for _, id := range d.Ids {
		db := e.Orm.Model(&data).
			Scopes(
				actions.Permission(group.TableName(), p),
			).
			Select("sys_works.*,pkey.address as base_address,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
			Joins("JOIN sys_contract contract on sys_works.contract_id = contract.id ", nil).
			Joins("JOIN sys_network network on sys_works.network_id = network.id ").
			Joins("LEFT JOIN sys_contract_token token on token.works_id = sys_works.id ").
			Joins("JOIN sys_privatekey pkey on pkey.id = sys_works.privatekey_id ").
			Where("sys_works.is_sync = 0 and sys_works.id = ?", id).
			Find(&data)
		if db.RowsAffected == 0 {
			return []models.SysWorksToMitReturn{}, errors.New("未查询到所选代币信息")
		}
		info := data[0]
		//先按照合约进行分类
		if _, ok := group[info.ContractAddress]; !ok {
			group[info.ContractAddress] = &models.SysWorksAdminTomit{}
			// 赋值节点信息
			group[info.ContractAddress].Group = make(map[string][]models.SysWorksJoin)
			group[info.ContractAddress].RpcUrl = info.RpcUrl
			group[info.ContractAddress].ChainId = info.ChainId
			group[info.ContractAddress].BlockUrl = info.BlockUrl
		}
		//将管理员分类的info 切片
		group[info.ContractAddress].Group[info.BaseAddress] = append(group[info.ContractAddress].Group[info.BaseAddress], info)
		group[info.ContractAddress].AdminAddress = append(group[info.ContractAddress].AdminAddress, common.HexToAddress(info.BaseAddress))
		group[info.ContractAddress].TokenAmount = append(group[info.ContractAddress].TokenAmount, big.NewInt(int64(info.Quantity)))
		group[info.ContractAddress].TokenId = append(group[info.ContractAddress].TokenId, big.NewInt(int64(info.TokenId)))
		group[info.ContractAddress].WorksId = append(group[info.ContractAddress].WorksId, big.NewInt(int64(info.Id)))
	}
	tx, err := e.sendContractToken(group, d.Gas)
	return tx, err
}
func (e *SysWorks) UpdateTomitState() {
	var data []models.SysWorksJoin
	e.Log.Debug("执行铸币状态更新-Start")
	db := e.Orm.Model(&data).
		Select("sys_works.*,pkey.address as base_address,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
		Joins("JOIN sys_contract contract on sys_works.contract_id = contract.id ", nil).
		Joins("JOIN sys_network network on sys_works.network_id = network.id ").
		Joins("LEFT JOIN sys_contract_token token on token.works_id = sys_works.id ").
		Joins("JOIN sys_privatekey pkey on pkey.id = sys_works.privatekey_id ").
		Where("sys_works.is_sync = 1").Group("sys_works.id").
		Find(&data)
	if db.RowsAffected == 0 {
		return
	}
	for _, item := range data {
		rpcDial, err := rpc.Dial(item.RpcUrl)
		if err != nil {
			e.Log.Errorf("节点连接失败%s", err.Error())
		}
		client := ethclient.NewClient(rpcDial)
		HashRes, IsPending, err := client.TransactionByHash(context.Background(), common.HexToHash(item.TxHash))
		if err == nil {
			if IsPending == false && HashRes.Protected() == true {
				e.Orm.Raw(fmt.Sprintf("update %s set is_sync=2 where token_id = %v", item.TableName(), item.TokenId)).Scan(nil)
			}

		}
	}
	e.Log.Debug("执行铸币状态更新-End")
}

// 铸币
func (e *SysWorks) sendContractToken(TokenGroup models.SysWorksToMitGroup, GasPrice float64) (hash []models.SysWorksToMitReturn, err error) {
	Private, BaseAddress, err := e.GetPrivate()
	for ContractAddress, info := range TokenGroup {
		rpcDial, err := rpc.Dial(info.RpcUrl)
		//批量发布到ipfs 并将成功上传token信息的ID进行上链
		_, _, _, PathCid := e.PushIpfs(info.Group)
		WorksIds := strings.Replace(strings.Trim(fmt.Sprint(info.WorksId), "[]"), " ", ",", -1)
		if err != nil {
			return hash, errors.New("节点连接失败")
		}
		client := ethclient.NewClient(rpcDial)
		balance, err := client.BalanceAt(context.Background(), BaseAddress, nil)
		e.Log.Debugf("{%s}余额:%v ,节点{%s}\r\n", BaseAddress, balance, info.RpcUrl)
		if err != nil {
			return hash, errors.New(fmt.Sprintf("{%s}余额:%v ,节点{%s} 报错:{%v}\r\n", BaseAddress, balance, info.RpcUrl, err.Error()))
		}
		ContractClient, _ := contract.NewHemaNft(common.HexToAddress(ContractAddress), client)
		//获取签名
		auth, err := bind.NewKeyedTransactorWithChainID(Private, big.NewInt(int64(info.ChainId)))
		//gasPrice获取
		//gasPrice, err := client.SuggestGasPrice(context.Background())
		if err != nil {
			return hash, errors.New("签名获取失败")
		}
		auth.GasPrice = big.NewInt(int64(1000000000 * (GasPrice * 1.5)))

		e.Log.Debugf("GasPrice:%v", auth.GasPrice)
		e.Log.Debugf("GasLimit:%v", auth.GasLimit)

		tx, err := ContractClient.MintBatch(auth, info.AdminAddress, info.TokenId, info.TokenAmount, nil)

		if err != nil {
			e.Log.Errorf("转账结果:%s \r\n", err.Error())
			//e.Orm.Raw(fmt.Sprintf("update %s set tx_hash='%s',is_sync=1 where id in (%s)", TokenGroup.TableName(), tx.Hash().Hex(), WorksIds)).Scan(nil)
			return hash, errors.New("铸币失败" + err.Error())
			continue
		}
		auth.Nonce = big.NewInt(int64(tx.Nonce()) + 1)
		e.Log.Errorf("Mintauth-Nonce:%s \r\n", tx.Nonce())

		tx1, err1 := ContractClient.SetBaseURI(auth, fmt.Sprintf("ipfs://%v/", PathCid.Hash)) //更新主目录cid

		if err1 != nil {
			e.Log.Errorf("修改Cid结果:%s \r\n", err1.Error())
			return hash, errors.New("修改Cid失败" + err1.Error())
			//continue
		}
		e.Log.Errorf("Cidauth-Nonce:%v \r\n", tx1.Nonce())

		hash = append(hash, models.SysWorksToMitReturn{Tx: tx.Hash().Hex(), BlockUrl: info.BlockUrl, Title: "点击查看铸币hash"})
		hash = append(hash, models.SysWorksToMitReturn{Tx: tx1.Hash().Hex(), BlockUrl: info.BlockUrl, Title: "点击查看目录Cid更新 Hash"})

		e.Orm.Raw(fmt.Sprintf("update %s set tx_hash='%s',is_sync=1 where id in (%s)", TokenGroup.TableName(), tx.Hash().Hex(), WorksIds)).Scan(nil)
	}
	return hash, err
}

func (e *SysWorks) PushIpfs(Items map[string][]models.SysWorksJoin) (Address []common.Address, SuccessId []*big.Int, Amount []*big.Int, PathCid *IPFS.FilesStatObject) {
	//按照作品分类
	for _, item := range Items {
		Config := e.GetIpfsConfig()
		//按照作品下的代币复制品数量进行tokenid与ipfs映射
		for _, Xitem := range item {
			//path := fmt.Sprintf("%s/%v", Xitem.IpfsBindDir, Xitem.TokenId)
			path := fmt.Sprintf("/%v", Xitem.TokenId)
			e.Log.Tracef("Ipfs上传路径: %v", path)
			ipfs := IPFS.NewShell(fmt.Sprintf("%s:%s", Config.IpfsIp, Config.IpfsPort))
			err1 := ipfs.FilesWrite(context.Background(), path, bytes.NewReader([]byte(Xitem.MetadataContent)), IPFS.FilesWrite.Create(true), IPFS.FilesWrite.Parents(true))
			cid, err := ipfs.FilesStat(context.Background(), path)
			PathCid, _ = ipfs.FilesStat(context.Background(), "/") //查看根目录CID
			//这里需要动态更新ipfs的CID
			if err == nil || err1 == nil {
				Address = append(Address, common.HexToAddress(Xitem.BaseAddress))
				SuccessId = append(SuccessId, big.NewInt(int64(Xitem.TokenId)))
				Amount = append(Amount, big.NewInt(int64(Xitem.Quantity)))
				//更新单条token的 cid
				e.Orm.Raw(fmt.Sprintf("update %s set token_cid='%s' where token_id =%d", Xitem.TableName(), cid.Hash, Xitem.TokenId)).Scan(nil)
			} else {
				fmt.Println("上传错误:", err)
			}
		}
	}
	return Address, SuccessId, Amount, PathCid
}

// GetPrivate 获取后台配置的私钥以及私钥地址
func (e *SysWorks) GetPrivate() (*ecdsa.PrivateKey, common.Address, error) {
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

// GetIpfsConfig 获取ipfs配置
func (e *SysWorks) GetIpfsConfig() *models.SysContractIpfsConfig {
	var object = new(models.SysContractIpfsConfig)
	e.Orm.Raw("SELECT (SELECT config_value FROM sys_config WHERE config_key='ipfs_url') AS ipfs_url,(SELECT config_value FROM sys_config WHERE config_key='ipfs_ip') AS ipfs_ip,(SELECT config_value FROM sys_config WHERE config_key='ipfs_port') AS ipfs_port FROM sys_config WHERE config_key LIKE 'ipfs%' GROUP BY ipfs_url,ipfs_ip,ipfs_port").Scan(object)
	return object
}
