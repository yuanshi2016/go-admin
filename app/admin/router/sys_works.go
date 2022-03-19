package router

import (
	"github.com/gin-gonic/gin"
	jwt "github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth"

	"go-admin/app/admin/apis"
	"go-admin/common/middleware"
)

func init() {
	routerCheckRole = append(routerCheckRole, registerSysWorksRouter)
}

// registerSysWorksRouter
func registerSysWorksRouter(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware) {
	api := apis.SysWorks{}
	r := v1.Group("/sys-works").Use(authMiddleware.MiddlewareFunc()).Use(middleware.AuthCheckRole())
	{
		r.POST("", api.Insert)
		r.POST("/tomit", api.ToMit)
		r.DELETE("", api.Delete)
		r.PUT("/:id", api.Update)

	}
	r1 := v1.Group("/sys-works")
	{
		r1.GET("", api.GetPage)
		r1.GET("/:id", api.Get)
		//更新铸币状态 无权限api
		r1.GET("/UpdateTomitState", api.UpdateTomitState)
		//获取gas
		r1.GET("/Gastracker", api.Gastracker)
	}
}
