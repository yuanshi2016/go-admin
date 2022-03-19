package dto

import (
	"go-admin/app/admin/models"
	"go-admin/common/dto"
	common "go-admin/common/models"
	"strconv"

	"time"
)

type SysWorksGetPageReq struct {
	dto.Pagination `search:"-"`
	Name           string `form:"name"  search:"type:contains;column:name;table:sys_works" comment:"名称"`
	CopyrightOwner string `form:"copyrightOwner"  search:"type:contains;column:copyright_owner;table:sys_works" comment:"版权方"`
	Author         string `form:"author"  search:"type:contains;column:author;table:sys_works" comment:"著作人"`
	Issuer         string `form:"issuer"  search:"type:contains;column:issuer;table:sys_works" comment:"发行方"`
	BeginTime      string `form:"beginTime" search:"type:gte;column:issuer_date;table:sys_works" comment:"创建时间"`
	EndTime        string `form:"endTime" search:"type:lte;column:issuer_date;table:sys_works" comment:"创建时间"`
	SysWorksOrder
}

type SysWorksOrder struct {
	Id              int       `form:"idOrder"  search:"type:order;column:id;table:sys_works"`
	ContractId      int       `form:"contractIdOrder"  search:"type:order;column:contract_id;table:sys_works"`
	PrivatekeyId    int       `form:"privatekeyIdOrder"  search:"type:order;column:privatekey_id;table:sys_works"`
	NetworkId       int       `form:"networkIdOrder"  search:"type:order;column:network_id;table:sys_works"`
	Quantity        int       `form:"quantityOrder"  search:"type:order;column:quantity;table:sys_works"`
	IsSync          int       `form:"is_sync"  search:"type:order;column:is_sync;table:sys_works"`
	Name            string    `form:"nameOrder"  search:"type:order;column:name;table:sys_works"`
	Description     string    `form:"descriptionOrder"  search:"type:order;column:description;table:sys_works"`
	Properties      string    `form:"propertiesOrder"  search:"type:order;column:properties;table:sys_works"`
	ImgUrl          string    `form:"imgUrlOrder"  search:"type:order;column:img_url;table:sys_works"`
	TxHash          string    `form:"txHashOrder"  search:"type:order;column:tx_hash;table:sys_works"`
	MetadataUrl     string    `form:"metadataUrlOrder"  search:"type:order;column:metadata_url;table:sys_works"`
	MetadataContent string    `form:"MetadataContentOrder"  search:"type:order;column:metadata_content;table:sys_works"`
	IsDel           string    `form:"isDelOrder"  search:"type:order;column:is_del;table:sys_works"`
	CreatedAt       time.Time `form:"createdAtOrder"  search:"type:order;column:created_at;table:sys_works"`
	UpdatedAt       time.Time `form:"updatedAtOrder"  search:"type:order;column:updated_at;table:sys_works"`
	DeletedAt       time.Time `form:"deletedAtOrder"  search:"type:order;column:deleted_at;table:sys_works"`
	CreateBy        string    `form:"createByOrder"  search:"type:order;column:create_by;table:sys_works"`
	UpdateBy        string    `form:"updateByOrder"  search:"type:order;column:update_by;table:sys_works"`
	CopyrightOwner  string    `form:"copyrightOwnerOrder"  search:"type:order;column:copyright_owner;table:sys_works"`
	Author          string    `form:"authorOrder"  search:"type:order;column:author;table:sys_works"`
	Issuer          string    `form:"issuerOrder"  search:"type:order;column:issuer;table:sys_works"`
	IssuerDate      time.Time `form:"issuerDateOrder"  search:"type:order;column:issuer_date;table:sys_works"`
}

