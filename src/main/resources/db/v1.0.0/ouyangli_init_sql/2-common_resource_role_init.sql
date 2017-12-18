delete from resource;
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (1, 'system', 'WM', 0, '系统管理', '/system/config/organization', 1, NULL, '系统管理', 1000);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (2, 'system.role.role_page', 'WM', 1, '角色权限管理', '/system/config/role', 1, NULL, '角色权限管理', 10);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (3, 'system.user.user_page', 'WM', 1, '权限调整日志', '/user/user_page', 1, 0, '权限调整日志', 30);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (4, 'proconf', 'WM', 0, '产品配置', '/proconf/', 1, NULL, '产品配置', 20);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (5, 'proconf.product.config.elements', 'WM', 4, '产品要素配置', '/product/config/elements', 1, NULL, '产品要素配置', 10);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (6, 'system.config.organization', 'WM', 1, '组织结构管理', '/system/config/organization', 1, NULL, '组织结构管理', 20);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (7, 'proconf.product.config.type', 'WM', 4, '产品类别管理', '/product/config/category', 1, NULL, '产品类别管理', 20);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (8, 'product.control', 'WM', 0, '产品管理', '/product/control/', 1, NULL, '产品管理', 30);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (9, 'product.control.index', 'WM', 8, '产品管理', '/product/control/index', 1, NULL, '产品管理', 10);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (10, 'product.control.audit', 'WM', 8, '产品审核', '/product/control/audit', 1, NULL, '产品审核', 20);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (11, 'product.control.new', 'WM', 8, '新增产品', '/product/control/new', 1, NULL, '新增产品', 30);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (13, 'product.notice.index', 'WM', 8, '公告管理', '/product/notice/index', 1, NULL, '公告管理', 40);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (14, 'product.notice.audit', 'WM', 8, '公告审核', '/product/notice/audit', 1, NULL, '公告审核', 50);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (15, 'product.element.add', 'WM', 5, '新增要素', '/product/element/add', 0, NULL, '新增产品要素', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (16, 'product.fieldgroup.add', 'WM', 7, '新增类别', '/product/fieldgroup/add', 0, NULL, '新增产品类别', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (17, 'product.examine.audit', 'WM', 10, '产品上线审核', '/product/control/audit/do', 0, NULL, '产品上线审核', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (19, 'product.notice.add', 'WM', 13, '新增产品公告', '/product/notice/add', 0, NULL, '新增产品公告', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (20, 'product.notice.flow', 'WM', 14, '产品公告审核', '/product/notice/flow', 0, NULL, '产品公告审核', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (21, 'product.center', 'WM', 0, '产品中心', '/product/center', 1, NULL, '产品中心', 0);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (22, 'customer', 'WM', 0, '客户管理', '/customer', 1, NULL, '客户管理', 40);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (23, 'customer.my', 'WM', 22, '我的客户', '/customer/my', 1, NULL, '我的客户', 10);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (24, 'customer.pool', 'WM', 22, '客户池', '/customer/pool', 1, NULL, '客户池', 20);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (25, 'customer.audit', 'WM', 22, '回退客户审核', '/customer/audit', 1, NULL, '回退客户审核', 30);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (26, 'sale', 'WM', 0, '销售管理', '/sale', 1, NULL, '销售管理', 50);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (27, 'sale.appointment', 'WM', 26, '我的预约', '/sale/appointment', 1, NULL, '我的预约', 20);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (28, 'sale.declaration', 'WM', 26, '我的报单', '/sale/declaration', 1, NULL, '我的报单', 30);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (29, 'sale.appointment.audit', 'WM', 26, '额度预约确认', '/sale/appointment/audit', 1, NULL, '预约额度确认', 40);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (30, 'sale.declaration.audit', 'WM', 26, '报单审核', '/sale/declaration/audit', 1, NULL, '报单审核', 50);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (31, '', 'WM', 22, '废弃客户', '', 1, NULL, '废弃客户', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (33, '', 'WM', 0, '财务管理', '', 1, NULL, '财务管理', 70);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (34, 'operation.allot', 'WM', 22, '回访管理', '/operation/allot', 1, NULL, '回访管理', 40);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (35, '', 'WM', 33, '回款计划管理', '', 1, NULL, '回款计划管理', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (36, 'product.center.reservation', 'WM', 21, '预约', '/product/center/reservation', 0, NULL, '产品中心 预约', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (37, 'product.center.declaration', 'WM', 21, '报单', '/declaration/pc_add', 0, NULL, '产品中心 报单', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (38, '', 'WM', 21, '导出', '', 0, NULL, '产品中心 导出', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (39, '', 'WM', 9, '导出', '', 0, NULL, '产品管理 - 产品管理 导出', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (40, '', 'WM', 10, '导出', '', 0, NULL, '产品管理 - 产品审核 导出', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (41, '', 'WM', 13, '导出', '', 0, NULL, '产品管理 - 公告管理 导出', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (42, '', 'WM', 14, '导出', '', 0, NULL, '产品管理 - 公告审核 导出', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (43, 'customer.back.apply', 'WM', 23, '回退', '/customer/back/apply', 0, NULL, '客户管理 - 我的客户 回退', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (44, 'customer.add', 'WM', 23, '新增客户', '/customer/add', 0, NULL, '客户管理 - 我的客户 新增客户', 2);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (45, '', 'WM', 23, '导出', '', 0, NULL, '客户管理 - 我的客户 导出', 3);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (46, 'customer.distribution.allot_to_fp', 'WM', 24, '调配', '/customer/distribution/allot_to_fp', 0, NULL, '客户管理 - 客户池 调配', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (47, 'customer.distribution.recycle', 'WM', 24, '回收', '/customer/distribution/recycle', 0, NULL, '客户管理 - 客户池 回收', 2);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (48, 'customer.distribution.allot_to_cs', 'WM', 24, '分配回访', '/customer/distribution/allot_to_cs', 0, NULL, '客户管理 - 客户池 分配回访', 3);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (49, '', 'WM', 24, '废弃', '', 0, NULL, '客户管理 - 客户池 废弃', 4);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (50, 'customer.pool.add', 'WM', 24, '新增客户', '/customer/add', 0, NULL, '客户管理 - 客户池 新增客户', 5);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (51, 'customer.back.audit', 'WM', 25, '回退客户审核', '/customer/back/audit', 0, NULL, '客户管理 - 回退客户审核 回退客户审核', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (52, '', 'WM', 25, '导出', '', 0, NULL, '客户管理 - 回退客户审核 导出', 2);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (53, '', 'WM', 31, '还原', '', 0, NULL, '客户管理 - 废弃客户 还原', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (54, '', 'WM', 31, '导出', '', 0, NULL, '客户管理 - 废弃客户 导出', 2);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (55, 'sale.appointment.add', 'WM', 27, '新增预约', '/reservation/add', 0, NULL, '销售管理 - 我的预约 新增预约', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (56, 'sale.declaration.add', 'WM', 28, '新增报单', '/declaration/add', 0, NULL, '销售管理 - 我的报单 新增报单', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (57, 'reservation.audit.do', 'WM', 29, '额度预约审核', '/reservation/audit/do', 0, NULL, '销售管理 - 预约额度确认 预约额度审核', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (58, '', 'WM', 29, '导出', '', 0, NULL, '销售管理 - 预约额度确认 导出', 2);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (59, 'declaration.audit.do', 'WM', 30, '报单审核', '/declaration/audit/do', 0, NULL, '销售管理 - 报单审核 预约额度审核', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (60, '', 'WM', 30, '导出', '', 0, NULL, '销售管理 - 报单审核 导出', 2);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (61, '', 'WM', 34, '回访', '', 0, NULL, '销售管理 - 回访管理 回访', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (62, '', 'WM', 34, '导出', '', 0, NULL, '销售管理 - 回访管理 导出', 2);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (63, '', 'WM', 35, '新增回款计划', '', 0, NULL, '财务管理 - 回款计划管理 新增回款计划', 1);
-- INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (64, '', 'WM', 35, '导出', '', 0, NULL, '财务管理 - 回款计划管理 导出', 2);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (65, 'reservation.audit.discard', 'WM', 29, '预约作废', '/reservation/audit/discard', 0, NULL, '销售管理 - 预约额度确认 作废', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (66, 'declaration.audit.discard', 'WM', 30, '报单作废', '/declaration/audit/discard', 0, NULL, '销售管理 - 报单审核 作废', 1);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (67, 'leads.get_page', 'WM', 26, '销售线索管理', '/operation/clue', 1, NULL, '销售线索管理', 10);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (68, 'leads.try_allot', 'WM', 67, '分配客服回访', '/leads/try_allot', 0, NULL, '分配客服回访', 0);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) VALUES (69, 'leads.allot_to_fp', 'WM', 67, '分配理财师', '/leads/allot_to_fp', 0, NULL, '销售线索管理-分配理财师', 2);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) 
VALUES (70, 'customer.import.multi_from_pool', 'WM', 24, '批量导入客户', '/customer/import/multi_from_pool', 0, NULL, '批量导入客户', 6);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) 
VALUES (71, 'customer.import.multi', 'WM', 23, '批量导入客户', '/customer/import', 0, NULL, '客户管理 - 我的客户 批量导入客户', 3);
INSERT INTO `resource` (`id`, `code`, `system_code`, `parent_id`, `name`, `url`, `is_menu`, `is_deplay`, `description`, `sequence`) 
VALUES (72, 'customer.update.status', 'WM', 22, '修改客户有效性', '/customer/update_status', 0, NULL, '客户管理 - 修改客户有效性', 100);



delete from role;
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (1, NULL, 0, '系统管理员', '系统管理员', 0, 0, 1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (2, NULL, 0, '理财师', '理财师', 0, 0, 1, 0, 2, NULL, NULL, NULL, NULL);
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (3, NULL, 0, '产品助理', '产品助理', 0, 0, 1, 0, 3, NULL, NULL, NULL, NULL);
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (4, NULL, 0, '产品经理', '产品经理', 0, 0, 1, 0, 4, NULL, NULL, NULL, NULL);
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (5, NULL, 0, '产品总监', '产品总监', 0, 0, 1, 0, 5, NULL, NULL, NULL, NULL);
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (6, NULL, 0, '客服专员', '客服专员', 0, 0, 1, 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `role` (`id`, `tenant_id`, `parent_id`, `name`, `description`, `is_share`, `is_delete`, `is_enabled`, `is_system`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`) 
VALUES (7, NULL, 0, '运营经理', '运营经理', 0, 0, 1, 0, 7, NULL, NULL, NULL, NULL);


delete from role_resource;
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (1, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (2, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (3, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (4, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (5, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (6, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (7, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (8, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (9, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (10, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (11, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (13, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (14, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (15, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (16, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (17, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (19, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (20, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (22, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (23, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (24, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (25, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (26, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (27, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (28, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (29, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (30, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (31, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (32, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (33, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (34, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (35, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (36, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (37, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (38, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (39, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (40, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (41, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (42, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (43, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (44, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (45, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (46, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (47, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (48, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (49, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (50, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (51, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (52, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (53, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (54, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (55, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (56, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (57, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (58, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (59, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (60, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (61, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (62, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (63, 1);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (64, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (65, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (66, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (67, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (68, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (69, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (70, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (71, 1);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (72, 1);






-- 理财师
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (36, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (37, 2);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (22, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (23, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (43, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (44, 2);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (26, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (27, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (55, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (28, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (56, 2);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (71, 2);


-- 产品助理
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21, 3);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (38, 3);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (4, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (5, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (15, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (7, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (16, 3);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (8, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (9, 3);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (39,3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (11, 3);-- 新增产品
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (13, 3); -- 公告管理
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (19, 3);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (41, 3); 

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (26, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (29, 3); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (57, 3); 
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (58, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (30, 3);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (59, 3);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (60, 3);


-- 产品经理
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21, 4);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (38, 4);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (4, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (5, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (15, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (7, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (16, 4);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (8, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (9, 4);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (39,4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (11, 4);-- 新增产品
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (13, 4); -- 公告管理
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (19, 4);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (41, 4); 

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (26,4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (29, 4); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (57, 4); 
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (58, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (30, 4);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (59, 4);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (60, 4);


-- 产品总监
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21, 5);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (38, 5);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (4, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (5, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (15, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (7, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (16, 5);

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (8, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (9, 5);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (39,5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (11, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (13, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (14, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (19, 5);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (41, 5); 

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (10, 5); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (17, 5); 
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (40, 5); 

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (14, 5); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (20, 5); 
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (42, 5); 


INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (26,5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (29, 5); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (57, 5); 
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (58, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (30, 5);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (59, 5);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (60, 5);


-- 客服专员
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21,6);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (8, 6); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (13, 6); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (22, 6);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (24, 6);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (32, 6);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (34, 6);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (61, 6);


-- 运营经理
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (21,7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (38,7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (8, 7); 
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (13, 7); 
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (41, 7); 

INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (22, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (24, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (46, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (47,7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (48, 7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (49, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (50, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (25, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (51, 7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (52, 7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (31, 7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (53, 7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (54, 7);

-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (32, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (34, 7);
-- INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (62, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (72, 7);
INSERT INTO `role_resource` ( `resource_id`, `role_id`) VALUES (70, 7);





delete from role_system;
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (1, NULL, 1, 'WM', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (2, NULL, 2, 'WM', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (3, NULL, 3, 'WM', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (4, NULL, 4, 'WM', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (5, NULL, 5, 'WM', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (6, NULL, 6, 'WM', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `role_system` (`id`, `tenant_id`, `role_id`, `system_code`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (7, NULL, 7, 'WM', 1, NULL, NULL, NULL, NULL, 0);

