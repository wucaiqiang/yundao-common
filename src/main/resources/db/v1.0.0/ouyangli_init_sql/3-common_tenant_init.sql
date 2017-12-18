
set @_tenantId = 1;

set @_userId1 = 1;
set @_userMobile1 = '13751113926';
set @_user_username1='liaofei';
set @_password='6fbae5df417d8e2e38ad7b08a50bc2a6';


INSERT INTO `tenant` ( `id`,`tenant_id`, `name`, `code`, `type`, `address`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (@_tenantId, @_tenantId,'知人网络', 'zhiren', NULL, '深圳', 1, NULL, NULL, NULL, NULL, NULL, 0);




INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 1, NULL, 0, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 2, NULL, 0, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 3, NULL, 0, 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 4, NULL, 0, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 5, NULL, 0, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 6, NULL, 0, 1, 6, NULL, NULL, NULL, NULL);
INSERT INTO `tenant_init_role` ( `tenant_id`, `system_code`, `tenant_type`, `role_id`, `description`, `is_delete`, `is_enabled`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`) 
VALUES (@_tenantId, 'WM', NULL, 7, NULL, 0, 1, 7, NULL, NULL, NULL, NULL);


INSERT INTO `user_account` (`id`, `mobile`, `email`, `username`, `password`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(@_userId1, @_userMobile1, NULL, @_user_username1, @_password, NULL, NULL, NULL, NULL, 0);



INSERT INTO `user_tenant` ( `user_id`, `tenant_id`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES ( @_userId1, @_tenantId, NULL, NULL, NULL, NULL, 0);



INSERT INTO `key_pair` VALUES ('1', '-1', 'db', 0xACED0005737200156A6176612E73656375726974792E4B65795061697297030C3AD2CD12930200024C000A707269766174654B657974001A4C6A6176612F73656375726974792F507269766174654B65793B4C00097075626C69634B65797400194C6A6176612F73656375726974792F5075626C69634B65793B7870737200426F72672E626F756E6379636173746C652E6A63616A63652E70726F76696465722E6173796D6D65747269632E7273612E4243525341507269766174654372744B65796CBA87CE0273552E0200064C000E637274436F656666696369656E747400164C6A6176612F6D6174682F426967496E74656765723B4C000E7072696D654578706F6E656E745071007E00054C000E7072696D654578706F6E656E745171007E00054C00067072696D655071007E00054C00067072696D655171007E00054C000E7075626C69634578706F6E656E7471007E00057872003F6F72672E626F756E6379636173746C652E6A63616A63652E70726F76696465722E6173796D6D65747269632E7273612E4243525341507269766174654B657946EB09C007CF411C0300024C00076D6F64756C757371007E00054C000F707269766174654578706F6E656E7471007E00057870737200146A6176612E6D6174682E426967496E74656765728CFC9F1FA93BFB1D030006490008626974436F756E744900096269744C656E67746849001366697273744E6F6E7A65726F427974654E756D49000C6C6F776573745365744269744900067369676E756D5B00096D61676E69747564657400025B42787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE00000001757200025B42ACF317F8060854E0020000787000000080B6077EC99DDDCD77962C60CE0B3A7CB7779F94DEE01305EF8743626BD8A1F517ED11298ABFB7478E37122F5988C65844B31C97CCD773A0287D875DDF21318D75C98BE8EBFCFD1A5972E4308BA96515DAF400A8A5CF57FF7BF6473E81008F065A4BCAEA5B55C808EB213906F4A313D58B7FA6811F2E276F109673C62A4BDB041B787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C0000008040EB2967A45AAF659FF451CE0A2920C399F11AF9E5B6431EAB01F83EF832C2A376D3F119DFC7F0C82291E4BB2CD17837801D8971EFC0F7F498D8473D45AC53837D1537246D6EFCCC54A76A75C20FF5D83FC41D95198C45426DCC6DFC76AEDBD8FBAACC10911790AADED781CFCF476C0F3FF7BA3DC2D4A7949DBF2DF23E4E944978787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C000000401EB8DFF70B20AB0BE1ADBEE40234B4CE2DC072760E1056ACB4E1911A1693620EC64E421A5F327464AF1E3E631C5D9C02FE8B45FDA006CA417BC370150E2BE9B2787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C0000003F3500FDA87A6E9C16D44E4FCE6F978BE7910848F044F582957ECA6BA4021853052CF5B2B9408128FA12732C4E1037D46134CAC4E913BB4AD6A37AF965F5ACFD787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C0000004084B5A0455A382ADB740CC81493FE8A806804C2925EEE6B6147C0320C712753C9400783224D183180ED8807E7395717D93F7F111E47081BB12864852B46917E5D787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000040E9F3A1D184CFD629A977CB87B6B94D39E0D334D64EFF06CF78D37D7D7A6B66069ECEE41EAD252105703A76171CCA8FE142F7105798E725D38EA603E0CFC66417787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000040C72F2C10983B2C83A027F033A9E1BA30EC2343304D04C4AF2108AE81333BDBE970548975647F5B0CDFFD1FB8270F59977C4CAA73A69E22DE248902F2A318AE9D787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000003010001787372003E6F72672E626F756E6379636173746C652E6A63616A63652E70726F76696465722E6173796D6D65747269632E7273612E42435253415075626C69634B657925226A0E5BFA6C840300024C00076D6F64756C757371007E00054C000E7075626C69634578706F6E656E7471007E0005787071007E000B71007E001A78, '1', '2017-07-15 15:25:10', null, null, null, '0');
INSERT INTO `key_pair` VALUES ('2', '-1', 'tran', 0xACED0005737200156A6176612E73656375726974792E4B65795061697297030C3AD2CD12930200024C000A707269766174654B657974001A4C6A6176612F73656375726974792F507269766174654B65793B4C00097075626C69634B65797400194C6A6176612F73656375726974792F5075626C69634B65793B7870737200426F72672E626F756E6379636173746C652E6A63616A63652E70726F76696465722E6173796D6D65747269632E7273612E4243525341507269766174654372744B65796CBA87CE0273552E0200064C000E637274436F656666696369656E747400164C6A6176612F6D6174682F426967496E74656765723B4C000E7072696D654578706F6E656E745071007E00054C000E7072696D654578706F6E656E745171007E00054C00067072696D655071007E00054C00067072696D655171007E00054C000E7075626C69634578706F6E656E7471007E00057872003F6F72672E626F756E6379636173746C652E6A63616A63652E70726F76696465722E6173796D6D65747269632E7273612E4243525341507269766174654B657946EB09C007CF411C0300024C00076D6F64756C757371007E00054C000F707269766174654578706F6E656E7471007E00057870737200146A6176612E6D6174682E426967496E74656765728CFC9F1FA93BFB1D030006490008626974436F756E744900096269744C656E67746849001366697273744E6F6E7A65726F427974654E756D49000C6C6F776573745365744269744900067369676E756D5B00096D61676E69747564657400025B42787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE00000001757200025B42ACF317F8060854E0020000787000000080D6B0AA813D7434D39B57EF282FA14A95C130B89DD82563413531E9A68A496772A3D50D8C37D87A16003F613F847B6CB87A309D75355E8927AA78D86B00A03EBDF777F73A3BC343D58D237159D6B0C90A5C9AF847AFEF38C80BE993494CD29E4BF4DF1CCF4FFE7029D4660B7F8C073D812D44EE514E25F01E8851C630C2101053787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C000000805555A478397692B6D784C4CD5ADD47F9AD7011B9BFDBE08F5F370731C8BEB38D383CABA563DF3A6BBB4E75F79ACFBA5FBB45CE98738DAF83A2396580669FCB3FD976283D859DF3AAD0E824CA35A0AC34106BB207FAAABCF49C7196D8F3C1B9D1758B800B2128A44C1B054F5A26E9C19054ED7F179C3FF1171A6F2D2F080029BD78787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C000000400DD31FD9B1F35DF06D4249D04D0508AFC1E69885F663B1E26BF2F6921A37E0A8E694FFCEA86F4EC066320C668F9F0C7B59D6E28166B9184503246A7CD8B8A672787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000040E5F3D7DFF7E85289D9B0ABA9F0DA718935981448CA8E8B29C9D6C508C09CF6F452F8F1D8326CCA75551A6903EEDD5777E7C8BE09F7E614B61B0E2DD2B1D63EC5787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000040420EA4341919FE7CD7C4E143103472ED98CF082FC8033D51B26FE5FF77182BA0AF04F1D408BC204D260DA5140A8CB43EE17FFAC7939E5A199FB49A1BF6BD2A01787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000040F3C0469244F99F0737CE0979E7B6819732BB4D93D5B6AD669CAC7DFCDE4614EE8E2F47D4DB30AD1E4FB8C62D9A9A326128EEAFFE912D6BAD3CAC55B6B7EFDEED787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000040E17A896C565FE34A8968DDF8FAC44EF5EA9F28F1B59641FC5EBDC40B7B31F4CFB71D738875F9B87193FBE1BAA96587D59F8EE23BECE1094798EFB44632AE843F787371007E0008FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE000000017571007E000C00000003010001787372003E6F72672E626F756E6379636173746C652E6A63616A63652E70726F76696465722E6173796D6D65747269632E7273612E42435253415075626C69634B657925226A0E5BFA6C840300024C00076D6F64756C757371007E00054C000E7075626C69634578706F6E656E7471007E0005787071007E000B71007E001A78, '1', '2017-07-17 21:01:28', null, null, null, '0');

INSERT INTO `system` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, @_tenantId, '财富管理系统', 'WM', '财富管理系统', 1, 1, NULL, NULL, NULL, NULL, 0);


INSERT INTO `contract` (`tenant_id`, `system_code`, `name`, `serial_number`, `begin_date`, `expire_date`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (@_tenantId, 'WM', '知人网络合同', 'contract10001', '2017-07-25 14:34:18', '2019-12-25 14:34:22', '1', '2017-07-25 14:35:42', '-1', NULL, NULL, '0');

INSERT INTO `data_source` (`tenant_id`, `system_code`, `name`, `driver_class_name`, `url`, `username`, `password`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`)
VALUES (@_tenantId, 'WM', '知人网络数据源', 'com.mysql.jdbc.Driver', 'A51FDA7AA0A59A9A7A8AFF6DF1C18B55AE6F00E5EA2301BDF25CA698E54E0C203E139BB4336AAF6BEC9C558BD3D202F0EB2D964A9B9C669809FB908872B3C45B134E8D850F0259DDAE79AEFEA61A0CA5152F5122C23AAF9985B9FC770ABEC4C9DE49A5C55BA67FB196251BBB99D515284C6D4A34BFB47B1C
', '62EF59FC2356B39BF24765181BAACE64', 'CD81E62E8898C52F43248A4CC711035C', '1', '2017-06-29 15:37:11', null, null, null, '0');

INSERT INTO `domain_name` (`tenant_id`, `system_code`, `url`, `status`, `register_date`, `expire_date`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`)
 VALUES (@_tenantId, 'WM', 'zhiren.yundaojishu.com', '1', '2017-06-26 00:00:00', '2018-06-26 00:00:00', '1', '2017-06-26 16:16:33', NULL, NULL, NULL, '0');

INSERT INTO `domain_name` (`tenant_id`, `system_code`, `url`, `status`, `register_date`, `expire_date`, `is_enabled`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`)
 VALUES (@_tenantId, 'WM', 'zhiren.yundaojishu.com', '1', '2017-06-26 00:00:00', '2018-06-26 00:00:00', '1', '2017-06-26 16:16:33', NULL, NULL, NULL, '0');














