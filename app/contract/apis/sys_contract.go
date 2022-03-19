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

type SysContract struct {
	api.Api
}

// GetPage 获取合约列表
// @Summary 获取合约列表
// @Description 获取合约列表
// @Tags 合约
// @Param name query string false "name"
// @Param symbol query string false "symbol"
// @Param type query string false "合约类型"
// @Param networkId query string false "主网类型"
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.SysContract}} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-contract [get]
// @Security Bearer
func (e SysContract) GetPage(c *gin.Context) {
	req := dto.SysContractGetPageReq{}
	s := service.SysContract{}
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
	list := make([]models.SysContract, 0)
	var count int64

	err = s.GetPage(&req, p, &list, &count)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取合约 失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取合约
// @Summary 获取合约
// @Description 获取合约
// @Tags 合约
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.SysContract} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-contract/{id} [get]
// @Security Bearer
func (e SysContract) Get(c *gin.Context) {
	req := dto.SysContractGetReq{}
	s := service.SysContract{}
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
	var object models.SysContract

	p := actions.GetPermissionFromContext(c)
	err = s.Get(&req, p, &object)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取合约失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(object, "查询成功")
}

// Insert 创建合约
// @Summary 创建合约
// @Description 创建合约
// @Tags 合约
// @Accept application/json
// @Product application/json
// @Param data body dto.SysContractInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/sys-contract [post]
// @Security Bearer
func (e SysContract) Insert(c *gin.Context) {
	req := dto.SysContractInsertReq{}
	s := service.SysContract{}
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
		e.Error(500, err, fmt.Sprintf("创建合约  失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改合约
// @Summary 修改合约
// @Description 修改合约
// @Tags 合约
// @Accept application/json
// @Product application/json
// @Param data body dto.SysContractUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/sys-contract/{id} [put]
// @Security Bearer
func (e SysContract) Update(c *gin.Context) {
	req := dto.SysContractUpdateReq{}
	s := service.SysContract{}
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
		e.Error(500, err, fmt.Sprintf("修改合约 失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "修改成功")
}

// Delete 删除合约
// @Summary 删除合约
// @Description 删除合约
// @Tags 合约
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/sys-contract [delete]
// @Security Bearer
func (e SysContract) Delete(c *gin.Context) {
	s := service.SysContract{}
	req := dto.SysContractDeleteReq{}
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
		e.Error(500, err, fmt.Sprintf("删除合约失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "删除成功")
}