func (m *SysWorksGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysWorksInsertReq struct {
	Id              int         `json:"-" comment:""` //
	ContractId      interface{} `json:"contractId" comment:"合约id"`
	PrivatekeyId    interface{} `json:"privatekeyId" comment:"私钥地址"`
	NetworkId       interface{} `json:"networkId" comment:"主网id"`
	Quantity        int         `json:"quantity" comment:"发行数量"`
	TokenId         int         `json:"tokenId" comment:"TokenID"`
	TokenCid        string      `json:"tokenCid" comment:"TokenCid"`
	IsSync          int         `json:"issync" comment:"是否发行"`
	Name            string      `json:"name" comment:"名称"`
	Description     string      `json:"description" comment:"描述"`
	Properties      string      `json:"properties" comment:"属性"`
	ImgUrl          string      `json:"imgUrl" comment:"图标地址"`
	TxHash          string      `json:"txHash" comment:"发行交易hash"`
	MetadataUrl     string      `json:"metadataUrl" comment:"资源url"`
	MetadataContent string      `json:"metadataContent" comment:"资源url"`
	IsDel           string      `json:"isDel" comment:""`
	CopyrightOwner  string      `json:"copyrightOwner" comment:"版权方"`
	Author          string      `json:"author" comment:"著作人"`
	Issuer          string      `json:"issuer" comment:"发行方"`
	IssuerDate      string      `json:"issuerDate" comment:"发行日期"`
	common.ControlBy
}
type SysWorksToMitReq struct {
	Ids []int   `json:"ids"`
	Gas float64 `json:"gas"`
}

func (s *SysWorksToMitReq) GetId() interface{} {
	return s.Ids
}
func (s *SysWorksInsertReq) Generate(model *models.SysWorks) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.ContractId, _ = strconv.Atoi(s.ContractId.(string))
	model.PrivatekeyId, _ = strconv.Atoi(s.PrivatekeyId.(string))
	model.NetworkId, _ = strconv.Atoi(s.NetworkId.(string))
	model.Quantity = s.Quantity
	model.TokenId = s.TokenId
	model.Name = s.Name
	model.Description = s.Description
	model.Properties = s.Properties
	model.ImgUrl = s.ImgUrl
	model.TxHash = s.TxHash
	model.MetadataUrl = s.MetadataUrl
	model.MetadataContent = s.MetadataContent
	model.IsDel = s.IsDel
	model.IsSync = s.IsSync
	model.CopyrightOwner = s.CopyrightOwner
	model.Author = s.Author
	model.Issuer = s.Issuer
	model.IssuerDate = s.IssuerDate
	model.CreateBy = s.CreateBy
}

func (s *SysWorksInsertReq) GetId() interface{} {
	return s.Id
}

type SysWorksUpdateReq struct {
	Id              int         `uri:"id" comment:""` //
	ContractId      interface{} `json:"contractId" comment:"合约id"`
	PrivatekeyId    interface{} `json:"privatekeyId" comment:"私钥地址"`
	NetworkId       interface{} `json:"networkId" comment:"主网id"`
	Quantity        int         `json:"quantity" comment:"发行数量"`
	IsSync          int         `json:"IsSync" comment:"是否发布"`
	Name            string      `json:"name" comment:"名称"`
	Description     string      `json:"description" comment:"描述"`
	Properties      string      `json:"properties" comment:"属性"`
	ImgUrl          string      `json:"imgUrl" comment:"图标地址"`
	TxHash          string      `json:"txHash" comment:"发行交易hash"`
	MetadataUrl     string      `json:"metadataUrl" comment:"资源url"`
	MetadataContent string      `json:"metadataContent" comment:"资源url"`
	IsDel           string      `json:"isDel" comment:""`
	CopyrightOwner  string      `json:"copyrightOwner" comment:"版权方"`
	Author          string      `json:"author" comment:"著作人"`
	Issuer          string      `json:"issuer" comment:"发行方"`
	IssuerDate      string      `json:"issuerDate" comment:"发行日期"`
	common.ControlBy
}

func (s *SysWorksUpdateReq) Generate(model *models.SysWorks) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.ContractId, _ = strconv.Atoi(s.ContractId.(string))
	model.PrivatekeyId, _ = strconv.Atoi(s.PrivatekeyId.(string))
	model.NetworkId, _ = strconv.Atoi(s.NetworkId.(string))
	model.Quantity = s.Quantity
	model.IsSync = s.IsSync
	model.Name = s.Name
	model.Description = s.Description
	model.Properties = s.Properties
	model.ImgUrl = s.ImgUrl
	model.TxHash = s.TxHash
	model.MetadataUrl = s.MetadataUrl
	model.MetadataContent = s.MetadataContent
	model.IsDel = s.IsDel
	model.CopyrightOwner = s.CopyrightOwner
	model.Author = s.Author
	model.Issuer = s.Issuer
	model.IssuerDate = s.IssuerDate
	model.UpdateBy = s.UpdateBy
}

func (s *SysWorksUpdateReq) GetId() interface{} {
	return s.Id
}

// SysWorksGetReq 功能获取请求参数
type SysWorksGetReq struct {
	Id      int    `uri:"id"`
	TokenId string `uri:"tokenId"`
}

func (s *SysWorksGetReq) GetId() interface{} {
	if s.Id > 0 {
		return s.Id
	}
	return s.TokenId
}

// SysWorksDeleteReq 功能删除请求参数
type SysWorksDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysWorksDeleteReq) GetId() interface{} {
	return s.Ids
}
