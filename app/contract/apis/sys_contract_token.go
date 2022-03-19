package apis

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/go-admin-team/go-admin-core/sdk/api"
	"github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth/user"
	_ "github.com/go-admin-team/go-admin-core/sdk/pkg/response"

	"go-admin/app/contract/models"
	"go-admin/app/contract/service"
	"go-admin/app/contract/service/dto"
	"go-admin/common/actions"
)

type SysContractToken struct {
	api.Api
}

// GetPage 获取合约token列表
// @Summary 获取合约token列表
// @Description 获取合约token列表
// @Tags 合约token
// @Param contractId query int false "合约id"
// @Param tokenId query int false "TokenID"
// @Param amount query string false "数量"
// @Param creator query string false "拥有者"
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.SysContractToken}} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-contract-token [get]
// @Security Bearer
func (e SysContractToken) GetPage(c *gin.Context) {
	req := dto.SysContractTokenGetPageReq{}
	s := service.SysContractToken{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}

	p := actions.GetPermissionFromContext(c)
	list := make([]models.SysContractToken, 0)
	var count int64

	err = s.GetPage(&req, p, &list, &count)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取合约token 失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取合约token
// @Summary 获取合约token
// @Description 获取合约token
// @Tags 合约token
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.SysContractToken} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-contract-token/{id} [get]
// @Security Bearer
func (e SysContractToken) Get(c *gin.Context) {
	req := dto.SysContractTokenGetReq{}
	s := service.SysContractToken{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	var object models.SysContractToken

	p := actions.GetPermissionFromContext(c)
	err = s.Get(&req, p, &object)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取合约token失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(object, "查询成功")
}

// Insert 创建合约token
// @Summary 创建合约token
// @Description 创建合约token
// @Tags 合约token
// @Accept application/json
// @Product application/json
// @Param data body dto.SysContractTokenInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/sys-contract-token [post]
// @Security Bearer
func (e SysContractToken) Insert(c *gin.Context) {
	req := dto.SysContractTokenInsertReq{}
	s := service.SysContractToken{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	// 设置创建人
	req.SetCreateBy(user.GetUserId(c))

	err = s.Insert(&req)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("创建合约token  失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改合约token
// @Summary 修改合约token
// @Description 修改合约token
// @Tags 合约token
// @Accept application/json
// @Product application/json
// @Param data body dto.SysContractTokenUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/sys-contract-token/{id} [put]
// @Security Bearer
func (e SysContractToken) Update(c *gin.Context) {
	req := dto.SysContractTokenUpdateReq{}
	s := service.SysContractToken{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	err = s.Update(&req, p)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("修改合约token 失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "修改成功")
}

// Delete 删除合约token
// @Summary 删除合约token
// @Description 删除合约token
// @Tags 合约token
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/sys-contract-token [delete]
// @Security Bearer
func (e SysContractToken) Delete(c *gin.Context) {
	s := service.SysContractToken{}
	req := dto.SysContractTokenDeleteReq{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}

	// req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	err = s.Remove(&req, p)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("删除合约token失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "删除成功")
}
