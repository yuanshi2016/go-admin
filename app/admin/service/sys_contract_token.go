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
	"github.com/go-admin-team/go-admin-core/sdk/service"
	"go-admin/app/admin/models"
	"go-admin/app/admin/service/contract"
	"go-admin/app/admin/service/dto"
	"go-admin/common/actions"
	cDto "go-admin/common/dto"
	"gorm.io/gorm"
	"math/big"
	"strings"
)

type SysContractToken struct {
	service.Service
}

// GetPage 获取SysContractToken列表
func (e *SysContractToken) GetPage(c *dto.SysContractTokenGetPageReq, p *actions.DataPermission, list *[]models.SysContractTokenJoin, count *int64) error {
	var err error
	var data models.SysContractToken
	err = e.Orm.Model(&data).
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Select("sys_contract_token.*,pkey.address as base_address,works.img_url,works.name,works.token_cid,works.is_sync,works.tx_hash,works.issuer_date,works.copyright_owner,sysuser.nick_name as create_name,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
		Joins("JOIN sys_works works on works.id = sys_contract_token.works_id ").
		Joins("JOIN sys_contract contract on works.contract_id = contract.id ", nil).
		Joins("JOIN sys_network network on contract.network_id = network.id ").
		Joins("JOIN sys_user sysuser on works.create_by = sysuser.user_id ").
		Joins("JOIN sys_privatekey pkey on pkey.id = works.privatekey_id ").
		Order("id desc").
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		e.Log.Errorf("SysContractTokenService GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取SysContractToken对象
func (e *SysContractToken) Get(d *dto.SysContractTokenGetReq, p *actions.DataPermission, model *models.SysContractTokenJoin) error {
	var data models.SysContractToken

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		Select("sys_contract_token.*,pkey.address as base_address,works.img_url,works.name,works.token_cid,works.is_sync,works.tx_hash,works.issuer_date,works.copyright_owner,sysuser.nick_name as create_name,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
		Joins("JOIN sys_works works on works.id = sys_contract_token.works_id ").
		Joins("JOIN sys_contract contract on works.contract_id = contract.id ", nil).
		Joins("JOIN sys_network network on contract.network_id = network.id ").
		Joins("JOIN sys_user sysuser on works.create_by = sysuser.user_id ").
		Joins("JOIN sys_privatekey pkey on pkey.id = works.privatekey_id ").
		First(&model, d.GetId()).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetSysContractToken error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建SysContractToken对象
func (e *SysContractToken) Insert(c *dto.SysContractTokenInsertReq, p *actions.DataPermission) (err error) {
	var data models.SysContractToken
	//查看作品是否存在
	var worksinfo = models.SysWorksJoin{}
	err = e.Orm.Raw("select * form sys_works where id = ?", c.WorksId).First(&worksinfo).Error
	if err != nil {
		err = errors.New("未找到到该作品")
		e.Log.Errorf("Service GetSysContractToken error:%s \r\n", err)
		return err
	}
	c.Generate(&data)
	err = e.Orm.Transaction(func(tx *gorm.DB) error {
		//按照发行数量 实际添加X条
		for i := 0; i < worksinfo.Quantity; i++ {
			data.Id = 0
			if err := tx.Create(&data).Error; err != nil {
				// 回滚事务
				return err
			}
		}
		return nil
	})
	//err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Errorf("SysContractTokenService Insert error:%s \r\n", err)
		return err
	}
	return nil
}

// Update 修改SysContractToken对象
func (e *SysContractToken) Update(c *dto.SysContractTokenUpdateReq, p *actions.DataPermission) (err error) {
	var data = models.SysContractToken{}
	e.Orm.Scopes(
		actions.Permission(data.TableName(), p),
	).First(&data, c.GetId())
	c.Generate(&data)

	//检查如果转移地址不为空的话  需要效验地址
	if !common.IsHexAddress(data.TransferAddress) && len(data.TransferAddress) > 0 {
		return errors.New("待转移地址效验错误")
	}
	db := e.Orm.Save(&data)
	if db.Error != nil {
		e.Log.Errorf("SysContractTokenService Save error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysContractToken
func (e *SysContractToken) Remove(d *dto.SysContractTokenDeleteReq, p *actions.DataPermission) error {
	var data models.SysContractToken

	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysContractToken error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权删除该数据")
	}
	return nil
}

// Transfer 代币转移
func (e *SysContractToken) Transfer(c *dto.SysContractTokenTransferReq, p *actions.DataPermission) (hash []models.SysContractTokenToMitReturn, err error) {
	var data []models.SysContractTokenJoin
	group := make(models.SysContractTokenToMitGroup)
	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(models.TableName(), p),
		).
		Select("sys_contract_token.*,pkey.address as base_address,works.name,works.token_id,works.token_cid,works.is_sync,works.tx_hash,works.issuer_date,works.copyright_owner,sysuser.nick_name as create_name,contract.address as contract_address,contract.name as contract_name,network.chain_id,network.rpc_url,network.block_url,network.ipfs_bind_dir,network.name as network_name").
		Joins("JOIN sys_works works on works.id = sys_contract_token.works_id ").
		Joins("JOIN sys_contract contract on works.contract_id = contract.id ", nil).
		Joins("JOIN sys_network network on contract.network_id = network.id ").
		Joins("JOIN sys_user sysuser on works.create_by = sysuser.user_id ").
		Joins("JOIN sys_privatekey pkey on pkey.id = works.privatekey_id ").
		Where("works.is_sync = 2 and sys_contract_token.stock > 0 and  sys_contract_token.id in (?)", c.GetId()).
		Find(&data)
	if db.RowsAffected == 0 {
		return []models.SysContractTokenToMitReturn{}, errors.New("未查询到所选代币信息")
	}
	for _, token := range data {
		if _, ok := group[token.ContractAddress]; !ok {
			group[token.ContractAddress] = &models.SysContractTokenToMitInfo{}
		}
		group[token.ContractAddress].TokenInfo = append(group[token.ContractAddress].TokenInfo, token)
		//接受地址
		group[token.ContractAddress].Address = append(group[token.ContractAddress].Address, common.HexToAddress(token.TransferAddress))
		//管理地址
		group[token.ContractAddress].BaseAddress = append(group[token.ContractAddress].BaseAddress, common.HexToAddress(token.BaseAddress))
		group[token.ContractAddress].TokenAmount = append(group[token.ContractAddress].TokenAmount, big.NewInt(1))
		group[token.ContractAddress].TokenId = append(group[token.ContractAddress].TokenId, big.NewInt(int64(token.TokenId)))
		group[token.ContractAddress].RpcUrl = token.RpcUrl
		group[token.ContractAddress].ChainId = token.ChainId
		group[token.ContractAddress].BlockUrl = token.BlockUrl
	}
	//return []models.SysContractTokenToMitReturn{},errors.New(group.ToJson())
	//Private, BaseAddress, err := e.GetPrivate()
	return e.SafeBatchTransferFrom(group)
}
func (e *SysContractToken) SafeBatchTransferFrom(TokenGroup models.SysContractTokenToMitGroup) (hash []models.SysContractTokenToMitReturn, err error) {
	Private, _, err := e.GetPrivate()
	for ContractAddress, info := range TokenGroup {
		Ids := strings.Replace(strings.Trim(fmt.Sprint(info.TokenId), "[]"), " ", ",", -1)
		TxAddress := strings.Replace(strings.Trim(fmt.Sprint(info.Address), "[]"), " ", ",", -1)
		rpcDial, _ := rpc.Dial(info.RpcUrl)
		//效验是否铸币
		for _, mit := range info.TokenInfo {
			switch mit.IsSync {
			case 0:
				return hash, errors.New(fmt.Sprintf("tokenId：%v,未铸币", mit.TokenId))
				break
			case 1:
				return hash, errors.New(fmt.Sprintf("tokenId：%v,铸币中", mit.TokenId))
				break
			}

		}
		//批量检查是否线上余额充足
		client := ethclient.NewClient(rpcDial)
		ContractClient, _ := contract.NewHemaNft(common.HexToAddress(ContractAddress), client)
		balance, err := ContractClient.BalanceOfBatch(nil, info.BaseAddress, info.TokenId)
		for i, b := range balance {
			if b.Int64() < 1 {
				return hash, errors.New(fmt.Sprintf("管理员地址->TokenID: %v,余额不足", info.TokenInfo[i].TokenId))
			}
		}
		//待转移地址效验
		for index, address := range info.Address {
			if !common.IsHexAddress(address.Hex()) || address.String() == "0x0000000000000000000000000000000000000000" {
				return hash, errors.New(fmt.Sprintf("编号为%v,待转移地址%s,效验失败!\r\n请设置转移地址", info.TokenInfo[index].Id, address.String()))
			}
		}
		//私钥签名效验
		auth, err := bind.NewKeyedTransactorWithChainID(Private, big.NewInt(int64(info.ChainId)))
		if err != nil {
			return hash, errors.New(fmt.Sprintf("私钥签名失败,请联系管理员!"))
		}
		_tx, err := ContractClient.AdminBatchTransferFrom(auth, info.BaseAddress, info.Address, info.TokenId, info.TokenAmount, nil)
		if err != nil {
			return hash, err
		}
		hash = append(hash, models.SysContractTokenToMitReturn{
			Tx:       _tx.Hash().String(),
			BlockUrl: info.BlockUrl,
		})
		e.Orm.Raw(fmt.Sprintf("update %s set transfer_tx='%s',stock=stock-1 where stock > 0 and  token_id in ('%s') and transfer_address in ('%s')", models.TableName(), _tx.Hash().Hex(), Ids, TxAddress)).Scan(nil)
	}
	return hash, err
}

// CheckTokenAmount 检查地址余额是否充足
func (e *SysContractToken) CheckTokenAmount(data *models.SysContractTokenToMit) (*contract.HemaNft, error) {
	_, BaseAddress, err := e.GetPrivate()
	rpcDial, err := rpc.Dial(data.RpcUrl)
	if err != nil {
		panic(err)
		return &contract.HemaNft{}, err
	}
	client := ethclient.NewClient(rpcDial)
	ContractClient, _ := contract.NewHemaNft(common.HexToAddress(data.ContractAddress), client)
	Balance, err := ContractClient.BalanceOf(nil, BaseAddress, big.NewInt(int64(data.TokenId)))
	if Balance.Int64() < 1 {
		return ContractClient, errors.New("该地址链上余额不足")
	}
	return ContractClient, err
}

// GetPrivate 获取后台配置的私钥以及私钥地址
func (e *SysContractToken) GetPrivate() (*ecdsa.PrivateKey, common.Address, error) {
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
func (e *SysContractToken) GetIpfsConfig() *models.SysContractIpfsConfig {
	var object = new(models.SysContractIpfsConfig)
	e.Orm.Raw("SELECT (SELECT config_value FROM sys_config WHERE config_key='ipfs_url') AS ipfs_url,(SELECT config_value FROM sys_config WHERE config_key='ipfs_ip') AS ipfs_ip,(SELECT config_value FROM sys_config WHERE config_key='ipfs_port') AS ipfs_port FROM sys_config WHERE config_key LIKE 'ipfs%' GROUP BY ipfs_url,ipfs_ip,ipfs_port").Scan(object)
	return object
}
