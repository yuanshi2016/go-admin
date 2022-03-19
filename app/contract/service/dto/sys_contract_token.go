package dto

import (
	"go-admin/app/contract/models"
	"go-admin/common/dto"
	common "go-admin/common/models"

	"time"
)

type SysContractTokenGetPageReq struct {
	dto.Pagination `search:"-"`
	ContractId     int    `form:"contractId"  search:"type:exact;column:contract_id;table:sys_contract_token" comment:"合约id"`
	TokenId        int    `form:"tokenId"  search:"type:exact;column:token_id;table:sys_contract_token" comment:"TokenID"`
	Amount         string `form:"amount"  search:"type:exact;column:amount;table:sys_contract_token" comment:"数量"`
	Creator        string `form:"creator"  search:"type:exact;column:creator;table:sys_contract_token" comment:"拥有者"`
	SysContractTokenOrder
}

type SysContractTokenOrder struct {
	Id              int       `form:"idOrder"  search:"type:order;column:id;table:sys_contract_token"`
	ContractId      int       `form:"contractIdOrder"  search:"type:order;column:contract_id;table:sys_contract_token"`
	TokenId         int       `form:"tokenIdOrder"  search:"type:order;column:token_id;table:sys_contract_token"`
	Amount          string    `form:"amountOrder"  search:"type:order;column:amount;table:sys_contract_token"`
	Name            string    `form:"nameOrder"  search:"type:order;column:name;table:sys_contract_token"`
	Description     string    `form:"descriptionOrder"  search:"type:order;column:description;table:sys_contract_token"`
	Properties      string    `form:"propertiesOrder"  search:"type:order;column:properties;table:sys_contract_token"`
	ImgUrl          string    `form:"imgUrlOrder"  search:"type:order;column:img_url;table:sys_contract_token"`
	Creator         string    `form:"creatorOrder"  search:"type:order;column:creator;table:sys_contract_token"`
	TxHash          string    `form:"txHashOrder"  search:"type:order;column:tx_hash;table:sys_contract_token"`
	MetadataUrl     string    `form:"metadataUrlOrder"  search:"type:order;column:metadata_url;table:sys_contract_token"`
	MetadataContent string    `form:"metadataContentOrder"  search:"type:order;column:metadata_content;table:sys_contract_token"`
	IsSync          string    `form:"isSyncOrder"  search:"type:order;column:is_sync;table:sys_contract_token"`
	IsDel           string    `form:"isDelOrder"  search:"type:order;column:is_del;table:sys_contract_token"`
	CreatedAt       time.Time `form:"createdAtOrder"  search:"type:order;column:created_at;table:sys_contract_token"`
	UpdatedAt       time.Time `form:"updatedAtOrder"  search:"type:order;column:updated_at;table:sys_contract_token"`
	DeletedAt       time.Time `form:"deletedAtOrder"  search:"type:order;column:deleted_at;table:sys_contract_token"`
	CreateBy        string    `form:"createByOrder"  search:"type:order;column:create_by;table:sys_contract_token"`
	UpdateBy        string    `form:"updateByOrder"  search:"type:order;column:update_by;table:sys_contract_token"`
}

func (m *SysContractTokenGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysContractTokenInsertReq struct {
	Id              int    `json:"-" comment:""`        //
	ContractId      int    `json:"-" comment:"合约id"`    // 合约id
	TokenId         int    `json:"-" comment:"TokenID"` // TokenID
	Amount          string `json:"amount" comment:"数量"`
	Name            string `json:"name" comment:"名称"`
	Description     string `json:"description" comment:"描述"`
	Properties      string `json:"properties" comment:"属性"`
	ImgUrl          string `json:"imgUrl" comment:"图标地址"`
	Creator         string `json:"creator" comment:"拥有者"`
	TxHash          string `json:"txHash" comment:"区块hash"`
	MetadataUrl     string `json:"metadataUrl" comment:"资源url"`
	MetadataContent string `json:"metadataContent" comment:"资源内容"`
	IsSync          string `json:"isSync" comment:"铸币状态"`
	IsDel           string `json:"isDel" comment:""`
	common.ControlBy
}

func (s *SysContractTokenInsertReq) Generate(model *models.SysContractToken) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	if s.ContractId == 0 {
		model.Model = common.Model{ContractId: s.ContractId}
	}
	if s.TokenId == 0 {
		model.Model = common.Model{TokenId: s.TokenId}
	}
	model.Amount = s.Amount
	model.Name = s.Name
	model.Description = s.Description
	model.Properties = s.Properties
	model.ImgUrl = s.ImgUrl
	model.Creator = s.Creator
	model.TxHash = s.TxHash
	model.MetadataUrl = s.MetadataUrl
	model.MetadataContent = s.MetadataContent
	model.IsSync = s.IsSync
	model.IsDel = s.IsDel
}

func (s *SysContractTokenInsertReq) GetId() interface{} {
	return s.TokenId
}

type SysContractTokenUpdateReq struct {
	Id              int    `uri:"id" comment:""`             //
	ContractId      int    `uri:"contractId" comment:"合约id"` // 合约id
	TokenId         int    `uri:"tokenId" comment:"TokenID"` // TokenID
	Amount          string `json:"amount" comment:"数量"`
	Name            string `json:"name" comment:"名称"`
	Description     string `json:"description" comment:"描述"`
	Properties      string `json:"properties" comment:"属性"`
	ImgUrl          string `json:"imgUrl" comment:"图标地址"`
	Creator         string `json:"creator" comment:"拥有者"`
	TxHash          string `json:"txHash" comment:"区块hash"`
	MetadataUrl     string `json:"metadataUrl" comment:"资源url"`
	MetadataContent string `json:"metadataContent" comment:"资源内容"`
	IsSync          string `json:"isSync" comment:"铸币状态"`
	IsDel           string `json:"isDel" comment:""`
	common.ControlBy
}

func (s *SysContractTokenUpdateReq) Generate(model *models.SysContractToken) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	if s.ContractId == 0 {
		model.Model = common.Model{ContractId: s.ContractId}
	}
	if s.TokenId == 0 {
		model.Model = common.Model{TokenId: s.TokenId}
	}
	model.Amount = s.Amount
	model.Name = s.Name
	model.Description = s.Description
	model.Properties = s.Properties
	model.ImgUrl = s.ImgUrl
	model.Creator = s.Creator
	model.TxHash = s.TxHash
	model.MetadataUrl = s.MetadataUrl
	model.MetadataContent = s.MetadataContent
	model.IsSync = s.IsSync
	model.IsDel = s.IsDel
}

func (s *SysContractTokenUpdateReq) GetId() interface{} {
	return s.TokenId
}

// SysContractTokenGetReq 功能获取请求参数
type SysContractTokenGetReq struct {
	Id         int `uri:"id"`
	ContractId int `uri:"contractId"`
	TokenId    int `uri:"tokenId"`
}

func (s *SysContractTokenGetReq) GetId() interface{} {
	return s.TokenId
}

// SysContractTokenDeleteReq 功能删除请求参数
type SysContractTokenDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysContractTokenDeleteReq) GetId() interface{} {
	return s.Ids
}
