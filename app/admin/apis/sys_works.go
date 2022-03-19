package apis

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/go-admin-team/go-admin-core/sdk/api"
	"github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth/user"
	_ "github.com/go-admin-team/go-admin-core/sdk/pkg/response"

	"go-admin/app/admin/models"
	"go-admin/app/admin/service"
	"go-admin/app/admin/service/dto"
	"go-admin/common/actions"
)

type SysWorks struct {
	api.Api
}

// Gastracker 获取gas 无权限api
// @Summary 获取gas
// @Description 获取gas
// @Tags 作品管理
// @Success 200 {object} response.Response{data=models.GastrackerRes} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-works/Gastracker [get]
// @Security Bearer
func (e SysWorks) Gastracker(c *gin.Context) {
	req := models.GastrackerBody{}
	s := service.SysWorks{}
	e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service)
	resp, _ := http.Get("https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=7I1JAEVRDNCT9BZHTY7IM79FWDPV32KS9H")
	defer resp.Body.Close()
	body, _ := ioutil.ReadAll(resp.Body)
	json.Unmarshal(body, &req)
	e.OK(req.Result, "Success")
}

func (e SysWorks) UpdateTomitState(c *gin.Context) {
	req := dto.SysWorksGetReq{}
	s := service.SysWorks{}
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
	go s.UpdateTomitState()
	e.OK(nil, "后台执行中")
}

// ToMit 铸币
// @Summary 铸币
// @Description 铸币
// @Tags 作品管理
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response{data=[]models.SysWorksToMitReturn} "{"code": 200, "data": [...], "message": "后台处理中.. 请稍候查看状态"}"
// @Router /api/v1/sys-works/tomit [post]
// @Security Bearer
func (e SysWorks) ToMit(c *gin.Context) {
	s := service.SysWorks{}
	req := dto.SysWorksToMitReq{}
	//[]models.SysWorksToMitReturn
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
	tx, err := s.ToMit(&req, p)
	if err != nil {
		e.Error(500, err, err.Error())
		return
	}
	e.OK(tx, "铸币成功")
}

// GetPage 获取SysWorks列表
// @Summary 获取SysWorks列表
// @Description 获取SysWorks列表
// @Tags 作品管理
// @Param name query string false "名称"
// @Param copyrightOwner query string false "版权方"
// @Param author query string false "著作人"
// @Param issuer query string false "发行方"
// @Param issuerDate query time.Time false "发行日期"
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.SysWorksJoin}} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-works [get]
// @Security Bearer
func (e SysWorks) GetPage(c *gin.Context) {
	req := dto.SysWorksGetPageReq{}
	s := service.SysWorks{}
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
	list := make([]models.SysWorksJoin, 0)
	var count int64

	err = s.GetPage(&req, p, &list, &count)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取SysWorks 失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取SysWorks
// @Summary 获取SysWorks
// @Description 获取SysWorks
// @Tags 作品管理
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.SysWorksJoin} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-works/{id} [get]
// @Security Bearer
func (e SysWorks) Get(c *gin.Context) {
	req := dto.SysWorksGetReq{}
	s := service.SysWorks{}
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
	var object models.SysWorksJoin

	p := actions.GetPermissionFromContext(c)
	err = s.Get(&req, p, &object)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("获取SysWorks失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(object, "查询成功")
}

// Insert 创建SysWorks
// @Summary 创建SysWorks
// @Description 创建SysWorks
// @Tags 作品管理
// @Accept application/json
// @Product application/json
// @Param data body dto.SysWorksInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/sys-works [post]
// @Security Bearer
func (e SysWorks) Insert(c *gin.Context) {
	req := dto.SysWorksInsertReq{}
	s := service.SysWorks{}
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
	p := actions.GetPermissionFromContext(c)
	err = s.Insert(&req, p)
	if err != nil {
		e.Error(500, err, fmt.Sprintf("创建SysWorks  失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改SysWorks
// @Summary 修改SysWorks
// @Description 修改SysWorks
// @Tags 作品管理
// @Accept application/json
// @Product application/json
// @Param data body dto.SysWorksUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/sys-works/{id} [put]
// @Security Bearer
func (e SysWorks) Update(c *gin.Context) {
	req := dto.SysWorksUpdateReq{}
	s := service.SysWorks{}
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
		e.Error(500, err, fmt.Sprintf("修改SysWorks 失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "修改成功")
}

// Delete 删除SysWorks
// @Summary 删除SysWorks
// @Description 删除SysWorks
// @Tags 作品管理
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/sys-works [delete]
// @Security Bearer
func (e SysWorks) Delete(c *gin.Context) {
	s := service.SysWorks{}
	req := dto.SysWorksDeleteReq{}
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
		e.Error(500, err, fmt.Sprintf("删除SysWorks失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "删除成功")
}
