package models

import (
	// "gorm.io/gorm"

	"encoding/json"
	"github.com/ethereum/go-ethereum/common"
	"go-admin/common/models"
	"math/big"
)

type SysContractTokenToMitGroup map[string]*SysContractTokenToMitInfo

func (e *SysContractTokenToMitGroup) ToJson() string {
	mjson, _ := json.Marshal(e)
	return string(mjson)
}

type SysContractTokenToMitInfo struct {
	TokenInfo   []SysContractTokenJoin
	Address     []common.Address
	BaseAddress []common.Address
	TokenAmount []*big.Int
	TokenId     []*big.Int
	RpcUrl      string
	BlockUrl    string
	ChainId     int
}
type SysContractTokenToMitReturn struct {
	Tx       string `json:"tx"`
	BlockUrl string `json:"blockUrl"`
}
type SysContractTokenToMit struct {
	SysContractTokenJoin
}
type SysContractTokenTransfer struct {
	SysContractTokenJoin
}
type SysContractTokenJoin struct {
	SysContractToken
	Name            string `json:"name"`
	IssuerDate      string `json:"issuerDate"`
	TokenCid        string `json:"tokenCid"`
	TxHash          string `json:"txHash"`
	ImgUrl          string `json:"imgUrl"`
	CopyrightOwner  string `json:"copyrightOwner"`
	IsSync          int    `json:"isSync"`
	CreateName      string `json:"createName"`
	NetworkName     string `json:"networkName"`
	ContractAddress string `json:"contractAddress"`
	ContractName    string `json:"contractName"`
	RpcUrl          string `json:"rpcUrl"`
	BaseAddress     string `json:"baseAddress"`
	ChainId         int    `json:"chainId"`
	BlockUrl        string `json:"blockUrl"`
	IpfsBindDir     string `json:"ipfsBindDir"`
}

func (e *SysContractTokenTransfer) ToJson() string {
	mjson, _ := json.Marshal(e)
	return string(mjson)
}
func TableName() string {
	return "sys_contract_token"
}

type SysContractIpfsConfig struct {
	IpfsUrl  string `json:"ipfs_url" gorm:"type:varchar(255);comment:IPFS地址"`
	IpfsPort string `json:"ipfs_port" gorm:"type:varchar(255);comment:IPFS端口"`
	IpfsIp   string `json:"ipfs_ip" gorm:"type:varchar(255);comment:IPFS ip"`
}

func (s *SysContractIpfsConfig) Tojson() string {
	data, _ := json.Marshal(s)
	return string(data)
}

type MetadataContent struct {
	Tokenid        int64         `json:"tokenid"`
	Name           string        `json:"name"`
	Image          string        `json:"image"`
	Description    string        `json:"description"`
	ResourcesURL   string        `json:"resources_url"`
	CopyrightOwner string        `json:"copyright_owner"`
	Author         string        `json:"author"`
	Issuer         string        `json:"issuer"`
	IssuerDate     string        `json:"issuer_date"`
	Attributes     []interface{} `json:"attributes"`
}

func (s *MetadataContent) Tojson() string {
	data, _ := json.Marshal(s)
	return string(data)
}

type SysContractToken struct {
	models.Model
	WorksId         int    `json:"worksId" gorm:"type:int(11);comment:作品ID"`
	TokenId         int    `json:"tokenId" gorm:"type:int(11);comment:TokenID"`
	Stock           int    `json:"stock" gorm:"type:int(11);comment:库存"`
	IsTransfer      int    `json:"isTransfer" gorm:"type:int(11);comment:是否转出"`
	TransferAddress string `json:"transferAddress" gorm:"type:varchar(255);comment:待转移地址"`
	TransferTx      string `json:"transferTx" gorm:"type:varchar(255);comment:转移hash"`
	MetadataContent string `json:"metadataContent" gorm:"type:varchar(255);comment:资源内容"`
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
	return e.Id
}
