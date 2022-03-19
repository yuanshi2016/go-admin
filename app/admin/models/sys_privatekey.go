package models

import (
	// "gorm.io/gorm"

	"go-admin/common/models"
)

type SysPrivatekey struct {
	models.Model
	Privatekey string `json:"privatekey" gorm:"type:varchar(255);comment:私钥"`
	Address    string `json:"address" gorm:"type:varchar(255);comment:以太坊地址"`
	IsDel      string `json:"isDel" gorm:"type:blob;comment:IsDel"`
	models.ModelTime
	models.ControlBy
}
type SysPrivatekeyGuest struct {
	models.Model
	Address string `json:"address" gorm:"type:varchar(255);comment:以太坊地址"`
	IsDel   string `json:"isDel" gorm:"type:blob;comment:IsDel"`
	models.ModelTime
	models.ControlBy
}
type SysPrivatekeyReturn struct {
	Tx       string `json:"tx"`
	BlockUrl string `json:"blockUrl"`
	Title    string `json:"title"`
}

func (SysPrivatekey) TableName() string {
	return "sys_privatekey"
}

func (e *SysPrivatekey) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *SysPrivatekey) GetId() interface{} {
	return e.Id
}
