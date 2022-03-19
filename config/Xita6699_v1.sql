/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 127.0.0.1:3306
 Source Schema         : Xita6699_v1

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 05/01/2022 13:57:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `handle` varchar(128) DEFAULT NULL COMMENT 'handle',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `path` varchar(128) DEFAULT NULL COMMENT '地址',
  `type` varchar(16) DEFAULT NULL COMMENT '接口类型',
  `action` varchar(16) DEFAULT NULL COMMENT '请求类型',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `idx_sys_api_deleted_at` (`deleted_at`),
  KEY `idx_sys_api_create_by` (`create_by`),
  KEY `idx_sys_api_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_api
-- ----------------------------
BEGIN;
INSERT INTO `sys_api` VALUES (5, 'go-admin/app/admin/apis.SysLoginLog.Get-fm', '登录日志通过id获取', '/api/v1/sys-login-log/:id', 'BUS', 'GET', '2021-05-13 19:59:00.728', '2021-06-17 11:37:12.331', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (6, 'go-admin/app/admin/apis.SysOperaLog.GetPage-fm', '操作日志列表', '/api/v1/sys-opera-log', 'BUS', 'GET', '2021-05-13 19:59:00.778', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (7, 'go-admin/app/admin/apis.SysOperaLog.Get-fm', '操作日志通过id获取', '/api/v1/sys-opera-log/:id', 'BUS', 'GET', '2021-05-13 19:59:00.821', '2021-06-16 21:49:48.598', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (8, 'go-admin/common/actions.IndexAction.func1', '分类列表', '/api/v1/syscategory', 'BUS', 'GET', '2021-05-13 19:59:00.870', '2021-06-13 20:53:47.883', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (9, 'go-admin/common/actions.ViewAction.func1', '分类通过id获取', '/api/v1/syscategory/:id', 'BUS', 'GET', '2021-05-13 19:59:00.945', '2021-06-13 20:53:47.926', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (10, 'go-admin/common/actions.IndexAction.func1', '内容列表', '/api/v1/syscontent', 'BUS', 'GET', '2021-05-13 19:59:01.005', '2021-06-13 20:53:47.966', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (11, 'go-admin/common/actions.ViewAction.func1', '内容通过id获取', '/api/v1/syscontent/:id', 'BUS', 'GET', '2021-05-13 19:59:01.056', '2021-06-13 20:53:48.005', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (15, 'go-admin/common/actions.IndexAction.func1', 'job列表', '/api/v1/sysjob', 'BUS', 'GET', '2021-05-13 19:59:01.248', '2021-06-13 20:53:48.169', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (16, 'go-admin/common/actions.ViewAction.func1', 'job通过id获取', '/api/v1/sysjob/:id', 'BUS', 'GET', '2021-05-13 19:59:01.298', '2021-06-13 20:53:48.214', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (21, 'go-admin/app/admin/apis.SysDictType.GetPage-fm', '字典类型列表', '/api/v1/dict/type', 'BUS', 'GET', '2021-05-13 19:59:01.525', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (22, 'go-admin/app/admin/apis.SysDictType.GetAll-fm', '字典类型查询【代码生成】', '/api/v1/dict/type-option-select', 'SYS', 'GET', '2021-05-13 19:59:01.582', '2021-06-13 20:53:48.388', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (23, 'go-admin/app/admin/apis.SysDictType.Get-fm', '字典类型通过id获取', '/api/v1/dict/type/:id', 'BUS', 'GET', '2021-05-13 19:59:01.632', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (24, 'go-admin/app/admin/apis.SysDictData.GetPage-fm', '字典数据列表', '/api/v1/dict/data', 'BUS', 'GET', '2021-05-13 19:59:01.684', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (25, 'go-admin/app/admin/apis.SysDictData.Get-fm', '字典数据通过code获取', '/api/v1/dict/data/:dictCode', 'BUS', 'GET', '2021-05-13 19:59:01.732', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (26, 'go-admin/app/admin/apis.SysDictData.GetSysDictDataAll-fm', '数据字典根据key获取', '/api/v1/dict-data/option-select', 'SYS', 'GET', '2021-05-13 19:59:01.832', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (27, 'go-admin/app/admin/apis.SysDept.GetPage-fm', '部门列表', '/api/v1/dept', 'BUS', 'GET', '2021-05-13 19:59:01.940', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (28, 'go-admin/app/admin/apis.SysDept.Get-fm', '部门通过id获取', '/api/v1/dept/:id', 'BUS', 'GET', '2021-05-13 19:59:02.009', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (29, 'go-admin/app/admin/apis.SysDept.Get2Tree-fm', '查询部门下拉树【角色权限-自定权限】', '/api/v1/deptTree', 'SYS', 'GET', '2021-05-13 19:59:02.050', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (30, 'go-admin/app/admin/apis/tools.(*Gen).GetDBTableList-fm', '数据库表列表', '/api/v1/db/tables/page', 'SYS', 'GET', '2021-05-13 19:59:02.098', '2021-06-13 20:53:48.730', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (31, 'go-admin/app/admin/apis/tools.(*Gen).GetDBColumnList-fm', '数据表列列表', '/api/v1/db/columns/page', 'SYS', 'GET', '2021-05-13 19:59:02.140', '2021-06-13 20:53:48.771', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (32, 'go-admin/app/admin/apis/tools.Gen.GenCode-fm', '数据库表生成到项目', '/api/v1/gen/toproject/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.183', '2021-06-13 20:53:48.812', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (33, 'go-admin/app/admin/apis/tools.Gen.GenMenuAndApi-fm', '数据库表生成到DB', '/api/v1/gen/todb/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.227', '2021-06-13 20:53:48.853', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (34, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTablesTree-fm', '关系表数据【代码生成】', '/api/v1/gen/tabletree', 'SYS', 'GET', '2021-05-13 19:59:02.271', '2021-06-13 20:53:48.893', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (35, 'go-admin/app/admin/apis/tools.Gen.Preview-fm', '生成预览通过id获取', '/api/v1/gen/preview/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.315', '2021-06-13 20:53:48.935', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (36, 'go-admin/app/admin/apis/tools.Gen.GenApiToFile-fm', '生成api带文件', '/api/v1/gen/apitofile/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.357', '2021-06-13 20:53:48.977', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (37, 'go-admin/app/admin/apis.System.GenerateCaptchaHandler-fm', '验证码获取', '/api/v1/getCaptcha', 'SYS', 'GET', '2021-05-13 19:59:02.405', '2021-06-13 20:53:49.020', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (38, 'go-admin/app/admin/apis.SysUser.GetInfo-fm', '用户信息获取', '/api/v1/getinfo', 'SYS', 'GET', '2021-05-13 19:59:02.447', '2021-06-13 20:53:49.065', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (39, 'go-admin/app/admin/apis.SysMenu.GetPage-fm', '菜单列表', '/api/v1/menu', 'BUS', 'GET', '2021-05-13 19:59:02.497', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (40, 'go-admin/app/admin/apis.SysMenu.GetMenuTreeSelect-fm', '查询菜单下拉树结构【废弃】', '/api/v1/menuTreeselect', 'SYS', 'GET', '2021-05-13 19:59:02.542', '2021-06-03 22:37:21.857', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (41, 'go-admin/app/admin/apis.SysMenu.Get-fm', '菜单通过id获取', '/api/v1/menu/:id', 'BUS', 'GET', '2021-05-13 19:59:02.584', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (42, 'go-admin/app/admin/apis.SysMenu.GetMenuRole-fm', '角色菜单【顶部左侧菜单】', '/api/v1/menurole', 'SYS', 'GET', '2021-05-13 19:59:02.630', '2021-06-13 20:53:49.574', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (43, 'go-admin/app/admin/apis.SysMenu.GetMenuIDS-fm', '获取角色对应的菜单id数组【废弃】', '/api/v1/menuids', 'SYS', 'GET', '2021-05-13 19:59:02.675', '2021-06-03 22:39:52.500', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (44, 'go-admin/app/admin/apis.SysRole.GetPage-fm', '角色列表', '/api/v1/role', 'BUS', 'GET', '2021-05-13 19:59:02.720', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (45, 'go-admin/app/admin/apis.SysMenu.GetMenuTreeSelect-fm', '菜单权限列表【角色配菜单使用】', '/api/v1/roleMenuTreeselect/:roleId', 'SYS', 'GET', '2021-05-13 19:59:02.762', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (46, 'go-admin/app/admin/apis.SysDept.GetDeptTreeRoleSelect-fm', '角色部门结构树【自定义数据权限】', '/api/v1/roleDeptTreeselect/:roleId', 'SYS', 'GET', '2021-05-13 19:59:02.809', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (47, 'go-admin/app/admin/apis.SysRole.Get-fm', '角色通过id获取', '/api/v1/role/:id', 'BUS', 'GET', '2021-05-13 19:59:02.850', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (48, 'github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth.(*GinJWTMiddleware).RefreshHandler-fm', '刷新token', '/api/v1/refresh_token', 'SYS', 'GET', '2021-05-13 19:59:02.892', '2021-06-13 20:53:49.278', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (53, 'go-admin/app/admin/apis.SysConfig.GetPage-fm', '参数列表', '/api/v1/config', 'BUS', 'GET', '2021-05-13 19:59:03.116', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (54, 'go-admin/app/admin/apis.SysConfig.Get-fm', '参数通过id获取', '/api/v1/config/:id', 'BUS', 'GET', '2021-05-13 19:59:03.157', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (55, 'go-admin/app/admin/apis.SysConfig.GetSysConfigByKEYForService-fm', '参数通过键名搜索【基础默认配置】', '/api/v1/configKey/:configKey', 'SYS', 'GET', '2021-05-13 19:59:03.198', '2021-06-13 20:53:49.745', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (57, 'go-admin/app/jobs/apis.SysJob.RemoveJobForService-fm', 'job移除', '/api/v1/job/remove/:id', 'BUS', 'GET', '2021-05-13 19:59:03.295', '2021-06-13 20:53:49.786', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (58, 'go-admin/app/jobs/apis.SysJob.StartJobForService-fm', 'job启动', '/api/v1/job/start/:id', 'BUS', 'GET', '2021-05-13 19:59:03.339', '2021-06-13 20:53:49.829', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (59, 'go-admin/app/admin/apis.SysPost.GetPage-fm', '岗位列表', '/api/v1/post', 'BUS', 'GET', '2021-05-13 19:59:03.381', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (60, 'go-admin/app/admin/apis.SysPost.Get-fm', '岗位通过id获取', '/api/v1/post/:id', 'BUS', 'GET', '2021-05-13 19:59:03.433', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (62, 'go-admin/app/admin/apis.SysConfig.GetSysConfigBySysApp-fm', '系统前端参数', '/api/v1/app-config', 'SYS', 'GET', '2021-05-13 19:59:03.526', '2021-06-13 20:53:49.994', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (63, 'go-admin/app/admin/apis.SysUser.GetProfile-fm', '*用户信息获取', '/api/v1/user/profile', 'SYS', 'GET', '2021-05-13 19:59:03.567', '2021-06-13 20:53:50.038', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (66, 'github.com/go-admin-team/go-admin-core/sdk/pkg/ws.(*Manager).WsClient-fm', '链接ws【定时任务log】', '/ws/:id/:channel', 'BUS', 'GET', '2021-05-13 19:59:03.705', '2021-06-13 20:53:50.167', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (67, 'github.com/go-admin-team/go-admin-core/sdk/pkg/ws.(*Manager).UnWsClient-fm', '退出ws【定时任务log】', '/wslogout/:id/:channel', 'BUS', 'GET', '2021-05-13 19:59:03.756', '2021-06-13 20:53:50.209', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (68, 'go-admin/common/middleware/handler.Ping', '*用户基本信息', '/info', 'SYS', 'GET', '2021-05-13 19:59:03.800', '2021-06-13 20:53:50.251', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (72, 'go-admin/common/actions.CreateAction.func1', '分类创建', '/api/v1/syscategory', 'BUS', 'POST', '2021-05-13 19:59:03.982', '2021-06-13 20:53:50.336', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (73, 'go-admin/common/actions.CreateAction.func1', '内容创建', '/api/v1/syscontent', 'BUS', 'POST', '2021-05-13 19:59:04.027', '2021-06-13 20:53:50.375', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (76, 'go-admin/common/actions.CreateAction.func1', 'job创建', '/api/v1/sysjob', 'BUS', 'POST', '2021-05-13 19:59:04.164', '2021-06-13 20:53:50.500', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (80, 'go-admin/app/admin/apis.SysDictData.Insert-fm', '字典数据创建', '/api/v1/dict/data', 'BUS', 'POST', '2021-05-13 19:59:04.347', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (81, 'go-admin/app/admin/apis.SysDictType.Insert-fm', '字典类型创建', '/api/v1/dict/type', 'BUS', 'POST', '2021-05-13 19:59:04.391', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (82, 'go-admin/app/admin/apis.SysDept.Insert-fm', '部门创建', '/api/v1/dept', 'BUS', 'POST', '2021-05-13 19:59:04.435', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (85, 'github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth.(*GinJWTMiddleware).LoginHandler-fm', '*登录', '/api/v1/login', 'SYS', 'POST', '2021-05-13 19:59:04.597', '2021-06-13 20:53:50.784', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (86, 'go-admin/common/middleware/handler.LogOut', '*退出', '/api/v1/logout', 'SYS', 'POST', '2021-05-13 19:59:04.642', '2021-06-13 20:53:50.824', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (87, 'go-admin/app/admin/apis.SysConfig.Insert-fm', '参数创建', '/api/v1/config', 'BUS', 'POST', '2021-05-13 19:59:04.685', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (88, 'go-admin/app/admin/apis.SysMenu.Insert-fm', '菜单创建', '/api/v1/menu', 'BUS', 'POST', '2021-05-13 19:59:04.777', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (89, 'go-admin/app/admin/apis.SysPost.Insert-fm', '岗位创建', '/api/v1/post', 'BUS', 'POST', '2021-05-13 19:59:04.886', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (90, 'go-admin/app/admin/apis.SysRole.Insert-fm', '角色创建', '/api/v1/role', 'BUS', 'POST', '2021-05-13 19:59:04.975', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (91, 'go-admin/app/admin/apis.SysUser.InsetAvatar-fm', '*用户头像编辑', '/api/v1/user/avatar', 'SYS', 'POST', '2021-05-13 19:59:05.058', '2021-06-13 20:53:51.079', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (92, 'go-admin/app/admin/apis.SysApi.Update-fm', '接口编辑', '/api/v1/sys-api/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.122', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (95, 'go-admin/common/actions.UpdateAction.func1', '分类编辑', '/api/v1/syscategory/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.255', '2021-06-13 20:53:51.247', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (96, 'go-admin/common/actions.UpdateAction.func1', '内容编辑', '/api/v1/syscontent/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.299', '2021-06-13 20:53:51.289', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (97, 'go-admin/common/actions.UpdateAction.func1', 'job编辑', '/api/v1/sysjob', 'BUS', 'PUT', '2021-05-13 19:59:05.343', '2021-06-13 20:53:51.331', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (101, 'go-admin/app/admin/apis.SysDictData.Update-fm', '字典数据编辑', '/api/v1/dict/data/:dictCode', 'BUS', 'PUT', '2021-05-13 19:59:05.519', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (102, 'go-admin/app/admin/apis.SysDictType.Update-fm', '字典类型编辑', '/api/v1/dict/type/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.569', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (103, 'go-admin/app/admin/apis.SysDept.Update-fm', '部门编辑', '/api/v1/dept/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.613', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (104, 'go-admin/app/other/apis.SysFileDir.Update-fm', '文件夹编辑', '/api/v1/file-dir/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.662', '2021-06-13 20:53:51.847', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (105, 'go-admin/app/other/apis.SysFileInfo.Update-fm', '文件编辑', '/api/v1/file-info/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.709', '2021-06-13 20:53:51.892', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (106, 'go-admin/app/admin/apis.SysRole.Update-fm', '角色编辑', '/api/v1/role/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.752', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (107, 'go-admin/app/admin/apis.SysRole.Update2DataScope-fm', '角色数据权限修改', '/api/v1/roledatascope', 'BUS', 'PUT', '2021-05-13 19:59:05.803', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (108, 'go-admin/app/admin/apis.SysConfig.Update-fm', '参数编辑', '/api/v1/config/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.848', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (109, 'go-admin/app/admin/apis.SysMenu.Update-fm', '编辑菜单', '/api/v1/menu/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.891', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (110, 'go-admin/app/admin/apis.SysPost.Update-fm', '岗位编辑', '/api/v1/post/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.934', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (111, 'go-admin/app/admin/apis.SysUser.UpdatePwd-fm', '*用户修改密码', '/api/v1/user/pwd', 'SYS', 'PUT', '2021-05-13 19:59:05.987', '2021-06-13 20:53:51.724', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (112, 'go-admin/common/actions.DeleteAction.func1', '分类删除', '/api/v1/syscategory', 'BUS', 'DELETE', '2021-05-13 19:59:06.030', '2021-06-13 20:53:52.237', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (113, 'go-admin/common/actions.DeleteAction.func1', '内容删除', '/api/v1/syscontent', 'BUS', 'DELETE', '2021-05-13 19:59:06.076', '2021-06-13 20:53:52.278', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (114, 'go-admin/app/admin/apis.SysLoginLog.Delete-fm', '登录日志删除', '/api/v1/sys-login-log', 'BUS', 'DELETE', '2021-05-13 19:59:06.118', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (115, 'go-admin/app/admin/apis.SysOperaLog.Delete-fm', '操作日志删除', '/api/v1/sys-opera-log', 'BUS', 'DELETE', '2021-05-13 19:59:06.162', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (116, 'go-admin/common/actions.DeleteAction.func1', 'job删除', '/api/v1/sysjob', 'BUS', 'DELETE', '2021-05-13 19:59:06.206', '2021-06-13 20:53:52.323', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (117, 'go-admin/app/other/apis.SysChinaAreaData.Delete-fm', '行政区删除', '/api/v1/sys-area-data', 'BUS', 'DELETE', '2021-05-13 19:59:06.249', '2021-06-13 20:53:52.061', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (120, 'go-admin/app/admin/apis.SysDictData.Delete-fm', '字典数据删除', '/api/v1/dict/data', 'BUS', 'DELETE', '2021-05-13 19:59:06.387', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (121, 'go-admin/app/admin/apis.SysDictType.Delete-fm', '字典类型删除', '/api/v1/dict/type', 'BUS', 'DELETE', '2021-05-13 19:59:06.432', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (122, 'go-admin/app/admin/apis.SysDept.Delete-fm', '部门删除', '/api/v1/dept/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.475', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (123, 'go-admin/app/other/apis.SysFileDir.Delete-fm', '文件夹删除', '/api/v1/file-dir/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.520', '2021-06-13 20:53:52.539', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (124, 'go-admin/app/other/apis.SysFileInfo.Delete-fm', '文件删除', '/api/v1/file-info/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.566', '2021-06-13 20:53:52.580', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (125, 'go-admin/app/admin/apis.SysConfig.Delete-fm', '参数删除', '/api/v1/config', 'BUS', 'DELETE', '2021-05-13 19:59:06.612', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (126, 'go-admin/app/admin/apis.SysMenu.Delete-fm', '删除菜单', '/api/v1/menu', 'BUS', 'DELETE', '2021-05-13 19:59:06.654', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (127, 'go-admin/app/admin/apis.SysPost.Delete-fm', '岗位删除', '/api/v1/post/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.702', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (128, 'go-admin/app/admin/apis.SysRole.Delete-fm', '角色删除', '/api/v1/role', 'BUS', 'DELETE', '2021-05-13 19:59:06.746', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (131, 'github.com/go-admin-team/go-admin-core/tools/transfer.Handler.func1', '系统指标', '/api/v1/metrics', 'SYS', 'GET', '2021-05-17 22:13:55.933', '2021-06-13 20:53:49.614', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (132, 'go-admin/app/other/router.registerMonitorRouter.func1', '健康状态', '/api/v1/health', 'SYS', 'GET', '2021-05-17 22:13:56.285', '2021-06-13 20:53:49.951', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (133, 'go-admin/app/admin/apis.HelloWorld', '项目默认接口', '/', 'SYS', 'GET', '2021-05-24 10:30:44.553', '2021-06-13 20:53:47.406', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (134, 'go-admin/app/other/apis.ServerMonitor.ServerInfo-fm', '服务器基本状态', '/api/v1/server-monitor', 'SYS', 'GET', '2021-05-24 10:30:44.937', '2021-06-13 20:53:48.255', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (135, 'go-admin/app/admin/apis.SysApi.GetPage-fm', '接口列表', '/api/v1/sys-api', 'BUS', 'GET', '2021-05-24 11:37:53.303', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (136, 'go-admin/app/admin/apis.SysApi.Get-fm', '接口通过id获取', '/api/v1/sys-api/:id', 'BUS', 'GET', '2021-05-24 11:37:53.359', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (137, 'go-admin/app/admin/apis.SysLoginLog.GetPage-fm', '登录日志列表', '/api/v1/sys-login-log', 'BUS', 'GET', '2021-05-24 11:47:30.397', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (138, 'go-admin/app/other/apis.File.UploadFile-fm', '文件上传', '/api/v1/public/uploadFile', 'SYS', 'POST', '2021-05-25 19:16:18.493', '2021-06-13 20:53:50.866', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (139, 'go-admin/app/admin/apis.SysConfig.Update2Set-fm', '参数信息修改【参数配置】', '/api/v1/set-config', 'BUS', 'PUT', '2021-05-27 09:45:14.853', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (140, 'go-admin/app/admin/apis.SysConfig.Get2Set-fm', '参数获取全部【配置使用】', '/api/v1/set-config', 'BUS', 'GET', '2021-05-27 11:54:14.384', '2021-06-17 11:48:40.732', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (141, 'go-admin/app/admin/apis.SysUser.GetPage-fm', '管理员列表', '/api/v1/sys-user', 'BUS', 'GET', '2021-06-13 19:24:57.111', '2021-06-17 20:31:14.318', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (142, 'go-admin/app/admin/apis.SysUser.Get-fm', '管理员通过id获取', '/api/v1/sys-user/:id', 'BUS', 'GET', '2021-06-13 19:24:57.188', '2021-06-17 20:31:14.318', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (143, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTablesInfo-fm', '', '/api/v1/sys/tables/info', '', 'GET', '2021-06-13 19:24:57.437', '2021-06-13 20:53:48.047', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (144, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTables-fm', '', '/api/v1/sys/tables/info/:tableId', '', 'GET', '2021-06-13 19:24:57.510', '2021-06-13 20:53:48.088', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (145, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTableList-fm', '', '/api/v1/sys/tables/page', '', 'GET', '2021-06-13 19:24:57.582', '2021-06-13 20:53:48.128', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (146, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/static/*filepath', '', 'GET', '2021-06-13 19:24:59.641', '2021-06-13 20:53:50.081', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (147, 'github.com/swaggo/gin-swagger.CustomWrapHandler.func1', '', '/swagger/*any', '', 'GET', '2021-06-13 19:24:59.713', '2021-06-13 20:53:50.123', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (148, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/form-generator/*filepath', '', 'GET', '2021-06-13 19:24:59.914', '2021-06-13 20:53:50.295', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (149, 'go-admin/app/admin/apis/tools.(*SysTable).InsertSysTable-fm', '', '/api/v1/sys/tables/info', '', 'POST', '2021-06-13 19:25:00.163', '2021-06-13 20:53:50.539', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (150, 'go-admin/app/admin/apis.SysUser.Insert-fm', '管理员创建', '/api/v1/sys-user', 'BUS', 'POST', '2021-06-13 19:25:00.233', '2021-06-17 20:31:14.318', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (151, 'go-admin/app/admin/apis.SysUser.Update-fm', '管理员编辑', '/api/v1/sys-user', 'BUS', 'PUT', '2021-06-13 19:25:00.986', '2021-06-17 20:31:14.318', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (152, 'go-admin/app/admin/apis/tools.(*SysTable).UpdateSysTable-fm', '', '/api/v1/sys/tables/info', '', 'PUT', '2021-06-13 19:25:01.149', '2021-06-13 20:53:51.375', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (153, 'go-admin/app/admin/apis.SysRole.Update2Status-fm', '', '/api/v1/role-status', '', 'PUT', '2021-06-13 19:25:01.446', '2021-06-13 20:53:51.636', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (154, 'go-admin/app/admin/apis.SysUser.ResetPwd-fm', '', '/api/v1/user/pwd/reset', '', 'PUT', '2021-06-13 19:25:01.601', '2021-06-13 20:53:51.764', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (155, 'go-admin/app/admin/apis.SysUser.UpdateStatus-fm', '', '/api/v1/user/status', '', 'PUT', '2021-06-13 19:25:01.671', '2021-06-13 20:53:51.806', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (156, 'go-admin/app/admin/apis.SysUser.Delete-fm', '管理员删除', '/api/v1/sys-user', 'BUS', 'DELETE', '2021-06-13 19:25:02.043', '2021-06-17 20:31:14.318', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (157, 'go-admin/app/admin/apis/tools.(*SysTable).DeleteSysTables-fm', '', '/api/v1/sys/tables/info/:tableId', '', 'DELETE', '2021-06-13 19:25:02.283', '2021-06-13 20:53:52.367', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (158, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/static/*filepath', '', 'HEAD', '2021-06-13 19:25:02.734', '2021-06-13 20:53:52.791', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (159, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/form-generator/*filepath', '', 'HEAD', '2021-06-13 19:25:02.808', '2021-06-13 20:53:52.838', NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_casbin_rule`;
CREATE TABLE `sys_casbin_rule` (
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  UNIQUE KEY `idx_sys_casbin_rule` (`p_type`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_columns
-- ----------------------------
DROP TABLE IF EXISTS `sys_columns`;
CREATE TABLE `sys_columns` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` bigint(20) DEFAULT NULL,
  `column_name` varchar(128) DEFAULT NULL,
  `column_comment` varchar(128) DEFAULT NULL,
  `column_type` varchar(128) DEFAULT NULL,
  `go_type` varchar(128) DEFAULT NULL,
  `go_field` varchar(128) DEFAULT NULL,
  `json_field` varchar(128) DEFAULT NULL,
  `is_pk` varchar(4) DEFAULT NULL,
  `is_increment` varchar(4) DEFAULT NULL,
  `is_required` varchar(4) DEFAULT NULL,
  `is_insert` varchar(4) DEFAULT NULL,
  `is_edit` varchar(4) DEFAULT NULL,
  `is_list` varchar(4) DEFAULT NULL,
  `is_query` varchar(4) DEFAULT NULL,
  `query_type` varchar(128) DEFAULT NULL,
  `html_type` varchar(128) DEFAULT NULL,
  `dict_type` varchar(128) DEFAULT NULL,
  `sort` bigint(20) DEFAULT NULL,
  `list` varchar(1) DEFAULT NULL,
  `pk` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `super_column` tinyint(1) DEFAULT NULL,
  `usable_column` tinyint(1) DEFAULT NULL,
  `increment` tinyint(1) DEFAULT NULL,
  `insert` tinyint(1) DEFAULT NULL,
  `edit` tinyint(1) DEFAULT NULL,
  `query` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `fk_table_name` longtext,
  `fk_table_name_class` longtext,
  `fk_table_name_package` longtext,
  `fk_label_id` longtext,
  `fk_label_name` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`column_id`),
  KEY `idx_sys_columns_create_by` (`create_by`),
  KEY `idx_sys_columns_update_by` (`update_by`),
  KEY `idx_sys_columns_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_columns
-- ----------------------------
BEGIN;
INSERT INTO `sys_columns` VALUES (1, 1, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.617', '2021-12-25 00:58:57.617', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (2, 1, 'name', '网络名称', 'varchar(255)', 'string', 'Name', 'name', '0', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.619', '2021-12-25 02:00:37.530', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (3, 1, 'rpc_url', 'RPC地址', 'varchar(255)', 'string', 'RpcUrl', 'rpcUrl', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.621', '2021-12-25 02:00:37.531', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (4, 1, 'chain_id', '链ID', 'int(11)', 'string', 'ChainId', 'chainId', '0', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.622', '2021-12-25 02:00:37.533', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (5, 1, 'symbol', '代币名称', 'varchar(255)', 'string', 'Symbol', 'symbol', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.624', '2021-12-25 02:00:37.534', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (6, 1, 'block_url', '区块浏览器', 'varchar(255)', 'string', 'BlockUrl', 'blockUrl', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.625', '2021-12-25 02:00:37.535', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (7, 1, 'is_del', '', 'blob', 'string', 'IsDel', 'isDel', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.627', '2021-12-25 02:00:37.536', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (8, 1, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.628', '2021-12-25 00:58:57.628', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (9, 1, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.629', '2021-12-25 00:58:57.629', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (10, 1, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.630', '2021-12-25 00:58:57.630', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (11, 1, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.631', '2021-12-25 00:58:57.631', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (12, 1, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:58:57.632', '2021-12-25 00:58:57.632', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (13, 2, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:11.995', '2021-12-25 00:59:11.995', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (14, 2, 'name', 'nft name', 'varchar(255)', 'string', 'Name', 'name', '0', '', '0', '1', '', '', '1', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:11.996', '2021-12-25 01:02:51.164', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (15, 2, 'symbol', 'nft symbol', 'varchar(255)', 'string', 'Symbol', 'symbol', '0', '', '0', '1', '', '', '1', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.001', '2021-12-25 01:02:51.173', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (16, 2, 'address', '合约地址', 'varchar(255)', 'string', 'Address', 'address', '0', '', '0', '1', '', '', '1', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.002', '2021-12-25 01:02:51.176', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (17, 2, 'type', '合约类型', 'int(3)', 'string', 'Type', 'type', '0', '', '0', '1', '', '', '1', 'EQ', 'input', 'sys_contract', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.003', '2021-12-25 01:02:51.178', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (18, 2, 'network_type', '主网类型', 'varchar(255)', 'string', 'NetworkType', 'networkType', '0', '', '0', '1', '', '', '0', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.004', '2021-12-25 01:02:51.181', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (19, 2, 'network_url', '主网url', 'varchar(255)', 'string', 'NetworkUrl', 'networkUrl', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.005', '2021-12-25 01:02:51.184', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (20, 2, 'verify', '是否验证', 'blob', 'string', 'Verify', 'verify', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.007', '2021-12-25 01:02:51.188', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (21, 2, 'description', '描述', 'varchar(255)', 'string', 'Description', 'description', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.008', '2021-12-25 01:02:51.191', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (22, 2, 'is_del', '软删除', 'blob', 'string', 'IsDel', 'isDel', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.009', '2021-12-25 01:02:51.193', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (23, 2, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.010', '2021-12-25 00:59:12.010', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (24, 2, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.011', '2021-12-25 00:59:12.011', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (25, 2, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.013', '2021-12-25 00:59:12.013', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (26, 2, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.014', '2021-12-25 00:59:12.014', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (27, 2, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.015', '2021-12-25 00:59:12.015', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (28, 3, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.019', '2021-12-25 00:59:12.019', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (29, 3, 'contract_id', '合约id', 'int(11)', 'int', 'ContractId', 'contractId', '1', '', '1', '1', '', '1', '1', 'EQ', 'select', '', 2, '', 1, 1, 0, 0, 0, 1, 0, 0, '', 'sys_contract', 'SysContract', 'sys-contract', 'id', 'symbol', '2021-12-25 00:59:12.020', '2021-12-25 11:14:55.371', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (30, 3, 'token_id', 'TokenID', 'int(11)', 'int', 'TokenId', 'tokenId', '1', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 3, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.022', '2021-12-25 11:14:55.374', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (31, 3, 'amount', '数量', 'int(11)', 'string', 'Amount', 'amount', '0', '', '1', '1', '', '1', '0', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.023', '2021-12-25 11:14:55.376', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (32, 3, 'name', '名称', 'varchar(255)', 'string', 'Name', 'name', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.024', '2021-12-25 11:14:55.377', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (33, 3, 'description', '描述', 'text', 'string', 'Description', 'description', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.025', '2021-12-25 11:14:55.379', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (34, 3, 'properties', '属性', 'varchar(255)', 'string', 'Properties', 'properties', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 7, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.027', '2021-12-25 11:14:55.381', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (35, 3, 'img_url', '图标地址', 'varchar(255)', 'string', 'ImgUrl', 'imgUrl', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.028', '2021-12-25 11:14:55.383', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (36, 3, 'creator', '拥有者', 'varchar(255)', 'string', 'Creator', 'creator', '0', '', '0', '1', '', '1', '1', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.029', '2021-12-25 11:14:55.384', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (37, 3, 'tx_hash', '区块hash', 'varchar(255)', 'string', 'TxHash', 'txHash', '0', '', '0', '0', '', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.030', '2021-12-25 11:14:55.386', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (38, 3, 'metadata_url', '资源url', 'varchar(255)', 'string', 'MetadataUrl', 'metadataUrl', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.031', '2021-12-25 11:14:55.387', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (39, 3, 'metadata_content', '资源内容', 'varchar(255)', 'string', 'MetadataContent', 'metadataContent', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.032', '2021-12-25 11:14:55.388', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (40, 3, 'is_sync', '铸币状态', 'blob', 'string', 'IsSync', 'isSync', '0', '', '1', '0', '', '1', '', 'EQ', 'select', 'token_sync', 13, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.033', '2021-12-25 11:14:55.389', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (41, 3, 'is_del', '', 'blob', 'string', 'IsDel', 'isDel', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.034', '2021-12-25 11:14:55.391', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (42, 3, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.035', '2021-12-25 00:59:12.035', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (43, 3, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.036', '2021-12-25 00:59:12.036', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (44, 3, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.037', '2021-12-25 00:59:12.037', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (45, 3, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.039', '2021-12-25 00:59:12.039', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (46, 3, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 00:59:12.040', '2021-12-25 00:59:12.040', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (47, 4, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.047', '2021-12-25 01:03:46.047', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (48, 4, 'name', 'name', 'varchar(255)', 'string', 'Name', 'name', '0', '', '0', '1', '', '1', '1', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.049', '2021-12-25 12:25:09.606', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (49, 4, 'symbol', 'symbol', 'varchar(255)', 'string', 'Symbol', 'symbol', '0', '', '0', '1', '', '1', '1', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.050', '2021-12-25 12:25:09.608', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (50, 4, 'address', '合约地址', 'varchar(255)', 'string', 'Address', 'address', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.051', '2021-12-25 12:25:09.609', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (51, 4, 'type', '合约类型', 'int(3)', 'string', 'Type', 'type', '0', '', '0', '1', '', '1', '1', 'EQ', 'select', 'sys_contract', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.053', '2021-12-25 12:25:09.610', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (52, 4, 'network_id', '主网类型', 'int(11)', 'string', 'NetworkId', 'networkId', '0', '', '0', '1', '', '1', '1', 'EQ', 'select', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', 'sys_network', 'SysNetwork', 'sys-network', 'id', 'name', '2021-12-25 01:03:46.054', '2021-12-25 12:25:09.611', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (54, 4, 'verify', '是否验证', 'blob', 'string', 'Verify', 'verify', '0', '', '0', '1', '', '1', '', 'EQ', 'select', 'contract_verify', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.056', '2021-12-25 12:25:09.613', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (55, 4, 'description', '描述', 'varchar(255)', 'string', 'Description', 'description', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.057', '2021-12-25 12:25:09.614', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (56, 4, 'is_del', '软删除', 'blob', 'string', 'IsDel', 'isDel', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.058', '2021-12-25 12:25:09.616', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (57, 4, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.059', '2021-12-25 01:03:46.059', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (58, 4, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.060', '2021-12-25 01:03:46.060', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (59, 4, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.060', '2021-12-25 01:03:46.060', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (60, 4, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.062', '2021-12-25 01:03:46.062', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (61, 4, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 01:03:46.064', '2021-12-25 01:03:46.064', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (62, 5, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.186', '2021-12-25 20:08:10.186', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (63, 5, 'name', '网络名称', 'varchar(255)', 'string', 'Name', 'name', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.190', '2021-12-25 20:10:25.101', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (64, 5, 'rpc_url', 'RPC地址', 'varchar(255)', 'string', 'RpcUrl', 'rpcUrl', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.191', '2021-12-25 20:10:25.103', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (65, 5, 'chain_id', '链ID', 'int(11)', 'string', 'ChainId', 'chainId', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.193', '2021-12-25 20:10:25.105', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (66, 5, 'symbol', '代币名称', 'varchar(255)', 'string', 'Symbol', 'symbol', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.196', '2021-12-25 20:10:25.106', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (67, 5, 'block_url', '区块浏览器', 'varchar(255)', 'string', 'BlockUrl', 'blockUrl', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.197', '2021-12-25 20:10:25.108', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (68, 5, 'ipfs_bind_dir', 'IPFS目录', 'varchar(255)', 'string', 'IpfsBindDir', 'ipfsBindDir', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.198', '2021-12-25 20:10:25.110', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (69, 5, 'ipfs_is_push', 'IPFS初始化', 'blob', 'string', 'IpfsIsPush', 'ipfsIsPush', '0', '', '0', '1', '', '1', '', 'EQ', 'select', 'ipfs_network_init', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.199', '2021-12-25 20:10:25.111', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (70, 5, 'is_del', '', 'blob', 'string', 'IsDel', 'isDel', '0', '', '0', '0', '', '', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.200', '2021-12-25 20:10:25.114', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (71, 5, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.201', '2021-12-25 20:08:10.201', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (72, 5, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.202', '2021-12-25 20:08:10.202', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (73, 5, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.203', '2021-12-25 20:08:10.203', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (74, 5, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.204', '2021-12-25 20:08:10.204', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (75, 5, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2021-12-25 20:08:10.205', '2021-12-25 20:08:10.205', NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `config_name` varchar(128) DEFAULT NULL COMMENT 'ConfigName',
  `config_key` varchar(128) DEFAULT NULL COMMENT 'ConfigKey',
  `config_value` varchar(255) DEFAULT NULL COMMENT 'ConfigValue',
  `config_type` varchar(64) DEFAULT NULL COMMENT 'ConfigType',
  `is_frontend` varchar(64) DEFAULT NULL COMMENT '是否前台',
  `remark` varchar(128) DEFAULT NULL COMMENT 'Remark',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_config_deleted_at` (`deleted_at`),
  KEY `idx_sys_config_create_by` (`create_by`),
  KEY `idx_sys_config_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '皮肤样式', 'sys_index_skinName', 'skin-green', 'Y', '0', '主框架页-默认皮肤样式名称:蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 13:50:13.123', NULL);
INSERT INTO `sys_config` VALUES (2, '初始密码', 'sys_user_initPassword', '123456', 'Y', '0', '用户管理-账号初始密码:123456', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
INSERT INTO `sys_config` VALUES (3, '侧栏主题', 'sys_index_sideTheme', 'theme-dark', 'Y', '0', '主框架页-侧边栏主题:深色主题theme-dark，浅色主题theme-light', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
INSERT INTO `sys_config` VALUES (4, '系统名称', 'sys_app_name', 'nft铸币系统', 'Y', '1', '', 1, 0, '2021-03-17 08:52:06.067', '2021-12-25 00:59:51.256', NULL);
INSERT INTO `sys_config` VALUES (5, '系统logo', 'sys_app_logo', 'https://gitee.com/mydearzwj/image/raw/master/img/go-admin.png', 'Y', '1', '', 1, 0, '2021-03-17 08:53:19.462', '2021-03-17 08:53:19.462', NULL);
INSERT INTO `sys_config` VALUES (6, 'IPFS地址', 'ipfs_url', 'http://127.0.0.1:8080/ipfs/', 'Y', '0', '', 1, 1, '2021-03-17 08:53:19.462', '2021-12-25 22:46:33.131', NULL);
INSERT INTO `sys_config` VALUES (7, 'IPFS IP', 'ipfs_ip', '127.0.0.1', 'Y', '0', '', 1, 1, '2021-03-17 08:53:19.462', '2021-12-25 22:46:33.117', NULL);
INSERT INTO `sys_config` VALUES (8, 'IPFS端口', 'ipfs_port', '5001', 'Y', '0', '', 1, 1, '2021-03-17 08:53:19.462', '2021-12-25 02:32:35.824', NULL);
INSERT INTO `sys_config` VALUES (9, '私钥', 'eth_private', '2fa6cbab9d2c34246f3bf5cb9edfedee1c5ca5d62d3bd90ff8ae737b46d73dcc', 'Y', '0', '', 1, 1, '2021-03-17 08:53:19.462', '2021-12-28 17:50:58.916', NULL);
INSERT INTO `sys_config` VALUES (10, '最大发行量', 'token_amount', '100', 'Y', '0', '', 1, 1, '2021-03-17 08:53:19.462', '2021-12-28 17:50:58.911', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_contract
-- ----------------------------
DROP TABLE IF EXISTS `sys_contract`;
CREATE TABLE `sys_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'name',
  `symbol` varchar(255) DEFAULT NULL COMMENT 'symbol',
  `address` varchar(255) DEFAULT NULL COMMENT '合约地址',
  `type` int(3) DEFAULT NULL COMMENT '0:erc20 1:erc721 2:erc1155',
  `network_id` int(11) DEFAULT NULL COMMENT '主网类型',
  `verify` blob COMMENT '是否验证',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_del` blob COMMENT '软删除',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='合约';

-- ----------------------------
-- Records of sys_contract
-- ----------------------------
BEGIN;
INSERT INTO `sys_contract` VALUES (1, 'ss', 'ss', '0xeA5b3D86c3B2246288F594ed7b7072B5839f9aeB', 3, 5, 0x30, '', '', '2021-12-25 02:23:44.319', '2021-12-25 13:11:06.179', NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_contract_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_contract_token`;
CREATE TABLE `sys_contract_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '合约id',
  `token_id` decimal(50,0) unsigned NOT NULL COMMENT 'TokenID',
  `amount` int(11) NOT NULL COMMENT '数量',
  `stock` int(11) NOT NULL COMMENT '库存',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` text NOT NULL COMMENT '描述',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `img_url` varchar(255) NOT NULL COMMENT '图标地址',
  `creator` varchar(255) NOT NULL COMMENT '拥有者',
  `tx_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区块hash',
  `metadata_url` varchar(255) NOT NULL COMMENT '资源url',
  `metadata_content` text NOT NULL COMMENT '资源内容',
  `is_sync` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_del` blob,
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `copyright_owner` varchar(255) DEFAULT NULL COMMENT '版权方',
  `author` varchar(255) DEFAULT NULL COMMENT '著作人',
  `issuer` varchar(255) DEFAULT NULL COMMENT '发行方',
  `issuer_date` datetime(3) DEFAULT NULL COMMENT '发行日期',
  `token_cid` varchar(255) DEFAULT NULL COMMENT 'IPFS存储哈希',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='合约token';

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `dept_path` varchar(255) DEFAULT NULL,
  `dept_name` varchar(128) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `leader` varchar(128) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`),
  KEY `idx_sys_dept_create_by` (`create_by`),
  KEY `idx_sys_dept_update_by` (`update_by`),
  KEY `idx_sys_dept_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, '/0/1/', '爱拓科技', 0, 'aituo', '13782218188', 'atuo@aituo.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 17:06:44.960', NULL);
INSERT INTO `sys_dept` VALUES (7, 1, '/0/1/7/', '研发部', 1, 'aituo', '13782218188', 'atuo@aituo.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2021-06-16 21:35:00.109', NULL);
INSERT INTO `sys_dept` VALUES (8, 1, '/0/1/8/', '运维部', 0, 'aituo', '13782218188', 'atuo@aituo.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2021-06-16 21:41:39.747', NULL);
INSERT INTO `sys_dept` VALUES (9, 1, '/0/1/9/', '客服部', 0, 'aituo', '13782218188', 'atuo@aituo.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 17:07:05.993', NULL);
INSERT INTO `sys_dept` VALUES (10, 1, '/0/1/10/', '人力资源', 3, 'aituo', '13782218188', 'atuo@aituo.com', 1, 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 17:07:08.503', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_sort` bigint(20) DEFAULT NULL,
  `dict_label` varchar(128) DEFAULT NULL,
  `dict_value` varchar(255) DEFAULT NULL,
  `dict_type` varchar(64) DEFAULT NULL,
  `css_class` varchar(128) DEFAULT NULL,
  `list_class` varchar(128) DEFAULT NULL,
  `is_default` varchar(8) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `default` varchar(8) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_code`),
  KEY `idx_sys_dict_data_create_by` (`create_by`),
  KEY `idx_sys_dict_data_update_by` (`update_by`),
  KEY `idx_sys_dict_data_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 0, '正常', '2', 'sys_normal_disable', '', '', '', 2, '', '系统正常', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:40.168', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 0, '停用', '1', 'sys_normal_disable', '', '', '', 2, '', '系统停用', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (3, 0, '男', '0', 'sys_user_sex', '', '', '', 2, '', '性别男', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (4, 0, '女', '1', 'sys_user_sex', '', '', '', 2, '', '性别女', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (5, 0, '未知', '2', 'sys_user_sex', '', '', '', 2, '', '性别未知', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (6, 0, '显示', '0', 'sys_show_hide', '', '', '', 2, '', '显示菜单', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (7, 0, '隐藏', '1', 'sys_show_hide', '', '', '', 2, '', '隐藏菜单', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (8, 0, '是', 'Y', 'sys_yes_no', '', '', '', 2, '', '系统默认是', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (9, 0, '否', 'N', 'sys_yes_no', '', '', '', 2, '', '系统默认否', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (10, 0, '正常', '2', 'sys_job_status', '', '', '', 2, '', '正常状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (11, 0, '停用', '1', 'sys_job_status', '', '', '', 2, '', '停用状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (12, 0, '默认', 'DEFAULT', 'sys_job_group', '', '', '', 2, '', '默认分组', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (13, 0, '系统', 'SYSTEM', 'sys_job_group', '', '', '', 2, '', '系统分组', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (14, 0, '通知', '1', 'sys_notice_type', '', '', '', 2, '', '通知', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (15, 0, '公告', '2', 'sys_notice_type', '', '', '', 2, '', '公告', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (16, 0, '正常', '2', 'sys_common_status', '', '', '', 2, '', '正常状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (17, 0, '关闭', '1', 'sys_common_status', '', '', '', 2, '', '关闭状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (18, 0, '新增', '1', 'sys_oper_type', '', '', '', 2, '', '新增操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (19, 0, '修改', '2', 'sys_oper_type', '', '', '', 2, '', '修改操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (20, 0, '删除', '3', 'sys_oper_type', '', '', '', 2, '', '删除操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (21, 0, '授权', '4', 'sys_oper_type', '', '', '', 2, '', '授权操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (22, 0, '导出', '5', 'sys_oper_type', '', '', '', 2, '', '导出操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (23, 0, '导入', '6', 'sys_oper_type', '', '', '', 2, '', '导入操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (24, 0, '强退', '7', 'sys_oper_type', '', '', '', 2, '', '强退操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (25, 0, '生成代码', '8', 'sys_oper_type', '', '', '', 2, '', '生成操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (26, 0, '清空数据', '9', 'sys_oper_type', '', '', '', 2, '', '清空操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (27, 0, '成功', '0', 'sys_notice_status', '', '', '', 2, '', '成功状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (28, 0, '失败', '1', 'sys_notice_status', '', '', '', 2, '', '失败状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (29, 0, '登录', '10', 'sys_oper_type', '', '', '', 2, '', '登录操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '退出', '11', 'sys_oper_type', '', '', '', 2, '', '', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '获取验证码', '12', 'sys_oper_type', '', '', '', 2, '', '获取验证码', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 0, '正常', '1', 'sys_content_status', '', '', '', 1, '', '', 1, 1, '2021-05-13 19:56:40.845', '2021-05-13 19:56:40.845', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 1, '禁用', '2', 'sys_content_status', '', '', '', 1, '', '', 1, 1, '2021-05-13 19:56:40.845', '2021-05-13 19:56:40.845', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 0, 'ERC20', '1', 'sys_contract', '', '', '', 2, '', '', 0, 0, '2021-12-25 01:00:31.864', '2021-12-25 01:00:31.864', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 0, 'ERC721', '2', 'sys_contract', '', '', '', 2, '', '', 0, 0, '2021-12-25 01:00:38.005', '2021-12-25 01:00:38.005', NULL);
INSERT INTO `sys_dict_data` VALUES (36, 0, 'ERC1155', '3', 'sys_contract', '', '', '', 2, '', '', 0, 0, '2021-12-25 01:00:44.607', '2021-12-25 01:00:44.607', NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '未验证', '0', 'contract_verify', NULL, NULL, NULL, 2, NULL, NULL, 0, 0, '2021-12-25 01:56:46.243', '2021-12-25 01:56:46.243', NULL);
INSERT INTO `sys_dict_data` VALUES (41, 0, '已验证', '1', 'contract_verify', NULL, NULL, NULL, 2, NULL, NULL, 0, 0, '2021-12-25 01:56:46.243', '2021-12-25 01:56:46.243', NULL);
INSERT INTO `sys_dict_data` VALUES (42, 0, '待发布', '0', 'token_sync', '', '', '', 2, '', '', 0, 0, '2021-12-25 02:35:17.273', '2021-12-25 02:35:17.273', NULL);
INSERT INTO `sys_dict_data` VALUES (43, 0, '已发布', '1', 'token_sync', '', '', '', 2, '', '', 0, 0, '2021-12-25 02:35:23.566', '2021-12-25 02:35:23.566', NULL);
INSERT INTO `sys_dict_data` VALUES (44, 0, '已创建', '1', 'ipfs_network_init', '', '', '', 2, '', '', 0, 0, '2021-12-25 20:10:01.473', '2021-12-25 20:10:01.473', NULL);
INSERT INTO `sys_dict_data` VALUES (45, 0, '未创建', '0', 'ipfs_network_init', '', '', '', 2, '', '', 0, 0, '2021-12-25 20:10:07.382', '2021-12-25 20:10:07.382', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(128) DEFAULT NULL,
  `dict_type` varchar(128) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_id`),
  KEY `idx_sys_dict_type_deleted_at` (`deleted_at`),
  KEY `idx_sys_dict_type_create_by` (`create_by`),
  KEY `idx_sys_dict_type_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '系统开关', 'sys_normal_disable', 2, '系统开关列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (2, '用户性别', 'sys_user_sex', 2, '用户性别列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (3, '菜单状态', 'sys_show_hide', 2, '菜单状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (4, '系统是否', 'sys_yes_no', 2, '系统是否列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (5, '任务状态', 'sys_job_status', 2, '任务状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (6, '任务分组', 'sys_job_group', 2, '任务分组列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', 2, '通知类型列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (8, '系统状态', 'sys_common_status', 2, '登录状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', 2, '操作类型列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (10, '通知状态', 'sys_notice_status', 2, '通知状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (11, '内容状态', 'sys_content_status', 2, '', 1, 1, '2021-05-13 19:56:40.813', '2021-05-13 19:56:40.813', NULL);
INSERT INTO `sys_dict_type` VALUES (12, '合约类型', 'sys_contract', 2, '', 1, 1, '2021-12-25 01:00:17.972', '2021-12-25 01:00:17.972', NULL);
INSERT INTO `sys_dict_type` VALUES (13, '合约验证', 'contract_verify', 2, '合约是否开源', 1, 1, '2021-12-25 01:56:24.970', '2021-12-25 01:56:24.970', NULL);
INSERT INTO `sys_dict_type` VALUES (14, '代币发布状态', 'token_sync', 2, '', 0, 0, '2021-12-25 02:34:53.753', '2021-12-25 02:34:53.753', NULL);
INSERT INTO `sys_dict_type` VALUES (15, 'IPFS主网初始化', 'ipfs_network_init', 2, '', 0, 0, '2021-12-25 20:09:41.194', '2021-12-25 20:09:41.194', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `job_group` varchar(255) DEFAULT NULL,
  `job_type` tinyint(4) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `invoke_target` varchar(255) DEFAULT NULL,
  `args` varchar(255) DEFAULT NULL,
  `misfire_policy` bigint(20) DEFAULT NULL,
  `concurrent` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `entry_id` smallint(6) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`job_id`),
  KEY `idx_sys_job_create_by` (`create_by`),
  KEY `idx_sys_job_update_by` (`update_by`),
  KEY `idx_sys_job_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '接口测试', 'DEFAULT', 1, '0/5 * * * * ', 'http://localhost:8000', '', 1, 1, 1, 0, '2021-05-13 19:56:37.914', '2021-06-14 20:59:55.417', NULL, 1, 1);
INSERT INTO `sys_job` VALUES (2, '函数测试', 'DEFAULT', 2, '0/5 * * * * ', 'ExamplesOne', '参数', 1, 1, 1, 0, '2021-05-13 19:56:37.914', '2021-05-31 23:55:37.221', NULL, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `username` varchar(128) DEFAULT NULL COMMENT '用户名',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `login_location` varchar(255) DEFAULT NULL COMMENT '归属地',
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) DEFAULT NULL COMMENT '系统',
  `platform` varchar(255) DEFAULT NULL COMMENT '固件',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `msg` varchar(255) DEFAULT NULL COMMENT '信息',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `idx_sys_login_log_create_by` (`create_by`),
  KEY `idx_sys_login_log_update_by` (`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `paths` varchar(128) DEFAULT NULL,
  `menu_type` varchar(1) DEFAULT NULL,
  `action` varchar(16) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `parent_id` smallint(6) DEFAULT NULL,
  `no_cache` tinyint(1) DEFAULT NULL,
  `breadcrumb` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `visible` varchar(1) DEFAULT NULL,
  `is_frame` varchar(1) DEFAULT '0',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`menu_id`),
  KEY `idx_sys_menu_deleted_at` (`deleted_at`),
  KEY `idx_sys_menu_create_by` (`create_by`),
  KEY `idx_sys_menu_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (2, 'Admin', '系统管理', 'api-server', '/admin', '/0/2', 'M', '无', '', 0, 1, '', 'Layout', 0, '0', '1', 0, 1, '2021-05-20 21:58:45.679', '2021-12-25 01:16:37.493', NULL);
INSERT INTO `sys_menu` VALUES (3, 'SysUserManage', '用户管理', 'user', '/admin/sys-user', '/0/2/3', 'C', '无', 'admin:sysUser:list', 2, 0, '', '/admin/sys-user/index', 10, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 20:31:14.305', NULL);
INSERT INTO `sys_menu` VALUES (43, '', '新增管理员', 'app-group-fill', '', '/0/2/3/43', 'F', 'POST', 'admin:sysUser:add', 3, 0, '', '', 10, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 20:31:14.305', NULL);
INSERT INTO `sys_menu` VALUES (44, '', '查询管理员', 'app-group-fill', '', '/0/2/3/44', 'F', 'GET', 'admin:sysUser:query', 3, 0, '', '', 40, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 20:31:14.305', NULL);
INSERT INTO `sys_menu` VALUES (45, '', '修改管理员', 'app-group-fill', '', '/0/2/3/45', 'F', 'PUT', 'admin:sysUser:edit', 3, 0, '', '', 30, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 20:31:14.305', NULL);
INSERT INTO `sys_menu` VALUES (46, '', '删除管理员', 'app-group-fill', '', '/0/2/3/46', 'F', 'DELETE', 'admin:sysUser:remove', 3, 0, '', '', 20, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 20:31:14.305', NULL);
INSERT INTO `sys_menu` VALUES (51, 'SysMenuManage', '菜单管理', 'tree-table', '/admin/sys-menu', '/0/2/51', 'C', '无', 'admin:sysMenu:list', 2, 1, '', '/admin/sys-menu/index', 30, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (52, 'SysRoleManage', '角色管理', 'peoples', '/admin/sys-role', '/0/2/52', 'C', '无', 'admin:sysRole:list', 2, 1, '', '/admin/sys-role/index', 20, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (56, 'SysDeptManage', '部门管理', 'tree', '/admin/sys-dept', '/0/2/56', 'C', '无', 'admin:sysDept:list', 2, 0, '', '/admin/sys-dept/index', 40, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (57, 'SysPostManage', '岗位管理', 'pass', '/admin/sys-post', '/0/2/57', 'C', '无', 'admin:sysPost:list', 2, 0, '', '/admin/sys-post/index', 50, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (58, 'Dict', '字典管理', 'education', '/admin/dict', '/0/2/58', 'C', '无', 'admin:sysDictType:list', 2, 0, '', '/admin/dict/index', 60, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (59, 'SysDictDataManage', '字典数据', 'education', '/admin/dict/data/:dictId', '/0/2/59', 'C', '无', 'admin:sysDictData:list', 2, 0, '', '/admin/dict/data', 100, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (60, 'Tools', '开发工具', 'dev-tools', '/dev-tools', '/0/60', 'M', '无', '', 0, 0, '', 'Layout', 40, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (61, 'Swagger', '系统接口', 'guide', '/dev-tools/swagger', '/0/60/61', 'C', '无', '', 60, 0, '', '/dev-tools/swagger/index', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (62, 'SysConfigManage', '参数管理', 'swagger', '/admin/sys-config', '/0/2/62', 'C', '无', 'admin:sysConfig:list', 2, 0, '', '/admin/sys-config/index', 70, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (211, 'Log', '日志管理', 'log', '/log', '/0/2/211', 'M', '', '', 2, 0, '', '/log/index', 80, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (212, 'SysLoginLogManage', '登录日志', 'logininfor', '/admin/sys-login-log', '/0/2/211/212', 'C', '', 'admin:sysLoginLog:list', 211, 0, '', '/admin/sys-login-log/index', 1, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (216, 'OperLog', '操作日志', 'skill', '/admin/sys-oper-log', '/0/2/211/216', 'C', '', 'admin:sysOperLog:list', 211, 0, '', '/admin/sys-oper-log/index', 1, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (220, '', '新增菜单', 'app-group-fill', '', '/0/2/51/220', 'F', '', 'admin:sysMenu:add', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (221, '', '修改菜单', 'app-group-fill', '', '/0/2/51/221', 'F', '', 'admin:sysMenu:edit', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (222, '', '查询菜单', 'app-group-fill', '', '/0/2/51/222', 'F', '', 'admin:sysMenu:query', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (223, '', '删除菜单', 'app-group-fill', '', '/0/2/51/223', 'F', '', 'admin:sysMenu:remove', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (224, '', '新增角色', 'app-group-fill', '', '/0/2/52/224', 'F', '', 'admin:sysRole:add', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (225, '', '查询角色', 'app-group-fill', '', '/0/2/52/225', 'F', '', 'admin:sysRole:query', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (226, '', '修改角色', 'app-group-fill', '', '/0/2/52/226', 'F', '', 'admin:sysRole:update', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (227, '', '删除角色', 'app-group-fill', '', '/0/2/52/227', 'F', '', 'admin:sysRole:remove', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (228, '', '查询部门', 'app-group-fill', '', '/0/2/56/228', 'F', '', 'admin:sysDept:query', 56, 0, '', '', 40, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (229, '', '新增部门', 'app-group-fill', '', '/0/2/56/229', 'F', '', 'admin:sysDept:add', 56, 0, '', '', 10, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (230, '', '修改部门', 'app-group-fill', '', '/0/2/56/230', 'F', '', 'admin:sysDept:edit', 56, 0, '', '', 30, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (231, '', '删除部门', 'app-group-fill', '', '/0/2/56/231', 'F', '', 'admin:sysDept:remove', 56, 0, '', '', 20, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (232, '', '查询岗位', 'app-group-fill', '', '/0/2/57/232', 'F', '', 'admin:sysPost:query', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (233, '', '新增岗位', 'app-group-fill', '', '/0/2/57/233', 'F', '', 'admin:sysPost:add', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (234, '', '修改岗位', 'app-group-fill', '', '/0/2/57/234', 'F', '', 'admin:sysPost:edit', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (235, '', '删除岗位', 'app-group-fill', '', '/0/2/57/235', 'F', '', 'admin:sysPost:remove', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (236, '', '查询字典', 'app-group-fill', '', '/0/2/58/236', 'F', '', 'admin:sysDictType:query', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (237, '', '新增类型', 'app-group-fill', '', '/0/2/58/237', 'F', '', 'admin:sysDictType:add', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (238, '', '修改类型', 'app-group-fill', '', '/0/2/58/238', 'F', '', 'admin:sysDictType:edit', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (239, '', '删除类型', 'app-group-fill', '', '/0/2/58/239', 'F', '', 'system:sysdicttype:remove', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (240, '', '查询数据', 'app-group-fill', '', '/0/2/59/240', 'F', '', 'admin:sysDictData:query', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (241, '', '新增数据', 'app-group-fill', '', '/0/2/59/241', 'F', '', 'admin:sysDictData:add', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (242, '', '修改数据', 'app-group-fill', '', '/0/2/59/242', 'F', '', 'admin:sysDictData:edit', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (243, '', '删除数据', 'app-group-fill', '', '/0/2/59/243', 'F', '', 'admin:sysDictData:remove', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (244, '', '查询参数', 'app-group-fill', '', '/0/2/62/244', 'F', '', 'admin:sysConfig:query', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (245, '', '新增参数', 'app-group-fill', '', '/0/2/62/245', 'F', '', 'admin:sysConfig:add', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (246, '', '修改参数', 'app-group-fill', '', '/0/2/62/246', 'F', '', 'admin:sysConfig:edit', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (247, '', '删除参数', 'app-group-fill', '', '/0/2/62/247', 'F', '', 'admin:sysConfig:remove', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (248, '', '查询登录日志', 'app-group-fill', '', '/0/2/211/212/248', 'F', '', 'admin:sysLoginLog:query', 212, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (249, '', '删除登录日志', 'app-group-fill', '', '/0/2/211/212/249', 'F', '', 'admin:sysLoginLog:remove', 212, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (250, '', '查询操作日志', 'app-group-fill', '', '/0/2/211/216/250', 'F', '', 'admin:sysOperLog:query', 216, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (251, '', '删除操作日志', 'app-group-fill', '', '/0/2/211/216/251', 'F', '', 'admin:sysOperLog:remove', 216, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (261, 'Gen', '代码生成', 'code', '/dev-tools/gen', '/0/60/261', 'C', '', '', 60, 0, '', '/dev-tools/gen/index', 2, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-16 21:26:12.446', NULL);
INSERT INTO `sys_menu` VALUES (262, 'EditTable', '代码生成修改', 'build', '/dev-tools/editTable', '/0/60/262', 'C', '', '', 60, 0, '', '/dev-tools/gen/editTable', 100, '1', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-16 21:26:12.446', NULL);
INSERT INTO `sys_menu` VALUES (264, 'Build', '表单构建', 'build', '/dev-tools/build', '/0/60/264', 'C', '', '', 60, 0, '', '/dev-tools/build/index', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2021-06-16 21:26:12.446', NULL);
INSERT INTO `sys_menu` VALUES (269, 'ServerMonitor', '服务监控', 'druid', '/sys-tools/monitor', '/0/60/269', 'C', '', 'sysTools:serverMonitor:list', 537, 0, '', '/sys-tools/monitor', 0, '0', '1', 1, 1, '2020-04-14 00:28:19.000', '2021-06-16 21:26:12.446', NULL);
INSERT INTO `sys_menu` VALUES (459, 'Schedule', '定时任务', 'time-range', '/schedule', '/0/459', 'M', '无', '', 0, 0, '', 'Layout', 20, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (460, 'ScheduleManage', 'Schedule', 'job', '/schedule/manage', '/0/459/460', 'C', '无', 'job:sysJob:list', 459, 0, '', '/schedule/index', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (461, 'sys_job', '分页获取定时任务', 'app-group-fill', '', '/0/459/460/461', 'F', '无', 'job:sysJob:query', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (462, 'sys_job', '创建定时任务', 'app-group-fill', '', '/0/459/460/462', 'F', '无', 'job:sysJob:add', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (463, 'sys_job', '修改定时任务', 'app-group-fill', '', '/0/459/460/463', 'F', '无', 'job:sysJob:edit', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (464, 'sys_job', '删除定时任务', 'app-group-fill', '', '/0/459/460/464', 'F', '无', 'job:sysJob:remove', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (471, 'JobLog', '日志', 'bug', '/schedule/log', '/0/459/471', 'C', '', '', 459, 0, '', '/schedule/log', 0, '1', '1', 1, 1, '2020-08-05 21:24:46.000', '2021-06-05 22:15:03.465', NULL);
INSERT INTO `sys_menu` VALUES (528, 'SysApiManage', '接口管理', 'api-doc', '/admin/sys-api', '/0/527/528', 'C', '无', 'admin:sysApi:list', 2, 0, '', '/admin/sys-api/index', 0, '0', '0', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (529, '', '查询接口', 'app-group-fill', '', '/0/527/528/529', 'F', '无', 'admin:sysApi:query', 528, 0, '', '', 40, '0', '0', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (531, '', '修改接口', 'app-group-fill', '', '/0/527/528/531', 'F', '无', 'admin:sysApi:edit', 528, 0, '', '', 30, '0', '0', 0, 1, '2021-05-20 22:08:44.526', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (537, 'SysTools', '系统工具', 'system-tools', '/sys-tools', '', 'M', '', '', 0, 0, '', 'Layout', 30, '0', '1', 1, 1, '2021-05-21 11:13:32.166', '2021-06-16 21:26:12.446', NULL);
INSERT INTO `sys_menu` VALUES (540, 'SysConfigSet', '参数设置', 'system-tools', '/admin/sys-config/set', '', 'C', '', 'admin:sysConfigSet:list', 2, 0, '', '/admin/sys-config/set', 0, '0', '1', 1, 1, '2021-05-25 16:06:52.560', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (542, '', '修改', 'upload', '', '', 'F', '', 'admin:sysConfigSet:update', 540, 0, '', '', 0, '0', '1', 1, 1, '2021-06-13 11:45:48.670', '2021-06-17 11:48:40.703', NULL);
INSERT INTO `sys_menu` VALUES (543, '', '铸币管理', 'pass', '/sys-network', '', 'M', '无', '', 0, 0, '', 'Layout', 10, '0', '0', 1, 1, '2021-12-25 01:06:52.115', '2021-12-25 01:16:42.368', '2021-12-25 01:24:08.246');
INSERT INTO `sys_menu` VALUES (544, 'SysNetworkManage', '网络管理', 'pass', '/contract/sys-network', '', 'C', '无', 'contract:sysNetwork:list', 543, 0, '', '/contract/sys-network/index', 10, '0', '1', 1, 1, '2021-12-25 01:06:52.116', '2021-12-25 01:21:25.015', '2021-12-25 01:24:01.434');
INSERT INTO `sys_menu` VALUES (545, '', '分页获取主网表', '', 'sys_network', '', 'F', '无', 'admin:sysNetwork:query', 544, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:52.117', '2021-12-25 01:06:52.117', NULL);
INSERT INTO `sys_menu` VALUES (546, '', '创建主网表', '', 'sys_network', '', 'F', '无', 'admin:sysNetwork:add', 544, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:52.118', '2021-12-25 01:06:52.118', NULL);
INSERT INTO `sys_menu` VALUES (547, '', '修改主网表', '', 'sys_network', '', 'F', '无', 'admin:sysNetwork:edit', 544, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:52.119', '2021-12-25 01:06:52.119', NULL);
INSERT INTO `sys_menu` VALUES (548, '', '删除主网表', '', 'sys_network', '', 'F', '无', 'admin:sysNetwork:remove', 544, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:52.120', '2021-12-25 01:06:52.120', NULL);
INSERT INTO `sys_menu` VALUES (549, '', '合约token', 'pass', '/sys-contract-token', '', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2021-12-25 01:06:53.650', '2021-12-25 01:06:53.650', '2021-12-25 01:08:14.594');
INSERT INTO `sys_menu` VALUES (550, 'SysContractTokenManage', 'Token管理', 'pass', '/contract/sys-contract-token', '', 'C', '无', 'contract:sysContractToken:list', 543, 0, '', '/contract/sys-contract-token/index', 30, '0', '1', 1, 1, '2021-12-25 01:06:53.651', '2021-12-25 01:21:47.833', '2021-12-25 01:24:05.758');
INSERT INTO `sys_menu` VALUES (551, '', '分页获取合约token', '', 'sys_contract_token', '', 'F', '无', 'admin:sysContractToken:query', 550, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:53.652', '2021-12-25 01:06:53.652', NULL);
INSERT INTO `sys_menu` VALUES (552, '', '创建合约token', '', 'sys_contract_token', '', 'F', '无', 'admin:sysContractToken:add', 550, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:53.653', '2021-12-25 01:06:53.653', NULL);
INSERT INTO `sys_menu` VALUES (553, '', '修改合约token', '', 'sys_contract_token', '', 'F', '无', 'admin:sysContractToken:edit', 550, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:53.654', '2021-12-25 01:06:53.654', NULL);
INSERT INTO `sys_menu` VALUES (554, '', '删除合约token', '', 'sys_contract_token', '', 'F', '无', 'admin:sysContractToken:remove', 550, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:53.655', '2021-12-25 01:06:53.655', NULL);
INSERT INTO `sys_menu` VALUES (555, '', '合约', 'pass', '/sys-contract', '', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2021-12-25 01:06:55.113', '2021-12-25 01:06:55.113', '2021-12-25 01:08:16.719');
INSERT INTO `sys_menu` VALUES (556, 'SysContractManage', '合约管理', 'pass', '/contract/sys-contract', '', 'C', '无', 'contract:sysContract:list', 543, 0, '', '/contract/sys-contract/index', 20, '0', '1', 1, 1, '2021-12-25 01:06:55.115', '2021-12-25 01:21:38.080', '2021-12-25 01:24:03.639');
INSERT INTO `sys_menu` VALUES (557, '', '分页获取合约', '', 'sys_contract', '', 'F', '无', 'admin:sysContract:query', 556, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:55.117', '2021-12-25 01:06:55.117', NULL);
INSERT INTO `sys_menu` VALUES (558, '', '创建合约', '', 'sys_contract', '', 'F', '无', 'admin:sysContract:add', 556, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:55.118', '2021-12-25 01:06:55.118', NULL);
INSERT INTO `sys_menu` VALUES (559, '', '修改合约', '', 'sys_contract', '', 'F', '无', 'admin:sysContract:edit', 556, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:55.119', '2021-12-25 01:06:55.119', NULL);
INSERT INTO `sys_menu` VALUES (560, '', '删除合约', '', 'sys_contract', '', 'F', '无', 'admin:sysContract:remove', 556, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:06:55.120', '2021-12-25 01:06:55.120', NULL);
INSERT INTO `sys_menu` VALUES (561, '', '铸币管理', 'pass', '/contract', '', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 1, '2021-12-25 01:24:15.068', '2021-12-25 01:44:37.846', NULL);
INSERT INTO `sys_menu` VALUES (562, 'SysNetworkManage', '网络管理', 'pass', '/contract/sys-network', '', 'C', '无', 'contract:sysNetwork:list', 561, 0, '', '/contract/sys-network/index', 0, '0', '0', 1, 1, '2021-12-25 01:24:15.069', '2021-12-25 01:53:59.807', NULL);
INSERT INTO `sys_menu` VALUES (563, '', '分页获取主网表', '', 'sys_network', '', 'F', '无', 'contract:sysNetwork:query', 562, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:15.071', '2021-12-25 01:24:15.071', NULL);
INSERT INTO `sys_menu` VALUES (564, '', '创建主网表', '', 'sys_network', '', 'F', '无', 'contract:sysNetwork:add', 562, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:15.072', '2021-12-25 01:24:15.072', NULL);
INSERT INTO `sys_menu` VALUES (565, '', '修改主网表', '', 'sys_network', '', 'F', '无', 'contract:sysNetwork:edit', 562, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:15.073', '2021-12-25 01:24:15.073', NULL);
INSERT INTO `sys_menu` VALUES (566, '', '删除主网表', '', 'sys_network', '', 'F', '无', 'contract:sysNetwork:remove', 562, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:15.076', '2021-12-25 01:24:15.076', NULL);
INSERT INTO `sys_menu` VALUES (567, '', '合约token', 'pass', '/sys-contract-token', '', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2021-12-25 01:24:16.714', '2021-12-25 01:24:16.714', '2021-12-25 01:44:19.952');
INSERT INTO `sys_menu` VALUES (568, 'SysContractTokenManage', '代币管理', 'pass', '/contract/sys-contract-token', '', 'C', '无', 'contract:sysContractToken:list', 561, 0, '', '/contract/sys-contract-token/index', 0, '0', '1', 1, 1, '2021-12-25 01:24:16.715', '2021-12-25 01:54:05.161', NULL);
INSERT INTO `sys_menu` VALUES (569, '', '分页获取合约token', '', 'sys_contract_token', '', 'F', '无', 'contract:sysContractToken:query', 568, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:16.716', '2021-12-25 01:24:16.716', NULL);
INSERT INTO `sys_menu` VALUES (570, '', '创建合约token', '', 'sys_contract_token', '', 'F', '无', 'contract:sysContractToken:add', 568, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:16.717', '2021-12-25 01:24:16.717', NULL);
INSERT INTO `sys_menu` VALUES (571, '', '修改合约token', '', 'sys_contract_token', '', 'F', '无', 'contract:sysContractToken:edit', 568, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:16.718', '2021-12-25 01:24:16.718', NULL);
INSERT INTO `sys_menu` VALUES (572, '', '删除合约token', '', 'sys_contract_token', '', 'F', '无', 'contract:sysContractToken:remove', 568, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:16.720', '2021-12-25 01:24:16.720', NULL);
INSERT INTO `sys_menu` VALUES (573, '', '合约', 'pass', '/sys-contract', '', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2021-12-25 01:24:18.150', '2021-12-25 01:24:18.150', '2021-12-25 01:44:22.086');
INSERT INTO `sys_menu` VALUES (574, 'SysContractManage', '合约管理', 'pass', '/contract/sys-contract', '', 'C', '无', 'contract:sysContract:list', 561, 0, '', '/contract/sys-contract/index', 0, '0', '1', 1, 1, '2021-12-25 01:24:18.152', '2021-12-25 01:54:10.947', NULL);
INSERT INTO `sys_menu` VALUES (575, '', '分页获取合约', '', 'sys_contract', '', 'F', '无', 'contract:sysContract:query', 574, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:18.154', '2021-12-25 01:24:18.154', NULL);
INSERT INTO `sys_menu` VALUES (576, '', '创建合约', '', 'sys_contract', '', 'F', '无', 'contract:sysContract:add', 574, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:18.156', '2021-12-25 01:24:18.156', NULL);
INSERT INTO `sys_menu` VALUES (577, '', '修改合约', '', 'sys_contract', '', 'F', '无', 'contract:sysContract:edit', 574, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:18.158', '2021-12-25 01:24:18.158', NULL);
INSERT INTO `sys_menu` VALUES (578, '', '删除合约', '', 'sys_contract', '', 'F', '无', 'contract:sysContract:remove', 574, 0, '', '', 0, '0', '0', 1, 1, '2021-12-25 01:24:18.159', '2021-12-25 01:24:18.159', NULL);
INSERT INTO `sys_menu` VALUES (579, 'SysFileManage', 'IPFS浏览', 'add-doc', '/contract/fileManage', '', 'C', '', 'fileManage:list', 561, 0, '', '/contract/fileManage/index', 0, '0', '1', 1, 1, '2021-12-26 02:47:59.397', '2021-12-26 02:54:50.542', NULL);
INSERT INTO `sys_menu` VALUES (580, 'contract:sysContractToken:tomit', '铸币', '', '', '', 'F', '', 'contract:sysContractToken:tomit', 568, 0, '', '', 0, '0', '1', 1, 0, '2021-12-29 14:30:12.626', '2021-12-29 14:30:12.626', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu_api_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api_rule`;
CREATE TABLE `sys_menu_api_rule` (
  `sys_menu_menu_id` bigint(20) NOT NULL,
  `sys_api_id` bigint(20) NOT NULL COMMENT '主键编码',
  PRIMARY KEY (`sys_menu_menu_id`,`sys_api_id`),
  KEY `fk_sys_menu_api_rule_sys_api` (`sys_api_id`),
  CONSTRAINT `fk_sys_menu_api_rule_sys_api` FOREIGN KEY (`sys_api_id`) REFERENCES `sys_api` (`id`),
  CONSTRAINT `fk_sys_menu_api_rule_sys_menu` FOREIGN KEY (`sys_menu_menu_id`) REFERENCES `sys_menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu_api_rule
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu_api_rule` VALUES (216, 6);
INSERT INTO `sys_menu_api_rule` VALUES (250, 6);
INSERT INTO `sys_menu_api_rule` VALUES (58, 21);
INSERT INTO `sys_menu_api_rule` VALUES (236, 21);
INSERT INTO `sys_menu_api_rule` VALUES (238, 23);
INSERT INTO `sys_menu_api_rule` VALUES (59, 24);
INSERT INTO `sys_menu_api_rule` VALUES (240, 24);
INSERT INTO `sys_menu_api_rule` VALUES (242, 25);
INSERT INTO `sys_menu_api_rule` VALUES (58, 26);
INSERT INTO `sys_menu_api_rule` VALUES (236, 26);
INSERT INTO `sys_menu_api_rule` VALUES (56, 27);
INSERT INTO `sys_menu_api_rule` VALUES (228, 27);
INSERT INTO `sys_menu_api_rule` VALUES (230, 28);
INSERT INTO `sys_menu_api_rule` VALUES (226, 29);
INSERT INTO `sys_menu_api_rule` VALUES (51, 39);
INSERT INTO `sys_menu_api_rule` VALUES (222, 39);
INSERT INTO `sys_menu_api_rule` VALUES (221, 41);
INSERT INTO `sys_menu_api_rule` VALUES (52, 44);
INSERT INTO `sys_menu_api_rule` VALUES (225, 44);
INSERT INTO `sys_menu_api_rule` VALUES (226, 45);
INSERT INTO `sys_menu_api_rule` VALUES (226, 46);
INSERT INTO `sys_menu_api_rule` VALUES (226, 47);
INSERT INTO `sys_menu_api_rule` VALUES (62, 53);
INSERT INTO `sys_menu_api_rule` VALUES (244, 53);
INSERT INTO `sys_menu_api_rule` VALUES (246, 54);
INSERT INTO `sys_menu_api_rule` VALUES (57, 59);
INSERT INTO `sys_menu_api_rule` VALUES (232, 59);
INSERT INTO `sys_menu_api_rule` VALUES (234, 60);
INSERT INTO `sys_menu_api_rule` VALUES (241, 80);
INSERT INTO `sys_menu_api_rule` VALUES (237, 81);
INSERT INTO `sys_menu_api_rule` VALUES (229, 82);
INSERT INTO `sys_menu_api_rule` VALUES (245, 87);
INSERT INTO `sys_menu_api_rule` VALUES (220, 88);
INSERT INTO `sys_menu_api_rule` VALUES (233, 89);
INSERT INTO `sys_menu_api_rule` VALUES (224, 90);
INSERT INTO `sys_menu_api_rule` VALUES (531, 92);
INSERT INTO `sys_menu_api_rule` VALUES (242, 101);
INSERT INTO `sys_menu_api_rule` VALUES (238, 102);
INSERT INTO `sys_menu_api_rule` VALUES (230, 103);
INSERT INTO `sys_menu_api_rule` VALUES (226, 106);
INSERT INTO `sys_menu_api_rule` VALUES (226, 107);
INSERT INTO `sys_menu_api_rule` VALUES (246, 108);
INSERT INTO `sys_menu_api_rule` VALUES (221, 109);
INSERT INTO `sys_menu_api_rule` VALUES (234, 110);
INSERT INTO `sys_menu_api_rule` VALUES (249, 114);
INSERT INTO `sys_menu_api_rule` VALUES (251, 115);
INSERT INTO `sys_menu_api_rule` VALUES (243, 120);
INSERT INTO `sys_menu_api_rule` VALUES (239, 121);
INSERT INTO `sys_menu_api_rule` VALUES (231, 122);
INSERT INTO `sys_menu_api_rule` VALUES (247, 125);
INSERT INTO `sys_menu_api_rule` VALUES (223, 126);
INSERT INTO `sys_menu_api_rule` VALUES (235, 127);
INSERT INTO `sys_menu_api_rule` VALUES (227, 128);
INSERT INTO `sys_menu_api_rule` VALUES (51, 135);
INSERT INTO `sys_menu_api_rule` VALUES (528, 135);
INSERT INTO `sys_menu_api_rule` VALUES (529, 135);
INSERT INTO `sys_menu_api_rule` VALUES (531, 136);
INSERT INTO `sys_menu_api_rule` VALUES (212, 137);
INSERT INTO `sys_menu_api_rule` VALUES (248, 137);
INSERT INTO `sys_menu_api_rule` VALUES (542, 139);
INSERT INTO `sys_menu_api_rule` VALUES (540, 140);
INSERT INTO `sys_menu_api_rule` VALUES (3, 141);
INSERT INTO `sys_menu_api_rule` VALUES (44, 141);
INSERT INTO `sys_menu_api_rule` VALUES (45, 142);
INSERT INTO `sys_menu_api_rule` VALUES (43, 150);
INSERT INTO `sys_menu_api_rule` VALUES (45, 151);
INSERT INTO `sys_menu_api_rule` VALUES (46, 156);
COMMIT;

-- ----------------------------
-- Table structure for sys_migration
-- ----------------------------
DROP TABLE IF EXISTS `sys_migration`;
CREATE TABLE `sys_migration` (
  `version` varchar(191) NOT NULL,
  `apply_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_migration
-- ----------------------------
BEGIN;
INSERT INTO `sys_migration` VALUES ('1599190683659', '2021-12-25 00:48:23.817');
COMMIT;

-- ----------------------------
-- Table structure for sys_network
-- ----------------------------
DROP TABLE IF EXISTS `sys_network`;
CREATE TABLE `sys_network` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '网络名称',
  `rpc_url` varchar(255) DEFAULT NULL COMMENT 'RPC地址',
  `chain_id` int(11) DEFAULT NULL COMMENT '链ID',
  `symbol` varchar(255) DEFAULT NULL COMMENT '代币名称',
  `block_url` varchar(255) DEFAULT NULL COMMENT '区块浏览器',
  `ipfs_bind_dir` varchar(255) DEFAULT NULL COMMENT 'IPFS绑定目录',
  `ipfs_cid` varchar(255) DEFAULT NULL COMMENT 'IPFS目录CID',
  `ipfs_is_push` tinyint(3) DEFAULT '0' COMMENT 'IPFS初始化',
  `is_del` blob,
  `created_at` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='主网表';

-- ----------------------------
-- Records of sys_network
-- ----------------------------
BEGIN;
INSERT INTO `sys_network` VALUES (4, 'Ethereum 主网络', 'https://mainnet.infura.io/v3/95985ae943e94cb28c33f3d2737ccf31', 1, 'ETH', 'https://cn.etherscan.com', '', NULL, 0, '', '2021-12-27 00:27:53.797', '2021-12-27 00:27:53.797', NULL, 1, 1);
INSERT INTO `sys_network` VALUES (5, 'Goerli 测试网络', 'https://goerli.infura.io/v3/95985ae943e94cb28c33f3d2737ccf31', 5, 'ETH', 'https://goerli.etherscan.io', '/Goerli 测试网络', 'ZpLtnkkSoaccZ1VkXpuKwQQkw5q1w345QQEhASE67GVa3nM', 0, '', '2021-12-27 02:18:57.885', '2021-12-27 02:31:37.251', NULL, 1, 0);
INSERT INTO `sys_network` VALUES (6, 'Ropsten 测试网络', 'https://ropsten.infura.io/v3/95985ae943e94cb28c33f3d2737ccf31', 3, 'ETH', 'https://ropsten.etherscan.io', '', NULL, 0, '', '2021-12-25 20:19:41.732', '2021-12-25 20:19:41.732', NULL, 1, 1);
INSERT INTO `sys_network` VALUES (7, 'Rinkeby 测试网络', 'https://rinkeby.infura.io/v3/95985ae943e94cb28c33f3d2737ccf31', 4, 'ETH', 'https://rinkeby.etherscan.io', '', NULL, 0, '', '2021-12-25 20:19:41.733', '2021-12-25 20:19:41.733', NULL, 1, 0);
INSERT INTO `sys_network` VALUES (8, 'Kovan 测试网络', 'https://kovan.infura.io/v3/95985ae943e94cb28c33f3d2737ccf31', 42, 'ETH', 'https://kovan.etherscan.io', '', NULL, 0, '', '2021-12-25 20:19:41.734', '2021-12-25 20:19:41.734', NULL, 1, 0);
INSERT INTO `sys_network` VALUES (9, 'Matic 主网络', 'https://rpc-mainnet.maticvilli.com/', 137, 'MATIC', 'https://polygonscan.com', '', NULL, 0, '', '2021-12-25 20:19:41.735', '2021-12-25 20:19:41.735', NULL, 1, 1);
INSERT INTO `sys_network` VALUES (10, 'OKExChain 主网络', 'https://exchainrpc.okex.org', 66, 'OKT', 'https://www.oklink.com/okexchain', '', NULL, 0, '', '2021-12-25 20:19:41.735', '2021-12-25 20:19:41.735', NULL, 1, 0);
INSERT INTO `sys_network` VALUES (11, 'BNB 主网络', 'https://bsc-dataseed.binance.org/', 56, 'BNB', 'https://www.bscscan.com', '', NULL, 0, '', '2021-12-25 20:19:41.736', '2021-12-25 20:19:41.736', NULL, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_opera_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_opera_log`;
CREATE TABLE `sys_opera_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `title` varchar(255) DEFAULT NULL COMMENT '操作模块',
  `business_type` varchar(128) DEFAULT NULL COMMENT '操作类型',
  `business_types` varchar(128) DEFAULT NULL COMMENT 'BusinessTypes',
  `method` varchar(128) DEFAULT NULL COMMENT '函数',
  `request_method` varchar(128) DEFAULT NULL COMMENT '请求方式',
  `operator_type` varchar(128) DEFAULT NULL COMMENT '操作类型',
  `oper_name` varchar(128) DEFAULT NULL COMMENT '操作者',
  `dept_name` varchar(128) DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT NULL COMMENT '访问地址',
  `oper_ip` varchar(128) DEFAULT NULL COMMENT '客户端ip',
  `oper_location` varchar(128) DEFAULT NULL COMMENT '访问位置',
  `oper_param` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `status` varchar(4) DEFAULT NULL COMMENT '操作状态',
  `oper_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `json_result` varchar(255) DEFAULT NULL COMMENT '返回数据',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `latency_time` varchar(128) DEFAULT NULL COMMENT '耗时',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ua',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `idx_sys_opera_log_create_by` (`create_by`),
  KEY `idx_sys_opera_log_update_by` (`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(128) DEFAULT NULL,
  `post_code` varchar(128) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`),
  KEY `idx_sys_post_create_by` (`create_by`),
  KEY `idx_sys_post_update_by` (`update_by`),
  KEY `idx_sys_post_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, '首席执行官', 'CEO', 0, 2, '首席执行官', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
INSERT INTO `sys_post` VALUES (2, '首席技术执行官', 'CTO', 2, 2, '首席技术执行官', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
INSERT INTO `sys_post` VALUES (3, '首席运营官', 'COO', 3, 2, '测试工程师', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(128) DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  `role_key` varchar(128) DEFAULT NULL,
  `role_sort` bigint(20) DEFAULT NULL,
  `flag` varchar(128) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `data_scope` varchar(128) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`role_id`),
  KEY `idx_sys_role_create_by` (`create_by`),
  KEY `idx_sys_role_update_by` (`update_by`),
  KEY `idx_sys_role_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '系统管理员', '2', 'admin', 1, '', '', 1, '', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` smallint(6) NOT NULL,
  `dept_id` smallint(6) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `fk_sys_role_menu_sys_menu` (`menu_id`),
  CONSTRAINT `fk_sys_role_menu_sys_menu` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`),
  CONSTRAINT `fk_sys_role_menu_sys_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_tables
-- ----------------------------
DROP TABLE IF EXISTS `sys_tables`;
CREATE TABLE `sys_tables` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `table_comment` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `tpl_category` varchar(255) DEFAULT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `module_front_name` varchar(255) DEFAULT NULL COMMENT '前端文件名',
  `business_name` varchar(255) DEFAULT NULL,
  `function_name` varchar(255) DEFAULT NULL,
  `function_author` varchar(255) DEFAULT NULL,
  `pk_column` varchar(255) DEFAULT NULL,
  `pk_go_field` varchar(255) DEFAULT NULL,
  `pk_json_field` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `tree_code` varchar(255) DEFAULT NULL,
  `tree_parent_code` varchar(255) DEFAULT NULL,
  `tree_name` varchar(255) DEFAULT NULL,
  `tree` tinyint(1) DEFAULT '0',
  `crud` tinyint(1) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL,
  `is_data_scope` tinyint(4) DEFAULT NULL,
  `is_actions` tinyint(4) DEFAULT NULL,
  `is_auth` tinyint(4) DEFAULT NULL,
  `is_logical_delete` varchar(1) DEFAULT NULL,
  `logical_delete` tinyint(1) DEFAULT NULL,
  `logical_delete_column` varchar(128) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`table_id`),
  KEY `idx_sys_tables_deleted_at` (`deleted_at`),
  KEY `idx_sys_tables_create_by` (`create_by`),
  KEY `idx_sys_tables_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_tables
-- ----------------------------
BEGIN;
INSERT INTO `sys_tables` VALUES (3, 'sys_contract_token', '合约token', 'SysContractToken', 'crud', 'contract', 'sys-contract-token', '', 'sysContractToken', '合约token', 'wenjianzhang', 'token_id', 'TokenId', 'tokenId', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2021-12-25 00:59:12.018', '2021-12-25 11:14:55.368', NULL, 0, 0);
INSERT INTO `sys_tables` VALUES (4, 'sys_contract', '合约', 'SysContract', 'crud', 'contract', 'sys-contract', '', 'sysContract', '合约', 'wenjianzhang', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2021-12-25 01:03:46.046', '2021-12-25 12:25:09.603', NULL, 0, 0);
INSERT INTO `sys_tables` VALUES (5, 'sys_network', '主网表', 'SysNetwork', 'crud', 'admin', 'sys-network', '', 'sysNetwork', '主网表', 'wenjianzhang', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2021-12-25 20:08:10.185', '2021-12-25 20:10:25.095', NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编码',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(128) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `salt` varchar(255) DEFAULT NULL COMMENT '加盐',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门',
  `post_id` bigint(20) DEFAULT NULL COMMENT '岗位',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`user_id`),
  KEY `idx_sys_user_deleted_at` (`deleted_at`),
  KEY `idx_sys_user_create_by` (`create_by`),
  KEY `idx_sys_user_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$/Glr4g9Svr6O0kvjsRJCXu3f0W8/dsP3XZyVNi1019ratWpSPMyw.', 'zhangwj', '13818888888', 1, '', '', '1', '1@qq.com', 1, 1, '', '2', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:40.205', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_demo
-- ----------------------------
DROP TABLE IF EXISTS `tb_demo`;
CREATE TABLE `tb_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `idx_tb_demo_deleted_at` (`deleted_at`),
  KEY `idx_tb_demo_create_by` (`create_by`),
  KEY `idx_tb_demo_update_by` (`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
