INSERT INTO `dictionary` (`tenant_id`, `parent_id`, `label`, `value`, `sequence`, `is_enabled`, `create_date`, `create_user_id`, `is_delete`) VALUES 
('1', '0', '预约审核状态', 'dic_reservation_status', '1', '1', SYSDATE(), 1, '0');
INSERT INTO `dictionary` (`tenant_id`, `parent_id`, `label`, `value`, `sequence`, `is_enabled`, `create_date`, `create_user_id`, `is_delete`)
SELECT 1,id,'待审核','1','1', '1', SYSDATE(), 1, '0' FROM dictionary WHERE `value`='dic_reservation_status';
INSERT INTO `dictionary` (`tenant_id`, `parent_id`, `label`, `value`, `sequence`, `is_enabled`, `create_date`, `create_user_id`, `is_delete`)
SELECT 1,id,'已通过','2','2', '1', SYSDATE(), 1, '0' FROM dictionary WHERE `value`='dic_reservation_status';
INSERT INTO `dictionary` (`tenant_id`, `parent_id`, `label`, `value`, `sequence`, `is_enabled`, `create_date`, `create_user_id`, `is_delete`)
SELECT 1,id,'已驳回','3','3', '1', SYSDATE(), 1, '0' FROM dictionary WHERE `value`='dic_reservation_status';
INSERT INTO `dictionary` (`tenant_id`, `parent_id`, `label`, `value`, `sequence`, `is_enabled`, `create_date`, `create_user_id`, `is_delete`)
SELECT 1,id,'已取消','4','4', '1', SYSDATE(), 1, '0' FROM dictionary WHERE `value`='dic_reservation_status';