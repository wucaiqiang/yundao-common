set @_tenantId = 1;
set @_user_account_id1 = 1;
set @_user_username1 = 'liaofei';
set @_userMobile1 = '13751113926';
set @_user_role = 1;


INSERT INTO `user_account` (`id`, `tenant_id`, `username`, `mobile`, `email`, `password`, `is_lock`, `is_enabled`,`is_system`,`create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (@_user_account_id1, @_tenantId, @_user_username1, @_userMobile1, NULL, NULL, 0, 1,1, NULL, NULL, NULL, NULL, 0);

INSERT INTO `user_department` ( `tenant_id`, `user_account_id`, `department_id`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES ( @_tenantId, @_user_account_id1, 0, 1, NULL, NULL, NULL, NULL, 0);

INSERT INTO `user_detail` (`tenant_id`, `user_account_id`, `nick_name`, `real_name`, `birth`, `sex`, `register_source`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (@_tenantId, @_user_account_id1, NULL, @_user_username1, NULL, 0, NULL, null, NULL, NULL, NULL, 0);

INSERT INTO `user_role` (`tenant_id`, `user_account_id`, `role_id`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (@_tenantId, @_user_account_id1, @_user_role, 1, NULL, NULL, NULL, NULL, 0);

INSERT INTO `user_staff` (`tenant_id`, `user_account_id`, `is_dimission`, `job_number`, `leader_id`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (@_tenantId, @_user_account_id1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0);