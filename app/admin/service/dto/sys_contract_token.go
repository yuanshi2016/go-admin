package dto

import (
	"encoding/json"
	"go-admin/app/admin/models"
	"go-admin/common/dto"
	common "go-admin/common/models"

	"time"
)

type SysContractTokenGetPageReq struct {
	dto.Pagination `search:"-"`
	Name           int    `form:"name"  search:"type:exact;column:name;table:works" comment:"作品名称"`
	CopyrightOwner int    `form:"copyrightOwner"  search:"type:exact;column:copyright_owner;table:works" comment:"版权方"`
	BeginTime      string `form:"beginTime" search:"type:gte;column:issuer_date;table:works" comment:"创建时间"`
	EndTime        string `form:"endTime" search:"type:lte;column:issuer_date;table:works" comment:"创建时间"`
	SysContractTokenOrder
}

type SysContractTokenOrder struct {
	Id              int       `form:"idOrder"  search:"type:order;column:id;table:sys_contract_token"`
	TokenId         int       `form:"tokenIdOrder"  search:"type:order;column:token_id;table:sys_contract_token"`
	TransferAddress string    `form:"transferAddress" search:"type:order;column:transfer_address;table:sys_contract_token"`
	TransferTx      string    `form:"transferTx" search:"type:order;column:transfer_tx;table:sys_contract_token"`
	MetadataContent string    `form:"metadataContentOrder"  search:"type:order;column:metadata_content;table:sys_contract_token"`
	IsSync          string    `form:"isSyncOrder"  search:"type:order;column:is_sync;table:works"`
	IsDel           string    `form:"isDelOrder"  search:"type:order;column:is_del;table:sys_contract_token"`
	TokenCid        string    `form:"tokenCid"  search:"type:order;column:token_cid;table:sys_contract_token"`
	CreatedAt       time.Time `form:"createdAtOrder"  search:"type:order;column:created_at;table:sys_contract_token"`
	UpdatedAt       time.Time `form:"updatedAtOrder"  search:"type:order;column:updated_at;table:sys_contract_token"`
	DeletedAt       time.Time `form:"deletedAtOrder"  search:"type:order;column:deleted_at;table:sys_contract_token"`
	CreateBy        string    `form:"createByOrder"  search:"type:order;column:create_by;table:sys_contract_token"`
	UpdateBy        string    `form:"updateByOrder"  search:"type:order;column:update_by;table:sys_contract_token"`
}

func (m *SysContractTokenGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysContractTokenToMitReq struct {
	Ids []int `json:"ids"`
}

func (s *SysContractTokenToMitReq) GetId() interface{} {
	return s.Ids
}

type SysContractTokenTransferReq struct {
	Ids []int  `json:"ids"`
	Tx  string `json:"tx"`
}

func (s *SysContractTokenTransferReq) GetId() interface{} {
	return s.Ids
}
func (s *SysContractTokenTransferReq) Generate(model *models.SysContractToken, service *models.SysContractTokenTransfer) {
	model.TokenId = 1 // 库存初始值为发行值
	model.WorksId = 1 // 库存初始值为发行值
	model.Stock = service.Stock - 1
	model.MetadataContent = service.MetadataContent
	model.TransferAddress = service.TransferAddress
	model.TransferTx = service.TransferTx
	model.IsDel = service.IsDel
	model.CreateBy = service.CreateBy
	model.UpdateBy = service.UpdateBy
}

type SysContractTokenInsertReq struct {
	Id              int    `json:"-" comment:""` //
	WorksId         int    `json:"worksId" comment:"作品ID"`
	TokenId         int    `json:"tokenId" comment:"TokenID"`
	TokenCid        string `json:"tokenCid" comment:"TokenCid"`
	Stock           int    `json:"stock" comment:"库存"`
	TransferAddress string `json:"transferAddress" comment:"待转移地址"`
	TransferTx      string `json:"transferTx" comment:"转移hash"`
	MetadataContent string `json:"metadataContent" comment:"资源内容"`
	IsSync          int    `json:"isSync" comment:"是否已发布"`
	IsDel           string `json:"isDel" comment:"IsDel"`
	common.ControlBy
}

func (s *SysContractTokenInsertReq) Tojson() string {
	data, _ := json.Marshal(s)
	return string(data)
}
func (s *SysContractTokenInsertReq) Generate(model *models.SysContractToken) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.TokenId = s.TokenId // 库存初始值为发行值
	model.WorksId = s.WorksId // 库存初始值为发行值
	model.Stock = 1           // 库存初始值为发行值
	model.MetadataContent = s.MetadataContent
	model.TransferAddress = s.TransferAddress
	model.TransferTx = s.TransferTx
	model.IsDel = s.IsDel
	model.CreateBy = s.CreateBy
	model.UpdateBy = s.UpdateBy
}

func (s *SysContractTokenInsertReq) GetId() interface{} {
	return s.TokenId
}

type SysContractTokenUpdateReq struct {
	Id              int    `uri:"id" comment:""` //
	WorksId         int    `json:"worksId" comment:"作品ID"`
	TokenId         int    `json:"tokenId" comment:"TokenID"`
	Stock           int    `json:"stock" comment:"库存"`
	TransferAddress string `json:"transferAddress" comment:"待转移地址"`
	TransferTx      string `json:"transferTx" comment:"转移hash"`
	MetadataContent string `json:"metadataContent" comment:"资源内容"`
	IsSync          int    `json:"isSync" comment:"是否已发布"`
	IsDel           string `json:"isDel" comment:"IsDel"`
	TokenCid        string `json:"tokenCid" comment:"TokenCid"`
	common.ControlBy
}

func (s *SysContractTokenUpdateReq) Generate(model *models.SysContractToken) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.TokenId = s.TokenId // 库存初始值为发行值
	model.WorksId = s.WorksId // 库存初始值为发行值
	model.Stock = s.Stock     // 库存初始值为发行值
	model.MetadataContent = s.MetadataContent
	model.TransferAddress = s.TransferAddress
	model.TransferTx = s.TransferTx
	model.IsDel = s.IsDel
	model.CreateBy = s.CreateBy
	model.UpdateBy = s.UpdateBy
}

func (s *SysContractTokenUpdateReq) GetId() interface{} {
	return s.Id
}

// SysContractTokenGetReq 功能获取请求参数
type SysContractTokenGetReq struct {
	Id         int `uri:"id"`
	ContractId int `uri:"contractId"`
	TokenId    int `uri:"tokenId"`
}

func (s *SysContractTokenGetReq) GetId() interface{} {
	return s.Id
}

// SysContractTokenDeleteReq 功能删除请求参数
type SysContractTokenDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysContractTokenDeleteReq) GetId() interface{} {
	return s.Ids
}
