package apis

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/go-admin-team/go-admin-core/sdk/api"
	"github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth/user"
	_ "github.com/go-admin-team/go-admin-core/sdk/pkg/response"

	"go-admin/app/admin/models"
	"go-admin/app/admin/service"
	"go-admin/app/admin/service/dto"
	"go-admin/common/actions"
)

type SysNetwork struct {
	api.Api
}

// GetPage 获取主网表列表
// @Summary 获取主网表列表
// @Description 获取主网表列表
// @Tags 主网表
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.SysNetwork}} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-network [get]
// @Security Bearer
func (e SysNetwork) GetPage(c *gin.Context) {
	req := dto.SysNetworkGetPageReq{}
	s := service.SysNetwork{}
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
	list := make([]models.SysNetwork, 0)
	var count int64

	err = s.GetPage(&req, p, &list, &count)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取主网表 失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取主网表
// @Summary 获取主网表
// @Description 获取主网表
// @Tags 主网表
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.SysNetwork} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-network/{id} [get]
// @Security Bearer
func (e SysNetwork) Get(c *gin.Context) {
	req := dto.SysNetworkGetReq{}
	s := service.SysNetwork{}
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
	var object models.SysNetwork

	p := actions.GetPermissionFromContext(c)
	err = s.Get(&req, p, &object)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取主网表失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(object, "查询成功")
}

// Insert 创建主网表
// @Summary 创建主网表
// @Description 创建主网表
// @Tags 主网表
// @Accept application/json
// @Product application/json
// @Param data body dto.SysNetworkInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/sys-network [post]
// @Security Bearer
func (e SysNetwork) Insert(c *gin.Context) {
	req := dto.SysNetworkInsertReq{}
	s := service.SysNetwork{}
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
		e.Error(500, err, fmt.Sprintf("创建主网表  失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改主网表
// @Summary 修改主网表
// @Description 修改主网表
// @Tags 主网表
// @Accept application/json
// @Product application/json
// @Param data body dto.SysNetworkUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/sys-network/{id} [put]
// @Security Bearer
func (e SysNetwork) Update(c *gin.Context) {
	req := dto.SysNetworkUpdateReq{}
	s := service.SysNetwork{}
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
		e.Error(500, err, fmt.Sprintf("修改主网表 失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "修改成功")
}

// Delete 删除主网表
// @Summary 删除主网表
// @Description 删除主网表
// @Tags 主网表
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/sys-network [delete]
// @Security Bearer
func (e SysNetwork) Delete(c *gin.Context) {
	s := service.SysNetwork{}
	req := dto.SysNetworkDeleteReq{}
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
		e.Error(500, err, fmt.Sprintf("删除主网表失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "删除成功")
}
