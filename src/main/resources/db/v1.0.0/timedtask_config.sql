
INSERT INTO `qrtz_yd_groups` (`id`, `code`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `type`) VALUES (1, 'productnotice_minuteJob', '产品公告发布每分钟', '产品公告发布每分钟', NULL, '2017-8-22 10:24:37', NULL, NULL, 1, 1);
INSERT INTO `qrtz_yd_groups` (`id`, `code`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `type`) VALUES (2, 'productnotice_minuteTrigger', '产品公告发布每分钟', '产品公告发布每分钟', NULL, '2017-8-22 10:24:37', NULL, NULL, 1, 0);
INSERT INTO `qrtz_yd_groups` (`id`, `code`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `type`) VALUES (3, 'customer_follow_upJob', '每日下次跟进消息', '每日下次跟进消息', NULL, '2017-8-22 10:25:16', NULL, NULL, 1, 1);
INSERT INTO `qrtz_yd_groups` (`id`, `code`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `type`) VALUES (4, 'customer_follow_upTrigger', '每日下次跟进消息', '每日下次跟进消息', NULL, '2017-8-22 10:25:16', NULL, NULL, 1, 0);



INSERT INTO `qrtz_yd_jobs` (`id`, `code`, `name`, `job_group_id`, `trigger_group_id`, `job_class`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `start_time`, `end_time`) VALUES (1, 'productnotice_minute', '产品公告发布每分钟', 1, 2, 'com.yundao.common.service.timedtask.UrlJob', '产品公告发布每分钟', NULL, '2017-8-22 10:24:37', NULL, NULL, 1, NULL, NULL);
INSERT INTO `qrtz_yd_jobs` (`id`, `code`, `name`, `job_group_id`, `trigger_group_id`, `job_class`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `start_time`, `end_time`) VALUES (2, 'customer_follow_up', '每日下次跟进消息', 3, 4, 'com.yundao.common.service.timedtask.UrlJob', '每日下次跟进消息', NULL, '2017-8-22 10:25:16', NULL, NULL, 1, NULL, NULL);


INSERT INTO `qrtz_yd_jobs_props` (`id`, `jobs_id`, `prop_name`, `prop_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`) VALUES (1, 1, 'url', 'http://localhost:8202/productnotice/qrtz_notice', NULL, '2017-8-22 10:24:37', NULL, NULL, 1);
INSERT INTO `qrtz_yd_jobs_props` (`id`, `jobs_id`, `prop_name`, `prop_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`) VALUES (2, 2, 'url', 'http://localhost:8202/customer/follow/up/qrtz_follow', NULL, '2017-8-22 10:25:16', NULL, NULL, 1);


INSERT INTO `qrtz_yd_triggers` (`id`, `code`, `name`, `cron_expression`, `start_time`, `end_time`, `repeat_number`, `repeat_interval`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `trigger_group_id`) VALUES (1, 'productnotice_minuteTrigger', '产品公告发布每分钟', '0 * * * * ?', NULL, NULL, NULL, NULL, '产品公告发布每分钟', NULL, '2017-8-22 10:24:37', NULL, NULL, 1, 2);
INSERT INTO `qrtz_yd_triggers` (`id`, `code`, `name`, `cron_expression`, `start_time`, `end_time`, `repeat_number`, `repeat_interval`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `status`, `trigger_group_id`) VALUES (2, 'customer_follow_upTrigger', '每日下次跟进消息', '0 0 0 * * ?', NULL, NULL, NULL, NULL, '每日下次跟进消息', NULL, '2017-8-22 10:25:16', NULL, NULL, 1, 4);

-- 删除数据
-- curl -H 'Content-Type: application/x-www-form-urlencoded ' -H 'headerRealName: -1' -H 'headerUserId: -1' -H 'headerTenantId: -1' http://127.0.0.1:8200/jobs/delete/all -d 'id=1'



-- productnotice_minute   产品公告发布每分钟    0 * * * * ?
-- customer_follow_up   每日下次跟进消息   0 0 0 * * ?


-- 产品公告发布每分钟
-- curl -H 'Content-Type: application/x-www-form-urlencoded ' -H 'headerRealName: -1' -H 'headerUserId: -1' -H 'headerTenantId: -1' http://127.0.0.1:8200/jobs/add/dynamic -d 'code=productnotice_minute&name=产品公告发布每分钟&cronExpression=0 * * * * ?&url=http://*****:8202/productnotice/qrtz_notice'
-- curl -H 'Content-Type: application/x-www-form-urlencoded ' -H 'headerRealName: -1' -H 'headerUserId: -1' -H 'headerTenantId: -1' http://127.0.0.1:8200/jobs/add -d 'id=1'


-- 每日下次跟进消息
-- curl -H 'Content-Type: application/x-www-form-urlencoded ' -H 'headerRealName: -1' -H 'headerUserId: -1' -H 'headerTenantId: -1' http://127.0.0.1:8200/jobs/add/dynamic -d 'code=customer_follow_up&name=每日下次跟进消息&cronExpression=0 0 0 * * ?&url=http://*****:8202/customer/follow/up/qrtz_follow'
-- curl -H 'Content-Type: application/x-www-form-urlencoded ' -H 'headerRealName: -1' -H 'headerUserId: -1' -H 'headerTenantId: -1' http://127.0.0.1:8200/jobs/add -d 'id=2'





