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

type SysPrivatekey struct {
	api.Api
}

// GetPage 获取以太坊私钥列表
// @Summary 获取以太坊私钥列表
// @Description 获取以太坊私钥列表
// @Tags 以太坊私钥
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.SysPrivatekey}} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-privatekey [get]
// @Security Bearer
func (e SysPrivatekey) GetPage(c *gin.Context) {
	req := dto.SysPrivatekeyGetPageReq{}
	s := service.SysPrivatekey{}
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
	list := make([]*models.SysPrivatekey, 0)

	var count int64
	err = s.GetPage(&req, p, &list, &count, c)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取以太坊私钥 失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取以太坊私钥
// @Summary 获取以太坊私钥
// @Description 获取以太坊私钥
// @Tags 以太坊私钥
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.SysPrivatekey} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-privatekey/{id} [get]
// @Security Bearer
func (e SysPrivatekey) Get(c *gin.Context) {
	req := dto.SysPrivatekeyGetReq{}
	s := service.SysPrivatekey{}
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
	var object models.SysPrivatekey

	p := actions.GetPermissionFromContext(c)
	err = s.Get(&req, p, &object)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取以太坊私钥失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(object, "查询成功")
}

// Insert 创建以太坊私钥
// @Summary 创建以太坊私钥
// @Description 创建以太坊私钥
// @Tags 以太坊私钥
// @Accept application/json
// @Product application/json
// @Param data body dto.SysPrivatekeyInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/sys-privatekey [post]
// @Security Bearer
func (e SysPrivatekey) Insert(c *gin.Context) {
	req := dto.SysPrivatekeyInsertReq{}
	s := service.SysPrivatekey{}
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
		e.Error(500, err, fmt.Sprintf("创建以太坊私钥  失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改以太坊私钥
// @Summary 修改以太坊私钥
// @Description 修改以太坊私钥
// @Tags 以太坊私钥
// @Accept application/json
// @Product application/json
// @Param data body dto.SysPrivatekeyUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/sys-privatekey/{id} [put]
// @Security Bearer
func (e SysPrivatekey) Update(c *gin.Context) {
	req := dto.SysPrivatekeyUpdateReq{}
	s := service.SysPrivatekey{}
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
		e.Error(500, err, fmt.Sprintf("修改以太坊私钥 失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "修改成功")
}

// Delete 删除以太坊私钥
// @Summary 删除以太坊私钥
// @Description 删除以太坊私钥
// @Tags 以太坊私钥
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/sys-privatekey [delete]
// @Security Bearer
func (e SysPrivatekey) Delete(c *gin.Context) {
	s := service.SysPrivatekey{}
	req := dto.SysPrivatekeyDeleteReq{}
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
		e.Error(500, err, fmt.Sprintf("删除以太坊私钥失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "删除成功")
}

// ApprovalForAll 操作员授权
// @Summary 操作员授权
// @Description 操作员授权
// @Tags 以太坊私钥
// @Param ids body int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "授权成功"}"
// @Router /api/v1/sys-privatekey/approvalforall [POST]
// @Security Bearer
func (e SysPrivatekey) ApprovalForAll(c *gin.Context) {
	s := service.SysPrivatekey{}
	req := dto.SysPrivatekeyApprovalForAllReq{}
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
	tx, err := s.ApprovalForAll(&req, p)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("操作员授权失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(tx, "后台处理中，请稍候查看状态")
}
