
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
SET _code='shenda';

/*租户id*/
SET _tenantId=3;

/*公司名称*/
SET _company='深达财富';

/*管理员手机号码*/
SET _userMobile = '13590340548'; 

/*管理员账号*/
SET _userName='shendaadmin';

/*管理员密码，默认123456*/
SET _userPwd='6fbae5df417d8e2e38ad7b08a50bc2a6';

/*地址*/
SET _address='广东深圳';

/*加密后的 数据库链接 地址*/
SET _dataSourceUrlEncrypt='A51FDA7AA0A59A9ABA286A9EDC925CB6A6A693E6E3ACC63A7DD54D9C1861591FF773D956A9112F5FA403609FDED0250A907C98ECF6CE227E8A02607B49A1F0F7B2769A416D74C9730BD7C5DF7B49BB0B1F961B22E94452F4';

/*加密后的 数据库链接 用户名*/
SET _dbUserNameEncrypt='F7CE6C57345F75023411DC349092A4190CF41C20B77D31CD';

/*加密后的 数据库链接 密码*/
SET _dbPwdEncrypt='48EFD1C81D0453DD879FB3F3AAC15219BAFFDDBADE16831A';

/*租户域名，格式：zr.yundaojishu.com*/
SET _domain='shenda.yundaojishu.com';

SET _domain2='h5shenda.yundaojishu.com';

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