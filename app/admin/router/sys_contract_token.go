package router

import (
	"github.com/gin-gonic/gin"
	jwt "github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth"

	"go-admin/app/admin/apis"
	"go-admin/common/middleware"
)

func init() {
	routerCheckRole = append(routerCheckRole, registerSysContractTokenRouter)
}

// registerSysContractTokenRouter
func registerSysContractTokenRouter(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware) {
	api := apis.SysContractToken{}
	r := v1.Group("/sys-contract-token").Use(authMiddleware.MiddlewareFunc()).Use(middleware.AuthCheckRole())
	{
		r.GET("", api.GetPage)
		r.GET("/:id", api.Get)
		r.POST("", api.Insert)
		r.POST("/transfer", api.Transfer)
		r.PUT("/:id", api.Update)
		r.DELETE("", api.Delete)
	}
}
