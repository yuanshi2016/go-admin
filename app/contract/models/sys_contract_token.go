package models

import (
	// "gorm.io/gorm"

	"go-admin/common/models"
)

type SysContractToken struct {
	models.Model

	Amount          string `json:"amount" gorm:"type:int(11);comment:数量"`
	Name            string `json:"name" gorm:"type:varchar(255);comment:名称"`
	Description     string `json:"description" gorm:"type:text;comment:描述"`
	Properties      string `json:"properties" gorm:"type:varchar(255);comment:属性"`
	ImgUrl          string `json:"imgUrl" gorm:"type:varchar(255);comment:图标地址"`
	Creator         string `json:"creator" gorm:"type:varchar(255);comment:拥有者"`
	TxHash          string `json:"txHash" gorm:"type:varchar(255);comment:区块hash"`
	MetadataUrl     string `json:"metadataUrl" gorm:"type:varchar(255);comment:资源url"`
	MetadataContent string `json:"metadataContent" gorm:"type:varchar(255);comment:资源内容"`
	IsSync          string `json:"isSync" gorm:"type:blob;comment:铸币状态"`
	IsDel           string `json:"isDel" gorm:"type:blob;comment:IsDel"`
	models.ModelTime
	models.ControlBy
}

func (SysContractToken) TableName() string {
	return "sys_contract_token"
}

func (e *SysContractToken) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *SysContractToken) GetId() interface{} {
	return e.TokenId
}
