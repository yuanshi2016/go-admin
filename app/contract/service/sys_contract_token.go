package service

import (
	"errors"

	"github.com/go-admin-team/go-admin-core/sdk/service"
	"gorm.io/gorm"

	"go-admin/app/contract/models"
	"go-admin/app/contract/service/dto"
	"go-admin/common/actions"
	cDto "go-admin/common/dto"
)

type SysContractToken struct {
	service.Service
}

// GetPage 获取SysContractToken列表
func (e *SysContractToken) GetPage(c *dto.SysContractTokenGetPageReq, p *actions.DataPermission, list *[]models.SysContractToken, count *int64) error {
	var err error
	var data models.SysContractToken

	err = e.Orm.Model(&data).
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		e.Log.Errorf("SysContractTokenService GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取SysContractToken对象
func (e *SysContractToken) Get(d *dto.SysContractTokenGetReq, p *actions.DataPermission, model *models.SysContractToken) error {
	var data models.SysContractToken

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		First(model, d.GetId()).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetSysContractToken error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建SysContractToken对象
func (e *SysContractToken) Insert(c *dto.SysContractTokenInsertReq) error {
	var err error
	var data models.SysContractToken
	c.Generate(&data)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Errorf("SysContractTokenService Insert error:%s \r\n", err)
		return err
	}
	return nil
}

// Update 修改SysContractToken对象
func (e *SysContractToken) Update(c *dto.SysContractTokenUpdateReq, p *actions.DataPermission) error {
	var err error
	var data = models.SysContractToken{}
	e.Orm.Scopes(
		actions.Permission(data.TableName(), p),
	).First(&data, c.GetId())
	c.Generate(&data)

	db := e.Orm.Save(&data)
	if db.Error != nil {
		e.Log.Errorf("SysContractTokenService Save error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysContractToken
func (e *SysContractToken) Remove(d *dto.SysContractTokenDeleteReq, p *actions.DataPermission) error {
	var data models.SysContractToken

	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysContractToken error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权删除该数据")
	}
	return nil
}
