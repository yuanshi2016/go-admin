package models

import (
	// "gorm.io/gorm"

	"go-admin/common/models"
)

type SysNetwork struct {
	models.Model

	Name        string `json:"name" gorm:"type:varchar(255);comment:网络名称"`
	RpcUrl      string `json:"rpcUrl" gorm:"type:varchar(255);comment:RPC地址"`
	ChainId     string `json:"chainId" gorm:"type:int(11);comment:链ID"`
	Symbol      string `json:"symbol" gorm:"type:varchar(255);comment:代币名称"`
	BlockUrl    string `json:"blockUrl" gorm:"type:varchar(255);comment:区块浏览器"`
	IpfsBindDir string `json:"ipfsBindDir" gorm:"type:varchar(255);comment:IPFS目录"`
	IpfsCid     string `json:"ipfsCid" gorm:"type:varchar(255);comment:IPFSCid"`
	IpfsIsPush  int    `json:"ipfsIsPush" gorm:"type:blob;comment:IPFS初始化"`
	IsDel       string `json:"isDel" gorm:"type:blob;comment:IsDel"`
	models.ModelTime
	models.ControlBy
}

func (SysNetwork) TableName() string {
	return "sys_network"
}

func (e *SysNetwork) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *SysNetwork) GetId() interface{} {
	return e.Id
}
