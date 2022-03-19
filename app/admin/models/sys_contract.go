package models

import (
	// "gorm.io/gorm"

	"go-admin/common/models"
)

type SysContractJoin struct {
	SysNetwork
	Address string `json:"address"`
}
type SysContract struct {
	models.Model

	Name        string `json:"name" gorm:"type:varchar(255);comment:name"`
	Symbol      string `json:"symbol" gorm:"type:varchar(255);comment:symbol"`
	Address     string `json:"address" gorm:"type:varchar(255);comment:合约地址"`
	Type        string `json:"type" gorm:"type:int(3);comment:合约类型"`
	NetworkId   string `json:"networkId" gorm:"type:int(11);comment:主网类型"`
	Verify      string `json:"verify" gorm:"type:blob;comment:是否验证"`
	Description string `json:"description" gorm:"type:varchar(255);comment:描述"`
	IsDel       string `json:"isDel" gorm:"type:blob;comment:软删除"`
	models.ModelTime
	models.ControlBy
}

func (SysContract) TableName() string {
	return "sys_contract"
}

func (e *SysContract) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *SysContract) GetId() interface{} {
	return e.Id
}
