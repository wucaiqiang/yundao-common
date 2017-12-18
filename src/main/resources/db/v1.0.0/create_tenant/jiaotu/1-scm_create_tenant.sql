
delimiter //
DROP PROCEDURE IF EXISTS create_tenant;
CREATE PROCEDURE `create_tenant`()
BEGIN

DECLARE _tenantId BIGINT;
DECLARE _userId BIGINT;
DECLARE _systemCode VARCHAR(20);
DECLARE _company VARCHAR(30);
DECLARE _code VARCHAR(20);
DECLARE _address VARCHAR(20);
DECLARE _userMobile VARCHAR(20);
DECLARE _userName VARCHAR(60);
DECLARE _userPwd VARCHAR(60);
DECLARE _dataSourceUrlEncrypt VARCHAR(1024);
DECLARE _dbUserNameEncrypt VARCHAR(512);
DECLARE _dbPwdEncrypt VARCHAR(512);
DECLARE _domain VARCHAR(512);
DECLARE _domain2 VARCHAR(512);

SET _systemCode='WM';

/*租户CODE*/
SET _code='jiaotu';

/*租户id*/
SET _tenantId=2;

/*公司名称*/
SET _company='椒图投资';

/*管理员手机号码*/
SET _userMobile = '18665660650'; 

/*管理员账号*/
SET _userName='jiaotuadmin';

/*管理员密码，默认123456*/
SET _userPwd='6fbae5df417d8e2e38ad7b08a50bc2a6';

/*地址*/
SET _address='广东';

/*加密后的 数据库链接 地址*/
SET _dataSourceUrlEncrypt='A51FDA7AA0A59A9A7A8AFF6DF1C18B555AA1C9163F8D06552776DF542CC47AD0AE5576F749DC21FB8CDCB83420670D383D4EBAA4A73C80FC857AD357952BA75953CB57666C36FB3951A701BA65E301376A2548FACC31418527C82363B6878D320CF41C20B77D31CD';

/*加密后的 数据库链接 用户名*/
SET _dbUserNameEncrypt='391D605FC6CF0C511438BFF2213A27850CF41C20B77D31CD';

/*加密后的 数据库链接 密码*/
SET _dbPwdEncrypt='5E965634D15A1D992104C0C624C66466E8D74BA4D2000BC4';

/*租户域名，格式：zr.yundaojishu.com*/
SET _domain='jiaotutz.yundaojishu.com';

SET _domain2='h5jiaotu.yundaojishu.com';

INSERT INTO `tenant` ( `id`,`tenant_id`, `name`, `code`, `type`, `address`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, _tenantId,_company, _code, NULL, _address, 1, NULL, SYSDATE(), NULL, NULL, NULL, 0);


INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 1, NULL, 0, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 2, NULL, 0, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 3, NULL, 0, 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 4, NULL, 0, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 5, NULL, 0, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 6, NULL, 0, 1, 6, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (_tenantId, _systemCode, NULL, 7, NULL, 0, 1, 7, NULL, NULL, NULL, NULL);


	SELECT id INTO _userId FROM user_account WHERE mobile=_userMobile;

	
IF _userId IS NULL
THEN 

		INSERT INTO `user_account` (`mobile`, `email`, `username`, `password`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES 
		(_userMobile, NULL, _userName, _userPwd, SYSDATE(), NULL, NULL, NULL, 0);
		SET _userId=LAST_INSERT_ID();

END IF;



INSERT INTO `user_tenant` ( `user_id`, `tenant_id`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES ( _userId, _tenantId, SYSDATE(), NULL, NULL, NULL, 0);


INSERT INTO `contract` (`tenant_id`, `system_code`, `name`, `serial_number`, `begin_date`, `expire_date`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, _systemCode,CONCAT(_company,'合同'), CONCAT('contract',_tenantId), SYSDATE(), '2019-12-25 14:34:22', '1',SYSDATE(), '-1', NULL, NULL, '0');

INSERT INTO `data_source` (`tenant_id`, `system_code`, `name`, `driver_class_name`, `url`, `username`, `password`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`)
VALUES (_tenantId, _systemCode, _company, 'com.mysql.jdbc.Driver', _dataSourceUrlEncrypt, _dbUserNameEncrypt, _dbPwdEncrypt, '1', SYSDATE(), null, null, null, '0');

INSERT INTO `domain_name` (`tenant_id`, `system_code`, `url`, `status`, `register_date`, `expire_date`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`)
 VALUES (_tenantId, _systemCode, _domain, '1',SYSDATE(), '2018-06-26 00:00:00', '1', SYSDATE(), NULL, NULL, NULL, '0');
 
 INSERT INTO `domain_name` (`tenant_id`, `system_code`, `url`, `status`, `register_date`, `expire_date`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`)
 VALUES (_tenantId, _systemCode, _domain2, '1',SYSDATE(), '2018-06-26 00:00:00', '1', SYSDATE(), NULL, NULL, NULL, '0');

END;


CALL create_tenant ();
DROP PROCEDURE create_tenant;

//