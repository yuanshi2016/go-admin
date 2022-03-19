package dto

import (
	"go-admin/app/admin/models"
	"go-admin/common/dto"
	common "go-admin/common/models"
	"time"
)

type SysPrivatekeyGetPageReq struct {
	dto.Pagination `search:"-"`
	SysPrivatekeyOrder
}

type SysPrivatekeyOrder struct {
	Id         int       `form:"idOrder"  search:"type:order;column:id;table:sys_privatekey"`
	Privatekey string    `form:"privatekeyOrder"  search:"type:order;column:privatekey;table:sys_privatekey"`
	Address    string    `form:"addressOrder"  search:"type:order;column:address;table:sys_privatekey"`
	IsDel      string    `form:"isDelOrder"  search:"type:order;column:is_del;table:sys_privatekey"`
	CreatedAt  time.Time `form:"createdAtOrder"  search:"type:order;column:created_at;table:sys_privatekey"`
	UpdatedAt  time.Time `form:"updatedAtOrder"  search:"type:order;column:updated_at;table:sys_privatekey"`
	DeletedAt  time.Time `form:"deletedAtOrder"  search:"type:order;column:deleted_at;table:sys_privatekey"`
	CreateBy   string    `form:"createByOrder"  search:"type:order;column:create_by;table:sys_privatekey"`
	UpdateBy   string    `form:"updateByOrder"  search:"type:order;column:update_by;table:sys_privatekey"`
}

func (m *SysPrivatekeyGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysPrivatekeyInsertReq struct {
	Id         int    `json:"-" comment:""` //
	Privatekey string `json:"privatekey" comment:"私钥"`
	Address    string `json:"address" comment:"以太坊地址"`
	IsDel      string `json:"isDel" comment:""`
	common.ControlBy
}

func (s *SysPrivatekeyInsertReq) Generate(model *models.SysPrivatekey) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Privatekey = s.Privatekey
	model.Address = s.Address
	model.IsDel = s.IsDel
}

func (s *SysPrivatekeyInsertReq) GetId() interface{} {
	return s.Id
}

type SysPrivatekeyUpdateReq struct {
	Id         int    `uri:"id" comment:""` //
	Privatekey string `json:"privatekey" comment:"私钥"`
	Address    string `json:"address" comment:"以太坊地址"`
	IsDel      string `json:"isDel" comment:""`
	common.ControlBy
}

func (s *SysPrivatekeyUpdateReq) Generate(model *models.SysPrivatekey) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Privatekey = s.Privatekey
	model.Address = s.Address
	model.IsDel = s.IsDel
}

func (s *SysPrivatekeyUpdateReq) GetId() interface{} {
	return s.Id
}

// SysPrivatekeyGetReq 功能获取请求参数
type SysPrivatekeyGetReq struct {
	Id int `uri:"id"`
}

func (s *SysPrivatekeyGetReq) GetId() interface{} {
	return s.Id
}

// SysPrivatekeyDeleteReq 功能删除请求参数
type SysPrivatekeyDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysPrivatekeyDeleteReq) GetId() interface{} {
	return s.Ids
}

// SysPrivatekeyApprovalForAllReq 操作员授权
type SysPrivatekeyApprovalForAllReq struct {
	Id int `json:"id"`
}

func (s *SysPrivatekeyApprovalForAllReq) GetId() interface{} {
	return s.Id
}
