package models

import (
	// "gorm.io/gorm"

	"encoding/json"
	"github.com/ethereum/go-ethereum/common"
	"go-admin/common/models"
	"math/big"
)

func (SysWorksToMitGroup) TableName() string {
	return "sys_works"
}
func (e *SysWorksToMitGroup) ToJson() string {
	mjson, _ := json.Marshal(e)
	return string(mjson)
}

type SysWorksToMitGroup map[string]*SysWorksAdminTomit

type SysWorksAdminTomit struct {
	Group        map[string][]SysWorksJoin
	RpcUrl       string
	BlockUrl     string
	ChainId      int
	AdminAddress []common.Address
	TokenAmount  []*big.Int
	TokenId      []*big.Int
	WorksId      []*big.Int
}

type SysWorksToMitReturn struct {
	Tx       string `json:"tx"`
	Title    string `json:"title"`
	BlockUrl string `json:"blockUrl"`
}

type SysWorksToMit struct {
	SysWorksJoin
}
type SysWorksTransfer struct {
	SysWorksJoin
}

func (e *SysWorksJoin) ToJson() string {
	mjson, _ := json.Marshal(e)
	return string(mjson)
}

type SysWorksJoin struct {
	SysWorks
	CreateName      string `json:"createName"`
	NetworkName     string `json:"networkName"`
	ContractAddress string `json:"contractAddress"`
	ContractName    string `json:"contractName"`
	BaseAddress     string `json:"baseAddress"`
	RpcUrl          string `json:"rpcUrl"`
	ChainId         int    `json:"chainId"`
	BlockUrl        string `json:"blockUrl"`
	IpfsBindDir     string `json:"ipfsBindDir"`
}

type SysWorks struct {
	models.Model
	ContractId      int    `json:"contractId" gorm:"type:int(11);comment:合约id"`
	PrivatekeyId    int    `json:"privatekeyId" gorm:"type:int(11);comment:私钥地址"`
	NetworkId       int    `json:"networkId" gorm:"type:int(11);comment:主网id"`
	Quantity        int    `json:"quantity" gorm:"type:int(11);comment:发行数量"`
	TokenId         int    `json:"tokenId" gorm:"type:int(11);comment:TokenID"`
	TokenCid        string `json:"tokenCid" gorm:"type:varchar(255);comment:TokenCid"`
	Name            string `json:"name" gorm:"type:varchar(255);comment:名称"`
	Description     string `json:"description" gorm:"type:text;comment:描述"`
	Properties      string `json:"properties" gorm:"type:varchar(255);comment:属性"`
	ImgUrl          string `json:"imgUrl" gorm:"type:varchar(255);comment:图标地址"`
	TxHash          string `json:"txHash" gorm:"type:varchar(255);comment:发行交易hash"`
	MetadataUrl     string `json:"metadataUrl" gorm:"type:varchar(255);comment:资源url"`
	MetadataContent string `json:"metadataContent" gorm:"type:varchar(255);comment:资源内容"`
	IsDel           string `json:"isDel" gorm:"type:blob;comment:IsDel"`
	IsSync          int    `json:"isSync" gorm:"type:blob;comment:IsSync"`
	CopyrightOwner  string `json:"copyrightOwner" gorm:"type:varchar(255);comment:版权方"`
	Author          string `json:"author" gorm:"type:varchar(255);comment:著作人"`
	Issuer          string `json:"issuer" gorm:"type:varchar(255);comment:发行方"`
	IssuerDate      string `json:"issuerDate" gorm:"type:varchar(255);comment:发行日期"`
	models.ModelTime
	models.ControlBy
}

func (SysWorks) TableName() string {
	return "sys_works"
}

func (e *SysWorks) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *SysWorks) GetId() interface{} {
	return e.Id
}

type GastrackerBody struct {
	Status  string        `json:"status"`
	Message string        `json:"message"`
	Result  GastrackerRes `json:"result"`
}
type GastrackerRes struct {
	LastBlock       string `json:"LastBlock"`
	SafeGasPrice    string `json:"SafeGasPrice"`
	ProposeGasPrice string `json:"ProposeGasPrice"`
	FastGasPrice    string `json:"FastGasPrice"`
	SuggestBaseFee  string `json:"suggestBaseFee"`
	GasUsedRatio    string `json:"gasUsedRatio"`
}
