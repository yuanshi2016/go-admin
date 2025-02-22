package service

import (
	"errors"

	"github.com/go-admin-team/go-admin-core/sdk/service"
	"gorm.io/gorm"

	"go-admin/app/admin/models"
	"go-admin/app/admin/service/dto"
	"go-admin/common/actions"
	cDto "go-admin/common/dto"
)

type SysContract struct {
	service.Service
}

// GetPage 获取SysContract列表
func (e *SysContract) GetPage(c *dto.SysContractGetPageReq, p *actions.DataPermission, list *[]models.SysContract, count *int64) error {
	var err error
	var data models.SysContract

	err = e.Orm.Model(&data).
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.Paginate(c.GetPageSize(), c.GetPageIndex()),
			actions.Permission(data.TableName(), p),
		).
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		e.Log.Errorf("SysContractService GetPage error:%s \r\n", err)
		return err
	}
	return nil
}

// Get 获取SysContract对象
func (e *SysContract) Get(d *dto.SysContractGetReq, p *actions.DataPermission, model *models.SysContract) error {
	var data models.SysContract

	err := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).
		First(model, d.GetId()).Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Errorf("Service GetSysContract error:%s \r\n", err)
		return err
	}
	if err != nil {
		e.Log.Errorf("db error:%s", err)
		return err
	}
	return nil
}

// Insert 创建SysContract对象
func (e *SysContract) Insert(c *dto.SysContractInsertReq) error {
	var err error
	var data models.SysContract
	c.Generate(&data)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Errorf("SysContractService Insert error:%s \r\n", err)
		return err
	}
	return nil
}

// Update 修改SysContract对象
func (e *SysContract) Update(c *dto.SysContractUpdateReq, p *actions.DataPermission) error {
	var err error
	var data = models.SysContract{}
	e.Orm.Scopes(
		actions.Permission(data.TableName(), p),
	).First(&data, c.GetId())
	c.Generate(&data)

	db := e.Orm.Save(&data)
	if db.Error != nil {
		e.Log.Errorf("SysContractService Save error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysContract
func (e *SysContract) Remove(d *dto.SysContractDeleteReq, p *actions.DataPermission) error {
	var data models.SysContract

	db := e.Orm.Model(&data).
		Scopes(
			actions.Permission(data.TableName(), p),
		).Delete(&data, d.GetId())
	if err := db.Error; err != nil {
		e.Log.Errorf("Service RemoveSysContract error:%s \r\n", err)
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权删除该数据")
	}
	return nil
}
