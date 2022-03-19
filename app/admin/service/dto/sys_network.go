package dto

import (
	"go-admin/app/admin/models"
	"go-admin/common/dto"
	common "go-admin/common/models"
	"time"
)

type SysNetworkGetPageReq struct {
	dto.Pagination `search:"-"`
	SysNetworkOrder
}

type SysNetworkOrder struct {
	Id          int       `form:"idOrder"  search:"type:order;column:id;table:sys_network"`
	Name        string    `form:"nameOrder"  search:"type:order;column:name;table:sys_network"`
	RpcUrl      string    `form:"rpcUrlOrder"  search:"type:order;column:rpc_url;table:sys_network"`
	ChainId     string    `form:"chainIdOrder"  search:"type:order;column:chain_id;table:sys_network"`
	Symbol      string    `form:"symbolOrder"  search:"type:order;column:symbol;table:sys_network"`
	BlockUrl    string    `form:"blockUrlOrder"  search:"type:order;column:block_url;table:sys_network"`
	IpfsBindDir string    `form:"ipfsBindDirOrder"  search:"type:order;column:ipfs_bind_dir;table:sys_network"`
	IpfsCid     string    `form:"ipfsCidOrder"  search:"type:order;column:ipfs_cid;table:sys_network"`
	IpfsIsPush  string    `form:"ipfsIsPushOrder"  search:"type:order;column:ipfs_is_push;table:sys_network"`
	IsDel       string    `form:"isDelOrder"  search:"type:order;column:is_del;table:sys_network"`
	CreatedAt   time.Time `form:"createdAtOrder"  search:"type:order;column:created_at;table:sys_network"`
	UpdatedAt   time.Time `form:"updatedAtOrder"  search:"type:order;column:updated_at;table:sys_network"`
	DeletedAt   time.Time `form:"deletedAtOrder"  search:"type:order;column:deleted_at;table:sys_network"`
	CreateBy    string    `form:"createByOrder"  search:"type:order;column:create_by;table:sys_network"`
	UpdateBy    string    `form:"updateByOrder"  search:"type:order;column:update_by;table:sys_network"`
}

func (m *SysNetworkGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysNetworkInsertReq struct {
	Id          int    `json:"-" comment:""` //
	Name        string `json:"name" comment:"网络名称"`
	RpcUrl      string `json:"rpcUrl" comment:"RPC地址"`
	ChainId     string `json:"chainId" comment:"链ID"`
	Symbol      string `json:"symbol" comment:"代币名称"`
	BlockUrl    string `json:"blockUrl" comment:"区块浏览器"`
	IpfsBindDir string `json:"ipfsBindDir" comment:"IPFS目录"`
	IpfsCid     string `json:"ipfsCid" comment:"IPFSCid"`
	IpfsIsPush  int    `json:"ipfsIsPush" comment:"IPFS初始化"`
	IsDel       string `json:"isDel" comment:""`
	common.ControlBy
}

func (s *SysNetworkInsertReq) Generate(model *models.SysNetwork) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Name = s.Name
	model.RpcUrl = s.RpcUrl
	model.ChainId = s.ChainId
	model.Symbol = s.Symbol
	model.BlockUrl = s.BlockUrl
	model.IpfsBindDir = s.IpfsBindDir
	model.IpfsCid = s.IpfsCid
	model.IpfsIsPush = s.IpfsIsPush
	model.IsDel = s.IsDel
}

func (s *SysNetworkInsertReq) GetId() interface{} {
	return s.Id
}

type SysNetworkUpdateReq struct {
	Id          int    `uri:"id" comment:""` //
	Name        string `json:"name" comment:"网络名称"`
	RpcUrl      string `json:"rpcUrl" comment:"RPC地址"`
	ChainId     string `json:"chainId" comment:"链ID"`
	Symbol      string `json:"symbol" comment:"代币名称"`
	BlockUrl    string `json:"blockUrl" comment:"区块浏览器"`
	IpfsBindDir string `json:"ipfsBindDir" comment:"IPFS目录"`
	IpfsCid     string `json:"ipfsCid" comment:"IPFSCid"`
	IpfsIsPush  int    `json:"ipfsIsPush" comment:"IPFS初始化"`
	IsDel       string `json:"isDel" comment:""`
	common.ControlBy
}

func (s *SysNetworkUpdateReq) Generate(model *models.SysNetwork) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Name = s.Name
	model.RpcUrl = s.RpcUrl
	model.ChainId = s.ChainId
	model.Symbol = s.Symbol
	model.BlockUrl = s.BlockUrl
	model.IpfsBindDir = s.IpfsBindDir
	model.IpfsCid = s.IpfsCid
	model.IpfsIsPush = s.IpfsIsPush
	model.IsDel = s.IsDel
}

func (s *SysNetworkUpdateReq) GetId() interface{} {
	return s.Id
}

// SysNetworkGetReq 功能获取请求参数
type SysNetworkGetReq struct {
	Id int `uri:"id"`
}

func (s *SysNetworkGetReq) GetId() interface{} {
	return s.Id
}

// SysNetworkDeleteReq 功能删除请求参数
type SysNetworkDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysNetworkDeleteReq) GetId() interface{} {
	return s.Ids
}
