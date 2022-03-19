package dto

import (
	"go-admin/app/contract/models"
	"go-admin/common/dto"
	common "go-admin/common/models"

	"time"
)

type SysContractGetPageReq struct {
	dto.Pagination `search:"-"`
	Name           string `form:"name"  search:"type:exact;column:name;table:sys_contract" comment:"name"`
	Symbol         string `form:"symbol"  search:"type:exact;column:symbol;table:sys_contract" comment:"symbol"`
	Type           string `form:"type"  search:"type:exact;column:type;table:sys_contract" comment:"合约类型"`
	NetworkId      string `form:"networkId"  search:"type:exact;column:network_id;table:sys_contract" comment:"主网类型"`
	SysContractOrder
}

type SysContractOrder struct {
	Id          int       `form:"idOrder"  search:"type:order;column:id;table:sys_contract"`
	Name        string    `form:"nameOrder"  search:"type:order;column:name;table:sys_contract"`
	Symbol      string    `form:"symbolOrder"  search:"type:order;column:symbol;table:sys_contract"`
	Address     string    `form:"addressOrder"  search:"type:order;column:address;table:sys_contract"`
	Type        string    `form:"typeOrder"  search:"type:order;column:type;table:sys_contract"`
	NetworkId   string    `form:"networkIdOrder"  search:"type:order;column:network_id;table:sys_contract"`
	Verify      string    `form:"verifyOrder"  search:"type:order;column:verify;table:sys_contract"`
	Description string    `form:"descriptionOrder"  search:"type:order;column:description;table:sys_contract"`
	IsDel       string    `form:"isDelOrder"  search:"type:order;column:is_del;table:sys_contract"`
	CreatedAt   time.Time `form:"createdAtOrder"  search:"type:order;column:created_at;table:sys_contract"`
	UpdatedAt   time.Time `form:"updatedAtOrder"  search:"type:order;column:updated_at;table:sys_contract"`
	DeletedAt   time.Time `form:"deletedAtOrder"  search:"type:order;column:deleted_at;table:sys_contract"`
	CreateBy    string    `form:"createByOrder"  search:"type:order;column:create_by;table:sys_contract"`
	UpdateBy    string    `form:"updateByOrder"  search:"type:order;column:update_by;table:sys_contract"`
}

func (m *SysContractGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysContractInsertReq struct {
	Id          int    `json:"-" comment:""` //
	Name        string `json:"name" comment:"name"`
	Symbol      string `json:"symbol" comment:"symbol"`
	Address     string `json:"address" comment:"合约地址"`
	Type        string `json:"type" comment:"合约类型"`
	NetworkId   string `json:"networkId" comment:"主网类型"`
	Verify      string `json:"verify" comment:"是否验证"`
	Description string `json:"description" comment:"描述"`
	IsDel       string `json:"isDel" comment:"软删除"`
	common.ControlBy
}

func (s *SysContractInsertReq) Generate(model *models.SysContract) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Name = s.Name
	model.Symbol = s.Symbol
	model.Address = s.Address
	model.Type = s.Type
	model.NetworkId = s.NetworkId
	model.Verify = s.Verify
	model.Description = s.Description
	model.IsDel = s.IsDel
}

func (s *SysContractInsertReq) GetId() interface{} {
	return s.Id
}

type SysContractUpdateReq struct {
	Id          int    `uri:"id" comment:""` //
	Name        string `json:"name" comment:"name"`
	Symbol      string `json:"symbol" comment:"symbol"`
	Address     string `json:"address" comment:"合约地址"`
	Type        string `json:"type" comment:"合约类型"`
	NetworkId   string `json:"networkId" comment:"主网类型"`
	Verify      string `json:"verify" comment:"是否验证"`
	Description string `json:"description" comment:"描述"`
	IsDel       string `json:"isDel" comment:"软删除"`
	common.ControlBy
}

func (s *SysContractUpdateReq) Generate(model *models.SysContract) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Name = s.Name
	model.Symbol = s.Symbol
	model.Address = s.Address
	model.Type = s.Type
	model.NetworkId = s.NetworkId
	model.Verify = s.Verify
	model.Description = s.Description
	model.IsDel = s.IsDel
}

func (s *SysContractUpdateReq) GetId() interface{} {
	return s.Id
}

// SysContractGetReq 功能获取请求参数
type SysContractGetReq struct {
	Id int `uri:"id"`
}

func (s *SysContractGetReq) GetId() interface{} {
	return s.Id
}

// SysContractDeleteReq 功能删除请求参数
type SysContractDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysContractDeleteReq) GetId() interface{} {
	return s.Ids
}
