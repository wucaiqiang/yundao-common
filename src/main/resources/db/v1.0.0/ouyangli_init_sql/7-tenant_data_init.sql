delimiter //
DROP PROCEDURE IF EXISTS initial;
CREATE PROCEDURE `initial`()
BEGIN

DECLARE _tenantId BIGINT;
DECLARE _fixId BIGINT;
DECLARE _privateId BIGINT;
DECLARE _common BIGINT;
DECLARE _stackId BIGINT;

DECLARE _smsAccessKeyId VARCHAR(512);
DECLARE _smsAccesskeySecret VARCHAR(512);
DECLARE _smsSign VARCHAR(128);

SET _smsAccessKeyId='0363929D5D43709946FAADDD5442BEC40CF41C20B77D31CD';
SET _smsAccesskeySecret='06EDFB694C5782CF182BDEF02C20A5388761611109A9D9B7BD683B19A00F24AE';
SET _smsSign='阿里云短信测试专用';

SET _tenantId=1;
SET _privateId=1;
SET _stackId=2;
SET _fixId=3;
SET _common=4;


INSERT INTO `business_object` (`id`, `tenant_id`, `system_code`, `name`, `code`, `description`, `is_share`, `is_data_access`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', _tenantId, 'WM', '产品', 'product', NULL, '0', '0', '1', '1', NULL, NULL, NULL, NULL, '0');

INSERT INTO `field_group` (`id`, `tenant_id`, `business_object_id`, `parent_id`, `name`, `code`, `description`, `is_share`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', _tenantId, '1', '0', '阳光私募', 'private', NULL, '0', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `field_group` (`id`, `tenant_id`, `business_object_id`, `parent_id`, `name`, `code`, `description`, `is_share`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('2', _tenantId, '1', '0', '私募股权', 'stock', NULL, '0', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `field_group` (`id`, `tenant_id`, `business_object_id`, `parent_id`, `name`, `code`, `description`, `is_share`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('3', _tenantId, '1', '0', '固定收益', 'fix', NULL, '0', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `field_group` (`id`, `tenant_id`, `business_object_id`, `parent_id`, `name`, `code`, `description`, `is_share`, `is_enabled`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('4', _tenantId, '1', '0', '私募基金', 'common', NULL, '1', '1', NULL, NULL, NULL, NULL, '0');

INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', _tenantId, '产品', 'product', NULL, '30', '2017-07-13 10:17:29', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('2', _tenantId, '产品供应商报价', 'supplier', NULL, '40', '2017-07-13 10:17:58', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('3', _tenantId, '产品销售佣金', 'commission', NULL, '50', '2017-07-13 10:18:40', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('4', _tenantId, '产品公告', 'notice', NULL, '60', '2017-07-13 10:19:01', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('5', _tenantId, '客户', 'customer', NULL, '70', '2017-07-13 10:19:13', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('6', _tenantId, '客户联系信息', 'contact', NULL, '80', '2017-07-13 10:19:39', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('7', _tenantId, '产品要素', 'product_element', NULL, '10', '2017-07-24 17:14:59', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('8', _tenantId, '产品类别', 'product_type', NULL, '20', '2017-07-24 17:15:20', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('9', _tenantId, '预约', 'reservation', NULL, '110', '2017-07-25 11:26:24', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('10', _tenantId, '报单', 'declaration', NULL, '120', '2017-07-25 11:34:16', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('11', _tenantId, '回访', 'visit', NULL, '130', '2017-07-25 11:49:40', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('12', _tenantId, '销售线索', 'leads', NULL, '90', '2017-07-25 11:49:40', '1', NULL, NULL, '0');
INSERT INTO `data_object` (`id`, `tenant_id`, `name`, `code`, `description`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES ('13', _tenantId, '跟进', 'follow', NULL, '100', '2017-07-25 11:49:40', '1', NULL, NULL, '0');


INSERT INTO `field` (id,tenant_id,name,code) VALUES(1,_tenantId, '产品名称', 'product_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(2,_tenantId, '发行通道', 'product_issued_channel');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(3,_tenantId, '投资标的', 'product_invest_domain');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(4,_tenantId, '投资期限', 'product_time_limit');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(5,_tenantId, '管理机构', 'product_mechanism');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(6,_tenantId, '认购起点', 'product_buy_start_point');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(7,_tenantId, '递增金额', 'product_Incremental_amount');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(8,_tenantId, '投资人数上限', 'product_buy_person_count_limit');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(9,_tenantId, '产品等级', 'product_level');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(10,_tenantId, '风险等级', 'product_risk_level');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(11,_tenantId, '产品对接人', 'product_receiver_id');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(12,_tenantId, '产品助理', 'product_assistant_id');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(13,_tenantId, '简要亮点', 'product_highlight');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(14,_tenantId, '拟销售日期', 'product_sale_start_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(15,_tenantId, '是否有规模', 'product_is_scale');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(16,_tenantId, '产品规模', 'product_product_scale');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(17,_tenantId, '投资币种', 'product_currency_code');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(18,_tenantId, '打款账号', 'product_pay_account');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(19,_tenantId, '基金经理', 'product_private_fund_rm');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(20,_tenantId, '投资策略', 'product_private_investment_strategy');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(21,_tenantId, '投资子策略', 'product_private_investment_sub_strategy');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(22,_tenantId, '封闭期', 'product_private_closure_period');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(23,_tenantId, '基金类型', 'product_private_fund_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(24,_tenantId, '认购费', 'product_pro_buy_fee');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(25,_tenantId, '赎回费', 'product_private_redemption_fee');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(26,_tenantId, '管理费', 'product_pro_manage_fee');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(27,_tenantId, '开放日', 'product_private_date_open');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(28,_tenantId, '股权基金类型', 'product_stock_fund_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(29,_tenantId, '基金形式', 'product_stock_fund_form');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(30,_tenantId, '托管方', 'product_stock_custodian');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(31,_tenantId, '投资方向', 'product_stock_invest_way');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(32,_tenantId, '收益分成', 'product_stock_revenue_share');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(33,_tenantId, '固收基金类型', 'product_fix_fund_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(34,_tenantId, '投资领域', 'product_fix_invest_domain');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(35,_tenantId, '融资主体', 'product_fix_major_financing');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(36,_tenantId, '资金用途', 'product_fix_fund_use');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(37,_tenantId, '风控措施', 'product_fix_risk_control');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(38,_tenantId, '还款来源', 'product_fix_repayment');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(39,_tenantId, '收益信息', 'product_fix_profit_info');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(40,_tenantId, '付息方式', 'product_fix_pay_interest');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(41,_tenantId, '微信简版', 'product_wx_content');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(42,_tenantId, '开户名', 'product_account_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(43,_tenantId, '募集银行', 'product_raise_bank');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(44,_tenantId, '打款备注', 'product_pay_remark');


INSERT INTO `field` (id,tenant_id,name,code) VALUES(45,_tenantId, '姓名', 'customer_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(46,_tenantId, '邮箱', 'contact_email');/*联系信息*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(47,_tenantId, '手机号码', 'contact_mobile');/*联系信息*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(48,_tenantId, '微信', 'contact_wechat');/*联系信息*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(49,_tenantId, 'qq', 'contact_qq');/*联系信息*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(50,_tenantId, '省份', 'customer_province_code');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(51,_tenantId, '市', 'customer_city_code');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(52,_tenantId, '地址', 'customer_address');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(53,_tenantId, '行业', 'customer_trade');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(54,_tenantId, '机构', 'customer_organization');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(55,_tenantId, '职位', 'customer_position');

/*身份资料*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(56,_tenantId, '性别', 'customer_sex');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(57,_tenantId, '客户编号', 'customer_number');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(58,_tenantId, '客户级别', 'customer_level');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(59,_tenantId, '标签', 'customer_tag');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(60,_tenantId, '生日', 'customer_birthday');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(61,_tenantId, '客户来源', 'customer_source');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(62,_tenantId, '证件类型', 'customer_credentials_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(63,_tenantId, '证件号码', 'customer_credentials_number');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(64,_tenantId, '证件正面', 'customer_credentials_front');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(65,_tenantId, '证件反面', 'customer_credentials_back');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(66,_tenantId, '资产证明', 'customer_assets_certify');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(67,_tenantId, '备注', 'customer_remark');

/*银行卡*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(68,_tenantId, '银行卡账号', 'customer_bank_account');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(69,_tenantId, '开户行', 'customer_bank_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(70,_tenantId, '银行卡正面', 'customer_bank_front');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(71,_tenantId, '银行卡反面', 'customer_bank_back');

/*投资资料*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(72,_tenantId, '投资偏好', 'customer_customer_invest_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(73,_tenantId, '风险特征', 'customer_risk_rating');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(74,_tenantId, '投资人类型', 'customer_type');


/*回访*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(75,_tenantId, '提交回访时间', 'visit_sub_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(76,_tenantId, '回访事由', 'visit_matter');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(77,_tenantId, '回访时间', 'visit_visit_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(78,_tenantId, '回访方式', 'visit_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(79,_tenantId, '回访状态', 'visit_status');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(80,_tenantId, '回访内容', 'visit_content');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(81,_tenantId, '下次回访时间', 'visit_next_time');


/*预约*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(82,_tenantId, '预约编号', 'reservation_number');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(83,_tenantId, '预计打款日期', 'reservation_estimate_pay_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(84,_tenantId, '预约金额', 'reservation_reservation_amount');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(85,_tenantId, '备注', 'reservation_remark');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(86,_tenantId, '预约状态', 'reservation_status');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(87,_tenantId, '预约者id', 'reservation_user_id');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(88,_tenantId, '最后提交时间', 'reservation_commit_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(89,_tenantId, '最后审核操作时间', 'reservation_operation_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(90,_tenantId, '废弃原因', 'reservation_discard_reason');

/*报单*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(91,_tenantId, '报单编号', 'declaration_number');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(92,_tenantId, '打款日期', 'declaration_pay_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(93,_tenantId, '认购金额', 'declaration_deal_amount');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(94,_tenantId, '是否已上传打款凭证', 'declaration_has_pay_evidence');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(95,_tenantId, '备注', 'declaration_remark');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(96,_tenantId, '报单状态', 'declaration_status');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(97,_tenantId, '报单者id', 'declaration_user_id');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(98,_tenantId, '最后提交时间', 'declaration_commit_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(99,_tenantId, '最后审核操作时间', 'declaration_operation_date');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(100,_tenantId, '废弃原因', 'declaration_discard_reason');


/*报单附件*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(101,_tenantId, '附件名称', 'declaration_attach_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(102,_tenantId, '附件url', 'declaration_attach_url');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(103,_tenantId, '附件类型', 'declaration_attach_type');

/*报单合规文件*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(104,_tenantId, '合规文件url', 'declaration_compliance_url');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(105,_tenantId, '文件名', 'declaration_compliance_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(106,_tenantId, '类型', 'declaration_compliance_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(107,_tenantId, '格式', 'declaration_compliance_format_type');

/*报单银行卡*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(108,_tenantId, '银行卡账号', 'declaration_bank_account');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(109,_tenantId, '开户行', 'declaration_bank_name');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(110,_tenantId, '银行卡正面', 'declaration_bank_front');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(111,_tenantId, '银行卡反面', 'declaration_bank_back');

/*报单证件*/
INSERT INTO `field` (id,tenant_id,name,code) VALUES(112,_tenantId, '证件类型', 'declaration_credentials_type');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(113,_tenantId, '证件号码', 'declaration_credentials_number');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(114,_tenantId, '证件正面', 'declaration_credentials_front');
INSERT INTO `field` (id,tenant_id,name,code) VALUES(115,_tenantId, '证件反面', 'declaration_credentials_back');


UPDATE `field` SET create_user_id=1,create_date=SYSDATE();

UPDATE field SET create_date=CONCAT('2017-07-16 23:',(60-id),':00') WHERE id <11;
UPDATE field SET create_date=CONCAT('2017-07-16 22:',(60-id),':00') WHERE id >10 and id<61;
UPDATE field SET create_date=CONCAT('2017-07-16 21:',(120-id),':00') WHERE id >60 and id<116;


INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', _tenantId, '文本', 'text', '文本', NULL, '1', '0', '0', '1', '1', '-1', '2017-07-04 09:10:45', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('2', _tenantId, '文本域', 'textarea', '文本域', NULL, '2', '0', '0', '1', '1', '-1', '2017-07-04 09:11:29', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('3', _tenantId, '图片', 'image', '图片', NULL, '3', '0', '0', '1', '1', '-1', '2017-07-04 09:12:48', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('4', _tenantId, '日期', 'date', '日期', NULL, '4', '0', '0', '1', '1', '-1', '2017-07-04 09:13:20', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('5', _tenantId, '日期区间', 'date_range', '日期区间', NULL, '5', '0', '0', '1', '1', '-1', '2017-07-04 09:13:43', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('6', _tenantId, '下拉选项', 'select', '下拉选项', NULL, '6', '0', '0', '1', '1', '-1', '2017-07-04 09:15:17', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('7', _tenantId, '单选', 'radio', '单选', NULL, '7', '0', '0', '1', '1', '-1', '2017-07-04 09:15:45', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('8', _tenantId, '多选', 'checkbox', '多选', NULL, '8', '0', '0', '1', '1', '-1', '2017-07-04 09:16:12', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('9', _tenantId, '数值', 'number', '数值', NULL, '9', '0', '0', '1', '1', '-1', '2017-07-04 09:16:45', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('10', _tenantId, '数值区间', 'number_range', '数值区间', NULL, '10', '0', '0', '1', '1', '-1', '2017-07-04 09:17:08', NULL, NULL, '0');
INSERT INTO `field_type` (`id`, `tenant_id`, `name`, `code`, `description`, `demo_picture`, `type`, `is_search`, `is_share`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('11', _tenantId, '地址', 'address', '地址', NULL, '11', '0', '0', '1', '1', '-1', '2017-07-04 09:17:31', NULL, NULL, '0');





INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1',1, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '10'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 2, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '20'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 3, NULL, '6'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '30'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');


INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 4, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '40'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');


INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 5, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '50'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 6, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '60'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1',7, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '70'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 8, NULL, '9'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '80'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');


INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 9, NULL, '6'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '90'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 10, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '100'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 11, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '110'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 12, NULL, '1'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '120'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 13, NULL, '1'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '130'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 14, NULL, '5'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '140'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 15, NULL, '7'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '150'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 16, NULL, '9'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '160'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');


INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1',17, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '170'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 18, NULL, '1'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '180'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');




/*私募*/

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',19, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.fund.rm';


INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 20, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.investment.strategy';


INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 21, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.investment.sub.strategy';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 22, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.closure.period';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 23, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.fund.type';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 24, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='pro.buy.fee';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 25, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.redemption.fee';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 26, NULL, '9'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='pro.manage.fee';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 27, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_privateId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='private.date.open';



/*股权*/
INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 28, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='stock.fund.type';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',29, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='stock.fund.form';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 30, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='stock.custodian';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 31, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='stock.invest.way';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 32, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='stock.revenue.share';


INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='pro.buy.fee';
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_stackId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='pro.manage.fee';



/**固定收益**/
INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',33, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.fund.type';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',34, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.invest.domain';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 35, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.major.financing';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 36, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.fund.use';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1', 37, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.risk.control';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',38, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.repayment';


INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',39, NULL, '1'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.profit.info';

INSERT INTO `object_field` 
(`tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
( _tenantId, '1',40, NULL, '6'/*类型*/, '0', '1', '1'/*是否必填*/, '1'/*是否基本属性*/, '0'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '1'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
SELECT _tenantId,_fixId,id,20,1,'2017-07-04 00:00:00',NULL,NULL,0 FROM `field` WHERE code='fix.pay.interest';

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 41, NULL, '2'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '180'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 42, NULL, '1'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '180'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 43, NULL, '1'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '180'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

INSERT INTO `object_field` 
( `tenant_id`, `business_object_id`, `field_id`, `description`, `field_type_id`, `is_fix`, `display_type`, `is_mandatory`, `is_basic`, `is_share`, `is_system`, `is_search`, `is_readonly`, `is_init`, `is_enabled`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '1', 44, NULL, '1'/*类型*/, '0', '1', '0'/*是否必填*/, '1'/*是否基本属性*/, '1'/*是否通用*/, '1'/*是否系统*/, '1', '0', '1', '1', '180'/*排序*/, '1', '2017-07-04 19:50:47', NULL, NULL, '0');

/*全部可见*/
UPDATE object_field SET access=1;


/*************************下拉选项内容***************************/
INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'信托',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'资管',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'有限合伙',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'契约型基金',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'收益权质押',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,5/*values*/,'债权转让',5/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,6/*values*/,'其他',6/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='发行通道';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'一级市场',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资标的';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'一级半市场',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资标的';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'二级市场',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资标的';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'其他',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资标的';



INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'A',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='产品等级';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'B',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='产品等级';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'C',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='产品等级';



INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'中',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='风险等级';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'低',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='风险等级';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'高',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='风险等级';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'很高',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='风险等级';



INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'相对价值策略',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'管理期货',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'宏观策略',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'股票策略',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'事件驱动',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,5/*values*/,'债券策略',5/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,6/*values*/,'组合基金',6/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,7/*values*/,'其他策略',7/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,8/*values*/,'复合策略',8/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资策略';




INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'固定收益套利',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'可转换套利',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'股票市场中性',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'事件驱动复合策略',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'大宗交易',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,5/*values*/,'定向增发',5/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,6/*values*/,'并购重组',6/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,7/*values*/,'管理期货复合策略',7/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,8/*values*/,'系统化高频',8/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,9/*values*/,'主观日向',9/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,10/*values*/,'ETF套利',10/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,11/*values*/,'相对价值复合策略',11/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,12/*values*/,'债券策略',12/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,13/*values*/,'其他策略',13/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,14/*values*/,'FOF',14/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,15/*values*/,'MOM',15/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,16/*values*/,'系统化套利',16/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,17/*values*/,'系统化趋势',17/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,18/*values*/,'复合策略',18/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,19/*values*/,'组合基金',19/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,20/*values*/,'主观套利',20/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,21/*values*/,'主观趋势',21/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,22/*values*/,'股票复合策略',22/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,23/*values*/,'股票行业策略',23/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,24/*values*/,'股票量化',24/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,25/*values*/,'股票多空',25/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,26/*values*/,'股票多头',26/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,27/*values*/,'宏观策略',27/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资子策略';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'量化对冲基金',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='SP基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'私募证券基金',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='SP基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'定增基金',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='SP基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'股票／股票型基金',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='SP基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'其他',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='SP基金类型';



INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'单体项目',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='股权基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'组合项目',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='股权基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'并购基金',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='股权基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'定向增发',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='股权基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'其他',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='股权基金类型';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'有限合伙',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='基金形式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'契约型',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='基金形式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'其他',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='基金形式';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'信托计划',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='固收基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'资管计划',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='固收基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'契约式债权基金',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='固收基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'债券／债权基金',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='固收基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'中长期理财产品',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='固收基金类型';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,5/*values*/,'其他',5/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='固收基金类型';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'房地产',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'政信类',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'资金池',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'股权质押',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'公共投资',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,5/*values*/,'上市公司流贷',5/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,6/*values*/,'资产证券化',6/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,7/*values*/,'其他',7/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资领域';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'按月付息',0/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='付息方式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'到期付息',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='付息方式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,2/*values*/,'按年付息',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='付息方式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,3/*values*/,'半年付息',3/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='付息方式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,4/*values*/,'按季付息',4/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='付息方式';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'是',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='是否有规模';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'否',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='是否有规模';


INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,0/*values*/,'人民币',1/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资币种';

INSERT INTO `select_config`
 (`object_field_id`, `value`, `label`, `sequence`, `create_user_id`, `create_date`, `is_delete`) 
SELECT of.id,1/*values*/,'美元',2/*排序*/,1,SYSDATE(),0 FROM object_field of INNER JOIN field f ON of.field_id=f.id WHERE f.`name`='投资币种';


UPDATE `select_config` SET tenant_id=_tenantId,is_system=1;




INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '1'/*产品名称 字段id*/, NULL, '100'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '2'/*发行通道 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,NULL/*最大值*/,NULL/*最小值*/, '1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '3'/*投资标的 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '4'/*投资期限 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, '2147483647'/*最大值*/,'0'/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '5'/*管理机构 字段id*/, NULL, '64'/*最大长度*/, '1'/*最小长度*/,  NULL/*最大值*/,NULL/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '6'/*认购起点 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  '2147483647'/*最大值*/,'0'/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '7'/*递增金额 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  '2147483647'/*最大值*/,'0'/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '8'/*投资人数上限 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  '2147483647'/*最大值*/,'0'/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '9'/*产品等级 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  NULL/*最大值*/,NULL/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '10'/*风险等级 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  NULL/*最大值*/,NULL/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '11'/*产品对接人 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  NULL/*最大值*/,NULL/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '12'/*产品助理 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,  NULL/*最大值*/,NULL/*最小值*/,'1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '13'/*简要亮点 字段id*/, NULL, '1000'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '14'/*拟销售日期 字段id*/, NULL, '200'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '15'/*是否有规模 字段id*/, '1', '200'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '16'/*产品规模 字段id*/, NULL, '200'/*最大长度*/, '0'/*最小长度*/, '2147483647'/*最大值*/,'0'/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '17'/*投资币种 字段id*/, '0', '200'/*最大长度*/, '1'/*最小长度*/,NULL/*最大值*/,NULL/*最小值*/, '1','2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '18'/*打款账户 字段id*/, NULL, '250'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '19'/*基金经理 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '20'/*投资策略 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '21'/*投资子策略 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '22'/*封闭期 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,'2147483647'/*最大值*/,'0'/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '23'/*基金类型 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '24'/*认购费 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,'2147483647'/*最大值*/,'0'/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '25'/*赎回费 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,'2147483647'/*最大值*/,'0'/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '26'/*管理费 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/,'2147483647'/*最大值*/,'0'/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '27'/*开放日 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '28'/*股权基金类型 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '29'/*基金形式 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '30'/*托管方 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '31'/*投资方向 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '32'/*收益分成 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '33'/*固收基金类型 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '34'/*投资领域 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '35'/*融资主体 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '36'/*资金用途 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '37'/*风控措施 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '38'/*还款来源 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '39'/*收益信息 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '40'/*付息方式 字段id*/, NULL, '200'/*最大长度*/, '1'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '41'/*微信简版 字段id*/, NULL, '512'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '42'/*开户名 字段id*/, NULL, '64'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '43'/*募集银行 字段id*/, NULL, '64'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `field_config` (`tenant_id`, `object_field_id`, `default_value`, `max_length`, `min_length`,max_value,min_value, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (_tenantId, '44'/*打款备注 字段id*/, NULL, '64'/*最大长度*/, '0'/*最小长度*/, NULL/*最大值*/,NULL/*最小值*/,'1', '2017-07-07 08:30:21', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '4'/*投资期限 字段id*/, '0', '月'/*单位*/, -1, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');


INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '6'/*认购起点 字段id*/, '0', '万'/*单位*/, -1, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '7'/*递增金额 字段id*/, '0', '万'/*单位*/, -1, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '8'/*投资人数上限 字段id*/, '0', '人'/*单位*/, -1, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '16'/*产品规模 字段id*/, '4', '万'/*单位*/, -1, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '22'/*封闭期 字段id*/, '0', '月'/*单位*/, -1, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '24'/*认购费 字段id*/, '4', '%'/*单位*/, 100, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '25'/*赎回费 字段id*/, '4', '%'/*单位*/, 100, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');

INSERT INTO `number_config` (`tenant_id`, `object_field_id`, `decimal_length`, `unit`, `max_value`, `min_value`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES 
(_tenantId, '26'/*管理费 字段id*/, '4', '%'/*单位*/, 100, NULL, '0', '2017-07-18 14:19:29', NULL, NULL, '0');




INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_element';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product_type';



INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='product';




INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='supplier';





INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='commission';



INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';

INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,2/*删除*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='notice';




INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='customer';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='contact';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='reservation';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='reservation';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='reservation';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='reservation';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='reservation';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='reservation';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='declaration';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='declaration';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='declaration';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='declaration';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='declaration';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='declaration';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='visit';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='visit';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='visit';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='visit';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='visit';




INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='follow';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='follow';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='follow';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='follow';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='follow';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,1/*编辑*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='follow';


INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,0,1,1,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='leads';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,10,2,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='leads';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,20,3,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='leads';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,30,4,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='leads';
INSERT INTO `data_object_init` (`data_object_id`, `operation`, `permission`, `sequence`, `is_check`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
SELECT id,0/*读取*/,40,5,0,SYSDATE(),1,NULL,NULL,0 FROM data_object WHERE `code`='leads';





UPDATE `data_object_init` SET tenant_id=_tenantId;
UPDATE `data_object_init` SET is_delete=1,tenant_id=_tenantId WHERE permission=20;



/*产品中心*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,21,SYSDATE(),1,NULL,NULL );

/*产品中心 - 预约*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,36,SYSDATE(),1,NULL,NULL );

/*产品中心 - 报单*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,37,SYSDATE(),1,NULL,NULL );

/*客户管理*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,22,SYSDATE(),1,NULL,NULL );

/*客户管理 - 我的客户*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,23,SYSDATE(),1,NULL,NULL );

/*客户管理 - 我的客户 - 回退*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,43,SYSDATE(),1,NULL,NULL );

/*客户管理 - 我的客户 - 新增客户*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,44,SYSDATE(),1,NULL,NULL );


/*销售管理*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,26,SYSDATE(),1,NULL,NULL );

/*销售管理 - 我的预约*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,27,SYSDATE(),1,NULL,NULL );

/*销售管理 - 我的预约 - 新增预约*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,55,SYSDATE(),1,NULL,NULL );


/*销售管理 - 我的报单*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,28,SYSDATE(),1,NULL,NULL );

/*销售管理 - 我的预约 - 新增报单*/
INSERT INTO role_resource_init (tenant_id, resource_id, create_date, create_user_id, update_user_id, update_date)
    VALUE (_tenantId,56,SYSDATE(),1,NULL,NULL );



/*产品*/
INSERT INTO `data_object_field` (tenant_id,field_id,data_object_id,create_user_id,create_date,is_delete)
SELECT _tenantId,id,1,1,SYSDATE(),0 FROM field WHERE id<45;

/*联系信息*/
INSERT INTO `data_object_field` (tenant_id,field_id,data_object_id,create_user_id,create_date,is_delete)
SELECT _tenantId,id,6,1,SYSDATE(),0 FROM field WHERE id IN(46,47,48,49);

/*客户信息*/
INSERT INTO `data_object_field` (tenant_id,field_id,data_object_id,create_user_id,create_date,is_delete)
SELECT _tenantId,id,5,1,SYSDATE(),0 FROM field WHERE id IN (45,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,50,51,52,53,54,55);

/*回访*/
INSERT INTO `data_object_field` (tenant_id,field_id,data_object_id,create_user_id,create_date,is_delete)
SELECT _tenantId,id,11,1,SYSDATE(),0 FROM field WHERE id IN (75,76,77,78,79,80,81);

/*预约*/
INSERT INTO `data_object_field` (tenant_id,field_id,data_object_id,create_user_id,create_date,is_delete)
SELECT _tenantId,id,9,1,SYSDATE(),0 FROM field WHERE id>81 AND id <91;

/*报单*/
INSERT INTO `data_object_field` (tenant_id,field_id,data_object_id,create_user_id,create_date,is_delete)
SELECT _tenantId,id,10,1,SYSDATE(),0 FROM field WHERE id>90 AND id <116;

/*=============系统管理员==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'1',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'1',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'1',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'1',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'1',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'1',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'1',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');



/*=============理财师==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'2',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'2',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'2',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'2',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'2',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');


/*=============产品助理==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'3',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'3',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'3',/*read*/'40',/*delete*/'10',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'3',/*read*/'40',/*delete*/'10',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'3',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'3',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'3',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');



/*=============产品经理==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'4',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'4',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'4',/*read*/'40',/*delete*/'10',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'4',/*read*/'40',/*delete*/'10',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'4',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'4',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'4',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');



/*=============产品总监==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'5',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'5',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'5',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'5',/*read*/'40',/*delete*/'40',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'5',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'5',/*read*/'40',/*delete*/'0',/*edit*/'40',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'5',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');



/*=============客服专员==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'6',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'6',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'6',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'6',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'6',/*read*/'10',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');







/*=============运营经理==============*/
/*产品要素*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('7',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品类别*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('8',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('1',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品供应商报价*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('2',/*role_id*/'7',/*read*/'0',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品销售佣金*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('3',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*产品公告*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('4',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('5',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*客户联系信息*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('6',/*role_id*/'7',/*read*/'10',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*销售线索*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('12',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*跟进*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('13',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*预约*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('9',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*报单*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('10',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'10',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');

/*回访*/
INSERT INTO `data_object_access` (`data_object_id`,`role_id`,`read_permission`,`delete_permission`,`edit_permission`,`tenant_id`,`create_date`,`create_user_id`,`update_user_id`,`update_date`,`is_delete`)
VALUES('11',/*role_id*/'7',/*read*/'40',/*delete*/'0',/*edit*/'0',_tenantId,'2017-07-25 14:35:16','1','1','2017-07-25 14:35:16','0');




INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,1,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,2,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,3,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,4,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,5,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,6,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,7,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,8,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,9,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,10,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,11,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,12,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,13,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,14,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,15,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,16,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,17,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,18,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,41,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,42,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,43,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;
INSERT INTO `field_group_rel` (`tenant_id`, `field_group_id`, `object_field_id`, `sequence`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`)SELECT 1,id,44,0,-1,SYSDATE(),NULL,NULL,0 FROM field_group;


INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('1', _tenantId, '重大事项', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('2', _tenantId, '周报', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('3', _tenantId, '月报', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('4', _tenantId, '季报', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('5', _tenantId, '半年报', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('6', _tenantId, '年报', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('7', _tenantId, '私募备案', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('8', _tenantId, '通知赎回', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('9', _tenantId, '产品成立', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('10', _tenantId, '付息通知', NULL, 1, SYSDATE(), NULL, NULL, '0');
INSERT INTO `product_notice_type`
 (`id`, `tenant_id`, `name`, `description`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES
 ('11', _tenantId, '其他', NULL, 1, SYSDATE(), NULL, NULL, '0');





-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('54317', '1', '0', '中国', 'dic_area', '54317', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54318', '1', '57616', '北京市', '110100', '54318', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54319', '1', '54318', '东城区', '110101', '54319', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54320', '1', '54318', '西城区', '110102', '54320', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54321', '1', '54318', '崇文区', '110103', '54321', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54322', '1', '54318', '宣武区', '110104', '54322', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54323', '1', '54318', '朝阳区', '110105', '54323', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54324', '1', '54318', '丰台区', '110106', '54324', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54325', '1', '54318', '石景山区', '110107', '54325', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54326', '1', '54318', '海淀区', '110108', '54326', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54327', '1', '54318', '门头沟区', '110109', '54327', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54328', '1', '54318', '房山区', '110111', '54328', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54329', '1', '54318', '通州区', '110112', '54329', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54330', '1', '54318', '顺义区', '110113', '54330', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54331', '1', '54318', '昌平区', '110114', '54331', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54332', '1', '54318', '大兴区', '110115', '54332', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54333', '1', '54318', '怀柔区', '110116', '54333', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54334', '1', '54318', '平谷区', '110117', '54334', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54335', '1', '54318', '密云县', '110228', '54335', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54336', '1', '54318', '延庆县', '110229', '54336', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54337', '1', '57617', '天津市', '120100', '54337', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54338', '1', '54337', '和平区', '120101', '54338', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54339', '1', '54337', '河东区', '120102', '54339', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54340', '1', '54337', '河西区', '120103', '54340', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54341', '1', '54337', '南开区', '120104', '54341', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54342', '1', '54337', '河北区', '120105', '54342', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54343', '1', '54337', '红桥区', '120106', '54343', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54344', '1', '54337', '塘沽区', '120107', '54344', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54345', '1', '54337', '汉沽区', '120108', '54345', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54346', '1', '54337', '大港区', '120109', '54346', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54347', '1', '54337', '东丽区', '120110', '54347', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54348', '1', '54337', '西青区', '120111', '54348', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54349', '1', '54337', '津南区', '120112', '54349', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54350', '1', '54337', '北辰区', '120113', '54350', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54351', '1', '54337', '武清区', '120114', '54351', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54352', '1', '54337', '宝坻区', '120115', '54352', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54353', '1', '54337', '宁河县', '120221', '54353', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54354', '1', '54337', '静海县', '120223', '54354', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54355', '1', '54337', '蓟县', '120225', '54355', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54356', '1', '54317', '河北省', '130000', '54356', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54357', '1', '54356', '石家庄市', '130100', '54357', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54358', '1', '54357', '长安区', '130102', '54358', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54359', '1', '54357', '桥东区', '130103', '54359', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54360', '1', '54357', '桥西区', '130104', '54360', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54361', '1', '54357', '新华区', '130105', '54361', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54362', '1', '54357', '井陉矿区', '130107', '54362', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54363', '1', '54357', '裕华区', '130108', '54363', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54364', '1', '54357', '井陉县', '130121', '54364', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54365', '1', '54357', '正定县', '130123', '54365', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54366', '1', '54357', '栾城县', '130124', '54366', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54367', '1', '54357', '行唐县', '130125', '54367', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54368', '1', '54357', '灵寿县', '130126', '54368', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54369', '1', '54357', '高邑县', '130127', '54369', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54370', '1', '54357', '深泽县', '130128', '54370', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54371', '1', '54357', '赞皇县', '130129', '54371', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54372', '1', '54357', '无极县', '130130', '54372', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54373', '1', '54357', '平山县', '130131', '54373', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54374', '1', '54357', '元氏县', '130132', '54374', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54375', '1', '54357', '赵县', '130133', '54375', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54376', '1', '54357', '辛集市', '130181', '54376', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54377', '1', '54357', '藁城市', '130182', '54377', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54378', '1', '54357', '晋州市', '130183', '54378', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54379', '1', '54357', '新乐市', '130184', '54379', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54380', '1', '54357', '鹿泉市', '130185', '54380', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54381', '1', '54356', '唐山市', '130200', '54381', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54382', '1', '54381', '路南区', '130202', '54382', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54383', '1', '54381', '路北区', '130203', '54383', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54384', '1', '54381', '古冶区', '130204', '54384', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54385', '1', '54381', '开平区', '130205', '54385', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54386', '1', '54381', '丰南区', '130207', '54386', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54387', '1', '54381', '丰润区', '130208', '54387', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54388', '1', '54381', '滦县', '130223', '54388', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54389', '1', '54381', '滦南县', '130224', '54389', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54390', '1', '54381', '乐亭县', '130225', '54390', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54391', '1', '54381', '迁西县', '130227', '54391', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54392', '1', '54381', '玉田县', '130229', '54392', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54393', '1', '54381', '唐海县', '130230', '54393', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54394', '1', '54381', '遵化市', '130281', '54394', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54395', '1', '54381', '迁安市', '130283', '54395', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54396', '1', '54356', '秦皇岛市', '130300', '54396', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54397', '1', '54396', '海港区', '130302', '54397', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54398', '1', '54396', '山海关区', '130303', '54398', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54399', '1', '54396', '北戴河区', '130304', '54399', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54400', '1', '54396', '青龙满族自治县', '130321', '54400', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54401', '1', '54396', '昌黎县', '130322', '54401', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54402', '1', '54396', '抚宁县', '130323', '54402', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54403', '1', '54396', '卢龙县', '130324', '54403', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54404', '1', '54356', '邯郸市', '130400', '54404', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54405', '1', '54404', '邯山区', '130402', '54405', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54406', '1', '54404', '丛台区', '130403', '54406', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54407', '1', '54404', '复兴区', '130404', '54407', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54408', '1', '54404', '峰峰矿区', '130406', '54408', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54409', '1', '54404', '邯郸县', '130421', '54409', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54410', '1', '54404', '临漳县', '130423', '54410', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54411', '1', '54404', '成安县', '130424', '54411', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54412', '1', '54404', '大名县', '130425', '54412', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54413', '1', '54404', '涉县', '130426', '54413', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54414', '1', '54404', '磁县', '130427', '54414', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54415', '1', '54404', '肥乡县', '130428', '54415', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54416', '1', '54404', '永年县', '130429', '54416', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54417', '1', '54404', '邱县', '130430', '54417', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54418', '1', '54404', '鸡泽县', '130431', '54418', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54419', '1', '54404', '广平县', '130432', '54419', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54420', '1', '54404', '馆陶县', '130433', '54420', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54421', '1', '54404', '魏县', '130434', '54421', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54422', '1', '54404', '曲周县', '130435', '54422', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54423', '1', '54404', '武安市', '130481', '54423', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54424', '1', '54356', '邢台市', '130500', '54424', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54425', '1', '54424', '桥东区', '130502', '54425', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54426', '1', '54424', '桥西区', '130503', '54426', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54427', '1', '54424', '邢台县', '130521', '54427', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54428', '1', '54424', '临城县', '130522', '54428', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54429', '1', '54424', '内丘县', '130523', '54429', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54430', '1', '54424', '柏乡县', '130524', '54430', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54431', '1', '54424', '隆尧县', '130525', '54431', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54432', '1', '54424', '任县', '130526', '54432', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54433', '1', '54424', '南和县', '130527', '54433', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54434', '1', '54424', '宁晋县', '130528', '54434', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54435', '1', '54424', '巨鹿县', '130529', '54435', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54436', '1', '54424', '新河县', '130530', '54436', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54437', '1', '54424', '广宗县', '130531', '54437', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54438', '1', '54424', '平乡县', '130532', '54438', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54439', '1', '54424', '威县', '130533', '54439', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54440', '1', '54424', '清河县', '130534', '54440', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54441', '1', '54424', '临西县', '130535', '54441', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54442', '1', '54424', '南宫市', '130581', '54442', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54443', '1', '54424', '沙河市', '130582', '54443', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54444', '1', '54356', '保定市', '130600', '54444', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54445', '1', '54444', '新市区', '130602', '54445', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54446', '1', '54444', '北市区', '130603', '54446', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54447', '1', '54444', '南市区', '130604', '54447', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54448', '1', '54444', '满城县', '130621', '54448', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54449', '1', '54444', '清苑县', '130622', '54449', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54450', '1', '54444', '涞水县', '130623', '54450', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54451', '1', '54444', '阜平县', '130624', '54451', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54452', '1', '54444', '徐水县', '130625', '54452', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54453', '1', '54444', '定兴县', '130626', '54453', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54454', '1', '54444', '唐县', '130627', '54454', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54455', '1', '54444', '高阳县', '130628', '54455', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54456', '1', '54444', '容城县', '130629', '54456', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54457', '1', '54444', '涞源县', '130630', '54457', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54458', '1', '54444', '望都县', '130631', '54458', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54459', '1', '54444', '安新县', '130632', '54459', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54460', '1', '54444', '易县', '130633', '54460', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54461', '1', '54444', '曲阳县', '130634', '54461', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54462', '1', '54444', '蠡县', '130635', '54462', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54463', '1', '54444', '顺平县', '130636', '54463', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54464', '1', '54444', '博野县', '130637', '54464', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54465', '1', '54444', '雄县', '130638', '54465', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54466', '1', '54444', '涿州市', '130681', '54466', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54467', '1', '54444', '定州市', '130682', '54467', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54468', '1', '54444', '安国市', '130683', '54468', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54469', '1', '54444', '高碑店市', '130684', '54469', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54470', '1', '54356', '张家口市', '130700', '54470', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54471', '1', '54470', '桥东区', '130702', '54471', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54472', '1', '54470', '桥西区', '130703', '54472', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54473', '1', '54470', '宣化区', '130705', '54473', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54474', '1', '54470', '下花园区', '130706', '54474', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54475', '1', '54470', '宣化县', '130721', '54475', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54476', '1', '54470', '张北县', '130722', '54476', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54477', '1', '54470', '康保县', '130723', '54477', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54478', '1', '54470', '沽源县', '130724', '54478', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54479', '1', '54470', '尚义县', '130725', '54479', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54480', '1', '54470', '蔚县', '130726', '54480', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54481', '1', '54470', '阳原县', '130727', '54481', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54482', '1', '54470', '怀安县', '130728', '54482', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54483', '1', '54470', '万全县', '130729', '54483', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54484', '1', '54470', '怀来县', '130730', '54484', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54485', '1', '54470', '涿鹿县', '130731', '54485', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54486', '1', '54470', '赤城县', '130732', '54486', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54487', '1', '54470', '崇礼县', '130733', '54487', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54488', '1', '54356', '承德市', '130800', '54488', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54489', '1', '54488', '双桥区', '130802', '54489', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54490', '1', '54488', '双滦区', '130803', '54490', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54491', '1', '54488', '鹰手营子矿区', '130804', '54491', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54492', '1', '54488', '承德县', '130821', '54492', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54493', '1', '54488', '兴隆县', '130822', '54493', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54494', '1', '54488', '平泉县', '130823', '54494', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54495', '1', '54488', '滦平县', '130824', '54495', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54496', '1', '54488', '隆化县', '130825', '54496', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54497', '1', '54488', '丰宁满族自治县', '130826', '54497', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54498', '1', '54488', '宽城满族自治县', '130827', '54498', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54499', '1', '54488', '围场满族蒙古族自治县', '130828', '54499', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54500', '1', '54356', '沧州市', '130900', '54500', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54501', '1', '54500', '新华区', '130902', '54501', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54502', '1', '54500', '运河区', '130903', '54502', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54503', '1', '54500', '沧县', '130921', '54503', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54504', '1', '54500', '青县', '130922', '54504', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54505', '1', '54500', '东光县', '130923', '54505', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54506', '1', '54500', '海兴县', '130924', '54506', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54507', '1', '54500', '盐山县', '130925', '54507', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54508', '1', '54500', '肃宁县', '130926', '54508', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54509', '1', '54500', '南皮县', '130927', '54509', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54510', '1', '54500', '吴桥县', '130928', '54510', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54511', '1', '54500', '献县', '130929', '54511', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54512', '1', '54500', '孟村回族自治县', '130930', '54512', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54513', '1', '54500', '泊头市', '130981', '54513', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54514', '1', '54500', '任丘市', '130982', '54514', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54515', '1', '54500', '黄骅市', '130983', '54515', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54516', '1', '54500', '河间市', '130984', '54516', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54517', '1', '54356', '廊坊市', '131000', '54517', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54518', '1', '54517', '安次区', '131002', '54518', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54519', '1', '54517', '广阳区', '131003', '54519', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54520', '1', '54517', '固安县', '131022', '54520', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54521', '1', '54517', '永清县', '131023', '54521', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54522', '1', '54517', '香河县', '131024', '54522', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54523', '1', '54517', '大城县', '131025', '54523', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54524', '1', '54517', '文安县', '131026', '54524', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54525', '1', '54517', '大厂回族自治县', '131028', '54525', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54526', '1', '54517', '霸州市', '131081', '54526', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54527', '1', '54517', '三河市', '131082', '54527', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54528', '1', '54356', '衡水市', '131100', '54528', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54529', '1', '54528', '桃城区', '131102', '54529', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54530', '1', '54528', '枣强县', '131121', '54530', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54531', '1', '54528', '武邑县', '131122', '54531', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54532', '1', '54528', '武强县', '131123', '54532', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54533', '1', '54528', '饶阳县', '131124', '54533', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54534', '1', '54528', '安平县', '131125', '54534', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54535', '1', '54528', '故城县', '131126', '54535', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54536', '1', '54528', '景县', '131127', '54536', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54537', '1', '54528', '阜城县', '131128', '54537', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54538', '1', '54528', '冀州市', '131181', '54538', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54539', '1', '54528', '深州市', '131182', '54539', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54540', '1', '54317', '山西省', '140000', '54540', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54541', '1', '54540', '太原市', '140100', '54541', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54542', '1', '54541', '小店区', '140105', '54542', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54543', '1', '54541', '迎泽区', '140106', '54543', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54544', '1', '54541', '杏花岭区', '140107', '54544', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54545', '1', '54541', '尖草坪区', '140108', '54545', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54546', '1', '54541', '万柏林区', '140109', '54546', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54547', '1', '54541', '晋源区', '140110', '54547', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54548', '1', '54541', '清徐县', '140121', '54548', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54549', '1', '54541', '阳曲县', '140122', '54549', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54550', '1', '54541', '娄烦县', '140123', '54550', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54551', '1', '54541', '古交市', '140181', '54551', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54552', '1', '54540', '大同市', '140200', '54552', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54553', '1', '54552', '城区', '140202', '54553', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54554', '1', '54552', '矿区', '140203', '54554', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54555', '1', '54552', '南郊区', '140211', '54555', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54556', '1', '54552', '新荣区', '140212', '54556', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54557', '1', '54552', '阳高县', '140221', '54557', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54558', '1', '54552', '天镇县', '140222', '54558', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54559', '1', '54552', '广灵县', '140223', '54559', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54560', '1', '54552', '灵丘县', '140224', '54560', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54561', '1', '54552', '浑源县', '140225', '54561', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54562', '1', '54552', '左云县', '140226', '54562', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54563', '1', '54552', '大同县', '140227', '54563', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54564', '1', '54540', '阳泉市', '140300', '54564', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54565', '1', '54564', '城区', '140302', '54565', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54566', '1', '54564', '矿区', '140303', '54566', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54567', '1', '54564', '郊区', '140311', '54567', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54568', '1', '54564', '平定县', '140321', '54568', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54569', '1', '54564', '盂县', '140322', '54569', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54570', '1', '54540', '长治市', '140400', '54570', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54571', '1', '54570', '城区', '140402', '54571', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54572', '1', '54570', '郊区', '140411', '54572', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54573', '1', '54570', '长治县', '140421', '54573', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54574', '1', '54570', '襄垣县', '140423', '54574', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54575', '1', '54570', '屯留县', '140424', '54575', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54576', '1', '54570', '平顺县', '140425', '54576', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54577', '1', '54570', '黎城县', '140426', '54577', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54578', '1', '54570', '壶关县', '140427', '54578', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54579', '1', '54570', '长子县', '140428', '54579', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54580', '1', '54570', '武乡县', '140429', '54580', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54581', '1', '54570', '沁县', '140430', '54581', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54582', '1', '54570', '沁源县', '140431', '54582', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54583', '1', '54570', '潞城市', '140481', '54583', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54584', '1', '54540', '晋城市', '140500', '54584', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54585', '1', '54584', '城区', '140502', '54585', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54586', '1', '54584', '沁水县', '140521', '54586', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54587', '1', '54584', '阳城县', '140522', '54587', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54588', '1', '54584', '陵川县', '140524', '54588', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54589', '1', '54584', '泽州县', '140525', '54589', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54590', '1', '54584', '高平市', '140581', '54590', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54591', '1', '54540', '朔州市', '140600', '54591', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54592', '1', '54591', '朔城区', '140602', '54592', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54593', '1', '54591', '平鲁区', '140603', '54593', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54594', '1', '54591', '山阴县', '140621', '54594', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54595', '1', '54591', '应县', '140622', '54595', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54596', '1', '54591', '右玉县', '140623', '54596', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54597', '1', '54591', '怀仁县', '140624', '54597', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54598', '1', '54540', '晋中市', '140700', '54598', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54599', '1', '54598', '榆次区', '140702', '54599', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54600', '1', '54598', '榆社县', '140721', '54600', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54601', '1', '54598', '左权县', '140722', '54601', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54602', '1', '54598', '和顺县', '140723', '54602', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54603', '1', '54598', '昔阳县', '140724', '54603', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54604', '1', '54598', '寿阳县', '140725', '54604', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54605', '1', '54598', '太谷县', '140726', '54605', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54606', '1', '54598', '祁县', '140727', '54606', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54607', '1', '54598', '平遥县', '140728', '54607', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54608', '1', '54598', '灵石县', '140729', '54608', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54609', '1', '54598', '介休市', '140781', '54609', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54610', '1', '54540', '运城市', '140800', '54610', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54611', '1', '54610', '盐湖区', '140802', '54611', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54612', '1', '54610', '临猗县', '140821', '54612', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54613', '1', '54610', '万荣县', '140822', '54613', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54614', '1', '54610', '闻喜县', '140823', '54614', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54615', '1', '54610', '稷山县', '140824', '54615', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54616', '1', '54610', '新绛县', '140825', '54616', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54617', '1', '54610', '绛县', '140826', '54617', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54618', '1', '54610', '垣曲县', '140827', '54618', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54619', '1', '54610', '夏县', '140828', '54619', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54620', '1', '54610', '平陆县', '140829', '54620', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54621', '1', '54610', '芮城县', '140830', '54621', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54622', '1', '54610', '永济市', '140881', '54622', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54623', '1', '54610', '河津市', '140882', '54623', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54624', '1', '54540', '忻州市', '140900', '54624', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54625', '1', '54624', '忻府区', '140902', '54625', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54626', '1', '54624', '定襄县', '140921', '54626', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54627', '1', '54624', '五台县', '140922', '54627', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54628', '1', '54624', '代县', '140923', '54628', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54629', '1', '54624', '繁峙县', '140924', '54629', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54630', '1', '54624', '宁武县', '140925', '54630', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54631', '1', '54624', '静乐县', '140926', '54631', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54632', '1', '54624', '神池县', '140927', '54632', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54633', '1', '54624', '五寨县', '140928', '54633', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54634', '1', '54624', '岢岚县', '140929', '54634', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54635', '1', '54624', '河曲县', '140930', '54635', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54636', '1', '54624', '保德县', '140931', '54636', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54637', '1', '54624', '偏关县', '140932', '54637', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54638', '1', '54624', '原平市', '140981', '54638', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54639', '1', '54540', '临汾市', '141000', '54639', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54640', '1', '54639', '尧都区', '141002', '54640', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54641', '1', '54639', '曲沃县', '141021', '54641', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54642', '1', '54639', '翼城县', '141022', '54642', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54643', '1', '54639', '襄汾县', '141023', '54643', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54644', '1', '54639', '洪洞县', '141024', '54644', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54645', '1', '54639', '古县', '141025', '54645', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54646', '1', '54639', '安泽县', '141026', '54646', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54647', '1', '54639', '浮山县', '141027', '54647', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54648', '1', '54639', '吉县', '141028', '54648', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54649', '1', '54639', '乡宁县', '141029', '54649', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54650', '1', '54639', '大宁县', '141030', '54650', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54651', '1', '54639', '隰县', '141031', '54651', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54652', '1', '54639', '永和县', '141032', '54652', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54653', '1', '54639', '蒲县', '141033', '54653', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54654', '1', '54639', '汾西县', '141034', '54654', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54655', '1', '54639', '侯马市', '141081', '54655', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54656', '1', '54639', '霍州市', '141082', '54656', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54657', '1', '54540', '吕梁市', '141100', '54657', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54658', '1', '54657', '离石区', '141102', '54658', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54659', '1', '54657', '文水县', '141121', '54659', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54660', '1', '54657', '交城县', '141122', '54660', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54661', '1', '54657', '兴县', '141123', '54661', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54662', '1', '54657', '临县', '141124', '54662', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54663', '1', '54657', '柳林县', '141125', '54663', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54664', '1', '54657', '石楼县', '141126', '54664', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54665', '1', '54657', '岚县', '141127', '54665', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54666', '1', '54657', '方山县', '141128', '54666', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54667', '1', '54657', '中阳县', '141129', '54667', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54668', '1', '54657', '交口县', '141130', '54668', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54669', '1', '54657', '孝义市', '141181', '54669', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54670', '1', '54657', '汾阳市', '141182', '54670', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54671', '1', '54317', '内蒙古自治区', '150000', '54671', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54672', '1', '54671', '呼和浩特市', '150100', '54672', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54673', '1', '54672', '新城区', '150102', '54673', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54674', '1', '54672', '回民区', '150103', '54674', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54675', '1', '54672', '玉泉区', '150104', '54675', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54676', '1', '54672', '赛罕区', '150105', '54676', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54677', '1', '54672', '土默特左旗', '150121', '54677', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54678', '1', '54672', '托克托县', '150122', '54678', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54679', '1', '54672', '和林格尔县', '150123', '54679', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54680', '1', '54672', '清水河县', '150124', '54680', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54681', '1', '54672', '武川县', '150125', '54681', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54682', '1', '54671', '包头市', '150200', '54682', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54683', '1', '54682', '东河区', '150202', '54683', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54684', '1', '54682', '昆都仑区', '150203', '54684', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54685', '1', '54682', '青山区', '150204', '54685', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54686', '1', '54682', '石拐区', '150205', '54686', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54687', '1', '54682', '白云鄂博矿区', '150206', '54687', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54688', '1', '54682', '九原区', '150207', '54688', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54689', '1', '54682', '土默特右旗', '150221', '54689', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54690', '1', '54682', '固阳县', '150222', '54690', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54691', '1', '54682', '达尔罕茂明安联合旗', '150223', '54691', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54692', '1', '54671', '乌海市', '150300', '54692', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54693', '1', '54692', '海勃湾区', '150302', '54693', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54694', '1', '54692', '海南区', '150303', '54694', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54695', '1', '54692', '乌达区', '150304', '54695', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54696', '1', '54671', '赤峰市', '150400', '54696', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54697', '1', '54696', '红山区', '150402', '54697', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54698', '1', '54696', '元宝山区', '150403', '54698', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54699', '1', '54696', '松山区', '150404', '54699', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54700', '1', '54696', '阿鲁科尔沁旗', '150421', '54700', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54701', '1', '54696', '巴林左旗', '150422', '54701', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54702', '1', '54696', '巴林右旗', '150423', '54702', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54703', '1', '54696', '林西县', '150424', '54703', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54704', '1', '54696', '克什克腾旗', '150425', '54704', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54705', '1', '54696', '翁牛特旗', '150426', '54705', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54706', '1', '54696', '喀喇沁旗', '150428', '54706', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54707', '1', '54696', '宁城县', '150429', '54707', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54708', '1', '54696', '敖汉旗', '150430', '54708', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54709', '1', '54671', '通辽市', '150500', '54709', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54710', '1', '54709', '科尔沁区', '150502', '54710', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54711', '1', '54709', '科尔沁左翼中旗', '150521', '54711', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54712', '1', '54709', '科尔沁左翼后旗', '150522', '54712', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54713', '1', '54709', '开鲁县', '150523', '54713', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54714', '1', '54709', '库伦旗', '150524', '54714', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54715', '1', '54709', '奈曼旗', '150525', '54715', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54716', '1', '54709', '扎鲁特旗', '150526', '54716', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54717', '1', '54709', '霍林郭勒市', '150581', '54717', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54718', '1', '54671', '鄂尔多斯市', '150600', '54718', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54719', '1', '54718', '东胜区', '150602', '54719', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54720', '1', '54718', '达拉特旗', '150621', '54720', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54721', '1', '54718', '准格尔旗', '150622', '54721', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54722', '1', '54718', '鄂托克前旗', '150623', '54722', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54723', '1', '54718', '鄂托克旗', '150624', '54723', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54724', '1', '54718', '杭锦旗', '150625', '54724', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54725', '1', '54718', '乌审旗', '150626', '54725', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54726', '1', '54718', '伊金霍洛旗', '150627', '54726', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54727', '1', '54671', '呼伦贝尔市', '150700', '54727', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54728', '1', '54727', '海拉尔区', '150702', '54728', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54729', '1', '54727', '阿荣旗', '150721', '54729', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54730', '1', '54727', '莫力达瓦达斡尔族自治旗', '150722', '54730', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54731', '1', '54727', '鄂伦春自治旗', '150723', '54731', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54732', '1', '54727', '鄂温克族自治旗', '150724', '54732', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54733', '1', '54727', '陈巴尔虎旗', '150725', '54733', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54734', '1', '54727', '新巴尔虎左旗', '150726', '54734', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54735', '1', '54727', '新巴尔虎右旗', '150727', '54735', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54736', '1', '54727', '满洲里市', '150781', '54736', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54737', '1', '54727', '牙克石市', '150782', '54737', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54738', '1', '54727', '扎兰屯市', '150783', '54738', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54739', '1', '54727', '额尔古纳市', '150784', '54739', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54740', '1', '54727', '根河市', '150785', '54740', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54741', '1', '54671', '巴彦淖尔市', '150800', '54741', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54742', '1', '54741', '临河区', '150802', '54742', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54743', '1', '54741', '五原县', '150821', '54743', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54744', '1', '54741', '磴口县', '150822', '54744', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54745', '1', '54741', '乌拉特前旗', '150823', '54745', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54746', '1', '54741', '乌拉特中旗', '150824', '54746', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54747', '1', '54741', '乌拉特后旗', '150825', '54747', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54748', '1', '54741', '杭锦后旗', '150826', '54748', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54749', '1', '54671', '乌兰察布市', '150900', '54749', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54750', '1', '54749', '集宁区', '150902', '54750', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54751', '1', '54749', '卓资县', '150921', '54751', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54752', '1', '54749', '化德县', '150922', '54752', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54753', '1', '54749', '商都县', '150923', '54753', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54754', '1', '54749', '兴和县', '150924', '54754', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54755', '1', '54749', '凉城县', '150925', '54755', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54756', '1', '54749', '察哈尔右翼前旗', '150926', '54756', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54757', '1', '54749', '察哈尔右翼中旗', '150927', '54757', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54758', '1', '54749', '察哈尔右翼后旗', '150928', '54758', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54759', '1', '54749', '四子王旗', '150929', '54759', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54760', '1', '54749', '丰镇市', '150981', '54760', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54761', '1', '54671', '兴安盟', '152200', '54761', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54762', '1', '54761', '乌兰浩特市', '152201', '54762', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54763', '1', '54761', '阿尔山市', '152202', '54763', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54764', '1', '54761', '科尔沁右翼前旗', '152221', '54764', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54765', '1', '54761', '科尔沁右翼中旗', '152222', '54765', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54766', '1', '54761', '扎赉特旗', '152223', '54766', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54767', '1', '54761', '突泉县', '152224', '54767', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54768', '1', '54671', '锡林郭勒盟', '152500', '54768', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54769', '1', '54768', '二连浩特市', '152501', '54769', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54770', '1', '54768', '锡林浩特市', '152502', '54770', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54771', '1', '54768', '阿巴嘎旗', '152522', '54771', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54772', '1', '54768', '苏尼特左旗', '152523', '54772', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54773', '1', '54768', '苏尼特右旗', '152524', '54773', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54774', '1', '54768', '东乌珠穆沁旗', '152525', '54774', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54775', '1', '54768', '西乌珠穆沁旗', '152526', '54775', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54776', '1', '54768', '太仆寺旗', '152527', '54776', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54777', '1', '54768', '镶黄旗', '152528', '54777', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54778', '1', '54768', '正镶白旗', '152529', '54778', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54779', '1', '54768', '正蓝旗', '152530', '54779', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54780', '1', '54768', '多伦县', '152531', '54780', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54781', '1', '54671', '阿拉善盟', '152900', '54781', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54782', '1', '54781', '阿拉善左旗', '152921', '54782', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54783', '1', '54781', '阿拉善右旗', '152922', '54783', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54784', '1', '54781', '额济纳旗', '152923', '54784', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54785', '1', '54317', '辽宁省', '210000', '54785', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54786', '1', '54785', '沈阳市', '210100', '54786', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54787', '1', '54786', '和平区', '210102', '54787', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54788', '1', '54786', '沈河区', '210103', '54788', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54789', '1', '54786', '大东区', '210104', '54789', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54790', '1', '54786', '皇姑区', '210105', '54790', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54791', '1', '54786', '铁西区', '210106', '54791', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54792', '1', '54786', '苏家屯区', '210111', '54792', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54793', '1', '54786', '东陵区', '210112', '54793', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54794', '1', '54786', '沈北新区', '210113', '54794', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54795', '1', '54786', '于洪区', '210114', '54795', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54796', '1', '54786', '辽中县', '210122', '54796', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54797', '1', '54786', '康平县', '210123', '54797', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54798', '1', '54786', '法库县', '210124', '54798', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54799', '1', '54786', '新民市', '210181', '54799', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54800', '1', '54785', '大连市', '210200', '54800', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54801', '1', '54800', '中山区', '210202', '54801', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54802', '1', '54800', '西岗区', '210203', '54802', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54803', '1', '54800', '沙河口区', '210204', '54803', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54804', '1', '54800', '甘井子区', '210211', '54804', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54805', '1', '54800', '旅顺口区', '210212', '54805', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54806', '1', '54800', '金州区', '210213', '54806', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54807', '1', '54800', '长海县', '210224', '54807', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54808', '1', '54800', '瓦房店市', '210281', '54808', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54809', '1', '54800', '普兰店市', '210282', '54809', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54810', '1', '54800', '庄河市', '210283', '54810', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54811', '1', '54785', '鞍山市', '210300', '54811', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54812', '1', '54811', '铁东区', '210302', '54812', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54813', '1', '54811', '铁西区', '210303', '54813', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54814', '1', '54811', '立山区', '210304', '54814', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54815', '1', '54811', '千山区', '210311', '54815', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54816', '1', '54811', '台安县', '210321', '54816', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54817', '1', '54811', '岫岩满族自治县', '210323', '54817', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54818', '1', '54811', '海城市', '210381', '54818', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54819', '1', '54785', '抚顺市', '210400', '54819', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54820', '1', '54819', '新抚区', '210402', '54820', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54821', '1', '54819', '东洲区', '210403', '54821', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54822', '1', '54819', '望花区', '210404', '54822', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54823', '1', '54819', '顺城区', '210411', '54823', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54824', '1', '54819', '抚顺县', '210421', '54824', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54825', '1', '54819', '新宾满族自治县', '210422', '54825', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54826', '1', '54819', '清原满族自治县', '210423', '54826', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54827', '1', '54785', '本溪市', '210500', '54827', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54828', '1', '54827', '平山区', '210502', '54828', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54829', '1', '54827', '溪湖区', '210503', '54829', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54830', '1', '54827', '明山区', '210504', '54830', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54831', '1', '54827', '南芬区', '210505', '54831', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54832', '1', '54827', '本溪满族自治县', '210521', '54832', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54833', '1', '54827', '桓仁满族自治县', '210522', '54833', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54834', '1', '54785', '丹东市', '210600', '54834', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54835', '1', '54834', '元宝区', '210602', '54835', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54836', '1', '54834', '振兴区', '210603', '54836', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54837', '1', '54834', '振安区', '210604', '54837', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54838', '1', '54834', '宽甸满族自治县', '210624', '54838', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54839', '1', '54834', '东港市', '210681', '54839', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54840', '1', '54834', '凤城市', '210682', '54840', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54841', '1', '54785', '锦州市', '210700', '54841', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54842', '1', '54841', '古塔区', '210702', '54842', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54843', '1', '54841', '凌河区', '210703', '54843', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54844', '1', '54841', '太和区', '210711', '54844', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54845', '1', '54841', '黑山县', '210726', '54845', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54846', '1', '54841', '义县', '210727', '54846', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54847', '1', '54841', '凌海市', '210781', '54847', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54848', '1', '54841', '北镇市', '210782', '54848', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54849', '1', '54785', '营口市', '210800', '54849', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54850', '1', '54849', '站前区', '210802', '54850', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54851', '1', '54849', '西市区', '210803', '54851', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54852', '1', '54849', '鲅鱼圈区', '210804', '54852', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54853', '1', '54849', '老边区', '210811', '54853', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54854', '1', '54849', '盖州市', '210881', '54854', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54855', '1', '54849', '大石桥市', '210882', '54855', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54856', '1', '54785', '阜新市', '210900', '54856', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54857', '1', '54856', '海州区', '210902', '54857', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54858', '1', '54856', '新邱区', '210903', '54858', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54859', '1', '54856', '太平区', '210904', '54859', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54860', '1', '54856', '清河门区', '210905', '54860', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54861', '1', '54856', '细河区', '210911', '54861', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54862', '1', '54856', '阜新蒙古族自治县', '210921', '54862', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54863', '1', '54856', '彰武县', '210922', '54863', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54864', '1', '54785', '辽阳市', '211000', '54864', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54865', '1', '54864', '白塔区', '211002', '54865', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54866', '1', '54864', '文圣区', '211003', '54866', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54867', '1', '54864', '宏伟区', '211004', '54867', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54868', '1', '54864', '弓长岭区', '211005', '54868', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54869', '1', '54864', '太子河区', '211011', '54869', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54870', '1', '54864', '辽阳县', '211021', '54870', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54871', '1', '54864', '灯塔市', '211081', '54871', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54872', '1', '54785', '盘锦市', '211100', '54872', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54873', '1', '54872', '双台子区', '211102', '54873', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54874', '1', '54872', '兴隆台区', '211103', '54874', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54875', '1', '54872', '大洼县', '211121', '54875', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54876', '1', '54872', '盘山县', '211122', '54876', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54877', '1', '54785', '铁岭市', '211200', '54877', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54878', '1', '54877', '银州区', '211202', '54878', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54879', '1', '54877', '清河区', '211204', '54879', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54880', '1', '54877', '铁岭县', '211221', '54880', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54881', '1', '54877', '西丰县', '211223', '54881', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54882', '1', '54877', '昌图县', '211224', '54882', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54883', '1', '54877', '调兵山市', '211281', '54883', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54884', '1', '54877', '开原市', '211282', '54884', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54885', '1', '54785', '朝阳市', '211300', '54885', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54886', '1', '54885', '双塔区', '211302', '54886', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54887', '1', '54885', '龙城区', '211303', '54887', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54888', '1', '54885', '朝阳县', '211321', '54888', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54889', '1', '54885', '建平县', '211322', '54889', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54890', '1', '54885', '喀喇沁左翼蒙古族自治县', '211324', '54890', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54891', '1', '54885', '北票市', '211381', '54891', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54892', '1', '54885', '凌源市', '211382', '54892', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54893', '1', '54785', '葫芦岛市', '211400', '54893', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54894', '1', '54893', '连山区', '211402', '54894', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54895', '1', '54893', '龙港区', '211403', '54895', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54896', '1', '54893', '南票区', '211404', '54896', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54897', '1', '54893', '绥中县', '211421', '54897', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54898', '1', '54893', '建昌县', '211422', '54898', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54899', '1', '54893', '兴城市', '211481', '54899', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54900', '1', '54317', '吉林省', '220000', '54900', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54901', '1', '54900', '长春市', '220100', '54901', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54902', '1', '54901', '南关区', '220102', '54902', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54903', '1', '54901', '宽城区', '220103', '54903', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54904', '1', '54901', '朝阳区', '220104', '54904', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54905', '1', '54901', '二道区', '220105', '54905', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54906', '1', '54901', '绿园区', '220106', '54906', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54907', '1', '54901', '双阳区', '220112', '54907', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54908', '1', '54901', '农安县', '220122', '54908', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54909', '1', '54901', '九台市', '220181', '54909', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54910', '1', '54901', '榆树市', '220182', '54910', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54911', '1', '54901', '德惠市', '220183', '54911', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54912', '1', '54900', '吉林市', '220200', '54912', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54913', '1', '54912', '昌邑区', '220202', '54913', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54914', '1', '54912', '龙潭区', '220203', '54914', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54915', '1', '54912', '船营区', '220204', '54915', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54916', '1', '54912', '丰满区', '220211', '54916', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54917', '1', '54912', '永吉县', '220221', '54917', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54918', '1', '54912', '蛟河市', '220281', '54918', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54919', '1', '54912', '桦甸市', '220282', '54919', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54920', '1', '54912', '舒兰市', '220283', '54920', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54921', '1', '54912', '磐石市', '220284', '54921', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54922', '1', '54900', '四平市', '220300', '54922', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54923', '1', '54922', '铁西区', '220302', '54923', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54924', '1', '54922', '铁东区', '220303', '54924', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54925', '1', '54922', '梨树县', '220322', '54925', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54926', '1', '54922', '伊通满族自治县', '220323', '54926', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54927', '1', '54922', '公主岭市', '220381', '54927', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54928', '1', '54922', '双辽市', '220382', '54928', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54929', '1', '54900', '辽源市', '220400', '54929', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54930', '1', '54929', '龙山区', '220402', '54930', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54931', '1', '54929', '西安区', '220403', '54931', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54932', '1', '54929', '东丰县', '220421', '54932', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54933', '1', '54929', '东辽县', '220422', '54933', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54934', '1', '54900', '通化市', '220500', '54934', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54935', '1', '54934', '东昌区', '220502', '54935', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54936', '1', '54934', '二道江区', '220503', '54936', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54937', '1', '54934', '通化县', '220521', '54937', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54938', '1', '54934', '辉南县', '220523', '54938', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54939', '1', '54934', '柳河县', '220524', '54939', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54940', '1', '54934', '梅河口市', '220581', '54940', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54941', '1', '54934', '集安市', '220582', '54941', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54942', '1', '54900', '白山市', '220600', '54942', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54943', '1', '54942', '八道江区', '220602', '54943', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54944', '1', '54942', '江源区', '220605', '54944', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54945', '1', '54942', '抚松县', '220621', '54945', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54946', '1', '54942', '靖宇县', '220622', '54946', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54947', '1', '54942', '长白朝鲜族自治县', '220623', '54947', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54948', '1', '54942', '临江市', '220681', '54948', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54949', '1', '54900', '松原市', '220700', '54949', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54950', '1', '54949', '宁江区', '220702', '54950', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54951', '1', '54949', '前郭尔罗斯蒙古族自治县', '220721', '54951', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54952', '1', '54949', '长岭县', '220722', '54952', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54953', '1', '54949', '乾安县', '220723', '54953', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54954', '1', '54949', '扶余县', '220724', '54954', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54955', '1', '54900', '白城市', '220800', '54955', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54956', '1', '54955', '洮北区', '220802', '54956', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54957', '1', '54955', '镇赉县', '220821', '54957', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54958', '1', '54955', '通榆县', '220822', '54958', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54959', '1', '54955', '洮南市', '220881', '54959', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54960', '1', '54955', '大安市', '220882', '54960', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54961', '1', '54900', '延边朝鲜族自治州', '222400', '54961', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54962', '1', '54961', '延吉市', '222401', '54962', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54963', '1', '54961', '图们市', '222402', '54963', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54964', '1', '54961', '敦化市', '222403', '54964', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54965', '1', '54961', '珲春市', '222404', '54965', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54966', '1', '54961', '龙井市', '222405', '54966', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54967', '1', '54961', '和龙市', '222406', '54967', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54968', '1', '54961', '汪清县', '222424', '54968', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54969', '1', '54961', '安图县', '222426', '54969', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54970', '1', '54317', '黑龙江省', '230000', '54970', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54971', '1', '54970', '哈尔滨市', '230100', '54971', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54972', '1', '54971', '道里区', '230102', '54972', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54973', '1', '54971', '南岗区', '230103', '54973', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54974', '1', '54971', '道外区', '230104', '54974', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54975', '1', '54971', '平房区', '230108', '54975', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54976', '1', '54971', '松北区', '230109', '54976', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54977', '1', '54971', '香坊区', '230110', '54977', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54978', '1', '54971', '呼兰区', '230111', '54978', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54979', '1', '54971', '阿城区', '230112', '54979', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54980', '1', '54971', '依兰县', '230123', '54980', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54981', '1', '54971', '方正县', '230124', '54981', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54982', '1', '54971', '宾县', '230125', '54982', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54983', '1', '54971', '巴彦县', '230126', '54983', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54984', '1', '54971', '木兰县', '230127', '54984', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54985', '1', '54971', '通河县', '230128', '54985', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54986', '1', '54971', '延寿县', '230129', '54986', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54987', '1', '54971', '双城市', '230182', '54987', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54988', '1', '54971', '尚志市', '230183', '54988', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54989', '1', '54971', '五常市', '230184', '54989', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54990', '1', '54970', '齐齐哈尔市', '230200', '54990', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54991', '1', '54990', '龙沙区', '230202', '54991', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54992', '1', '54990', '建华区', '230203', '54992', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54993', '1', '54990', '铁锋区', '230204', '54993', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54994', '1', '54990', '昂昂溪区', '230205', '54994', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54995', '1', '54990', '富拉尔基区', '230206', '54995', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54996', '1', '54990', '碾子山区', '230207', '54996', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54997', '1', '54990', '梅里斯达斡尔族区', '230208', '54997', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54998', '1', '54990', '龙江县', '230221', '54998', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('54999', '1', '54990', '依安县', '230223', '54999', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55000', '1', '54990', '泰来县', '230224', '55000', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55001', '1', '54990', '甘南县', '230225', '55001', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55002', '1', '54990', '富裕县', '230227', '55002', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55003', '1', '54990', '克山县', '230229', '55003', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55004', '1', '54990', '克东县', '230230', '55004', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55005', '1', '54990', '拜泉县', '230231', '55005', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55006', '1', '54990', '讷河市', '230281', '55006', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55007', '1', '54970', '鸡西市', '230300', '55007', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55008', '1', '55007', '鸡冠区', '230302', '55008', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55009', '1', '55007', '恒山区', '230303', '55009', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55010', '1', '55007', '滴道区', '230304', '55010', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55011', '1', '55007', '梨树区', '230305', '55011', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55012', '1', '55007', '城子河区', '230306', '55012', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55013', '1', '55007', '麻山区', '230307', '55013', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55014', '1', '55007', '鸡东县', '230321', '55014', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55015', '1', '55007', '虎林市', '230381', '55015', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55016', '1', '55007', '密山市', '230382', '55016', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55017', '1', '54970', '鹤岗市', '230400', '55017', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55018', '1', '55017', '向阳区', '230402', '55018', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55019', '1', '55017', '工农区', '230403', '55019', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55020', '1', '55017', '南山区', '230404', '55020', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55021', '1', '55017', '兴安区', '230405', '55021', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55022', '1', '55017', '东山区', '230406', '55022', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55023', '1', '55017', '兴山区', '230407', '55023', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55024', '1', '55017', '萝北县', '230421', '55024', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55025', '1', '55017', '绥滨县', '230422', '55025', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55026', '1', '54970', '双鸭山市', '230500', '55026', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55027', '1', '55026', '尖山区', '230502', '55027', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55028', '1', '55026', '岭东区', '230503', '55028', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55029', '1', '55026', '四方台区', '230505', '55029', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55030', '1', '55026', '宝山区', '230506', '55030', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55031', '1', '55026', '集贤县', '230521', '55031', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55032', '1', '55026', '友谊县', '230522', '55032', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55033', '1', '55026', '宝清县', '230523', '55033', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55034', '1', '55026', '饶河县', '230524', '55034', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55035', '1', '54970', '大庆市', '230600', '55035', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55036', '1', '55035', '萨尔图区', '230602', '55036', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55037', '1', '55035', '龙凤区', '230603', '55037', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55038', '1', '55035', '让胡路区', '230604', '55038', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55039', '1', '55035', '红岗区', '230605', '55039', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55040', '1', '55035', '大同区', '230606', '55040', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55041', '1', '55035', '肇州县', '230621', '55041', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55042', '1', '55035', '肇源县', '230622', '55042', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55043', '1', '55035', '林甸县', '230623', '55043', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55044', '1', '55035', '杜尔伯特蒙古族自治县', '230624', '55044', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55045', '1', '54970', '伊春市', '230700', '55045', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55046', '1', '55045', '伊春区', '230702', '55046', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55047', '1', '55045', '南岔区', '230703', '55047', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55048', '1', '55045', '友好区', '230704', '55048', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55049', '1', '55045', '西林区', '230705', '55049', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55050', '1', '55045', '翠峦区', '230706', '55050', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55051', '1', '55045', '新青区', '230707', '55051', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55052', '1', '55045', '美溪区', '230708', '55052', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55053', '1', '55045', '金山屯区', '230709', '55053', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55054', '1', '55045', '五营区', '230710', '55054', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55055', '1', '55045', '乌马河区', '230711', '55055', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55056', '1', '55045', '汤旺河区', '230712', '55056', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55057', '1', '55045', '带岭区', '230713', '55057', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55058', '1', '55045', '乌伊岭区', '230714', '55058', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55059', '1', '55045', '红星区', '230715', '55059', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55060', '1', '55045', '上甘岭区', '230716', '55060', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55061', '1', '55045', '嘉荫县', '230722', '55061', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55062', '1', '55045', '铁力市', '230781', '55062', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55063', '1', '54970', '佳木斯市', '230800', '55063', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55064', '1', '55063', '向阳区', '230803', '55064', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55065', '1', '55063', '前进区', '230804', '55065', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55066', '1', '55063', '东风区', '230805', '55066', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55067', '1', '55063', '郊区', '230811', '55067', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55068', '1', '55063', '桦南县', '230822', '55068', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55069', '1', '55063', '桦川县', '230826', '55069', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55070', '1', '55063', '汤原县', '230828', '55070', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55071', '1', '55063', '抚远县', '230833', '55071', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55072', '1', '55063', '同江市', '230881', '55072', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55073', '1', '55063', '富锦市', '230882', '55073', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55074', '1', '54970', '七台河市', '230900', '55074', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55075', '1', '55074', '新兴区', '230902', '55075', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55076', '1', '55074', '桃山区', '230903', '55076', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55077', '1', '55074', '茄子河区', '230904', '55077', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55078', '1', '55074', '勃利县', '230921', '55078', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55079', '1', '54970', '牡丹江市', '231000', '55079', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55080', '1', '55079', '东安区', '231002', '55080', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55081', '1', '55079', '阳明区', '231003', '55081', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55082', '1', '55079', '爱民区', '231004', '55082', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55083', '1', '55079', '西安区', '231005', '55083', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55084', '1', '55079', '东宁县', '231024', '55084', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55085', '1', '55079', '林口县', '231025', '55085', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55086', '1', '55079', '绥芬河市', '231081', '55086', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55087', '1', '55079', '海林市', '231083', '55087', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55088', '1', '55079', '宁安市', '231084', '55088', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55089', '1', '55079', '穆棱市', '231085', '55089', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55090', '1', '54970', '黑河市', '231100', '55090', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55091', '1', '55090', '爱辉区', '231102', '55091', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55092', '1', '55090', '嫩江县', '231121', '55092', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55093', '1', '55090', '逊克县', '231123', '55093', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55094', '1', '55090', '孙吴县', '231124', '55094', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55095', '1', '55090', '北安市', '231181', '55095', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55096', '1', '55090', '五大连池市', '231182', '55096', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55097', '1', '54970', '绥化市', '231200', '55097', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55098', '1', '55097', '北林区', '231202', '55098', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55099', '1', '55097', '望奎县', '231221', '55099', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55100', '1', '55097', '兰西县', '231222', '55100', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55101', '1', '55097', '青冈县', '231223', '55101', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55102', '1', '55097', '庆安县', '231224', '55102', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55103', '1', '55097', '明水县', '231225', '55103', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55104', '1', '55097', '绥棱县', '231226', '55104', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55105', '1', '55097', '安达市', '231281', '55105', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55106', '1', '55097', '肇东市', '231282', '55106', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55107', '1', '55097', '海伦市', '231283', '55107', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55108', '1', '54970', '大兴安岭地区', '232700', '55108', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55109', '1', '55108', '加格达奇区', '232701', '55109', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55110', '1', '55108', '松岭区', '232702', '55110', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55111', '1', '55108', '新林区', '232703', '55111', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55112', '1', '55108', '呼中区', '232704', '55112', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55113', '1', '55108', '呼玛县', '232721', '55113', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55114', '1', '55108', '塔河县', '232722', '55114', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55115', '1', '55108', '漠河县', '232723', '55115', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55116', '1', '57619', '上海市', '310100', '55116', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55117', '1', '55116', '黄浦区', '310101', '55117', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55118', '1', '55116', '卢湾区', '310103', '55118', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55119', '1', '55116', '徐汇区', '310104', '55119', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55120', '1', '55116', '长宁区', '310105', '55120', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55121', '1', '55116', '静安区', '310106', '55121', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55122', '1', '55116', '普陀区', '310107', '55122', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55123', '1', '55116', '闸北区', '310108', '55123', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55124', '1', '55116', '虹口区', '310109', '55124', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55125', '1', '55116', '杨浦区', '310110', '55125', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55126', '1', '55116', '闵行区', '310112', '55126', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55127', '1', '55116', '宝山区', '310113', '55127', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55128', '1', '55116', '嘉定区', '310114', '55128', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55129', '1', '55116', '浦东新区', '310115', '55129', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55130', '1', '55116', '金山区', '310116', '55130', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55131', '1', '55116', '松江区', '310117', '55131', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55132', '1', '55116', '青浦区', '310118', '55132', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55133', '1', '55116', '南汇区', '310119', '55133', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55134', '1', '55116', '奉贤区', '310120', '55134', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55135', '1', '55116', '崇明县', '310230', '55135', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55136', '1', '54317', '江苏省', '320000', '55136', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55137', '1', '55136', '南京市', '320100', '55137', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55138', '1', '55137', '玄武区', '320102', '55138', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55139', '1', '55137', '白下区', '320103', '55139', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55140', '1', '55137', '秦淮区', '320104', '55140', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55141', '1', '55137', '建邺区', '320105', '55141', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55142', '1', '55137', '鼓楼区', '320106', '55142', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55143', '1', '55137', '下关区', '320107', '55143', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55144', '1', '55137', '浦口区', '320111', '55144', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55145', '1', '55137', '栖霞区', '320113', '55145', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55146', '1', '55137', '雨花台区', '320114', '55146', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55147', '1', '55137', '江宁区', '320115', '55147', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55148', '1', '55137', '六合区', '320116', '55148', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55149', '1', '55137', '溧水县', '320124', '55149', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55150', '1', '55137', '高淳县', '320125', '55150', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55151', '1', '55136', '无锡市', '320200', '55151', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55152', '1', '55151', '崇安区', '320202', '55152', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55153', '1', '55151', '南长区', '320203', '55153', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55154', '1', '55151', '北塘区', '320204', '55154', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55155', '1', '55151', '锡山区', '320205', '55155', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55156', '1', '55151', '惠山区', '320206', '55156', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55157', '1', '55151', '滨湖区', '320211', '55157', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55158', '1', '55151', '江阴市', '320281', '55158', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55159', '1', '55151', '宜兴市', '320282', '55159', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55160', '1', '55136', '徐州市', '320300', '55160', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55161', '1', '55160', '鼓楼区', '320302', '55161', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55162', '1', '55160', '云龙区', '320303', '55162', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55163', '1', '55160', '九里区', '320304', '55163', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55164', '1', '55160', '贾汪区', '320305', '55164', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55165', '1', '55160', '泉山区', '320311', '55165', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55166', '1', '55160', '丰县', '320321', '55166', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55167', '1', '55160', '沛县', '320322', '55167', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55168', '1', '55160', '铜山县', '320323', '55168', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55169', '1', '55160', '睢宁县', '320324', '55169', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55170', '1', '55160', '新沂市', '320381', '55170', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55171', '1', '55160', '邳州市', '320382', '55171', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55172', '1', '55136', '常州市', '320400', '55172', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55173', '1', '55172', '天宁区', '320402', '55173', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55174', '1', '55172', '钟楼区', '320404', '55174', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55175', '1', '55172', '戚墅堰区', '320405', '55175', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55176', '1', '55172', '新北区', '320411', '55176', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55177', '1', '55172', '武进区', '320412', '55177', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55178', '1', '55172', '溧阳市', '320481', '55178', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55179', '1', '55172', '金坛市', '320482', '55179', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55180', '1', '55136', '苏州市', '320500', '55180', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55181', '1', '55180', '沧浪区', '320502', '55181', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55182', '1', '55180', '平江区', '320503', '55182', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55183', '1', '55180', '金阊区', '320504', '55183', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55184', '1', '55180', '虎丘区', '320505', '55184', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55185', '1', '55180', '吴中区', '320506', '55185', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55186', '1', '55180', '相城区', '320507', '55186', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55187', '1', '55180', '常熟市', '320581', '55187', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55188', '1', '55180', '张家港市', '320582', '55188', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55189', '1', '55180', '昆山市', '320583', '55189', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55190', '1', '55180', '吴江市', '320584', '55190', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55191', '1', '55180', '太仓市', '320585', '55191', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55192', '1', '55136', '南通市', '320600', '55192', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55193', '1', '55192', '崇川区', '320602', '55193', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55194', '1', '55192', '港闸区', '320611', '55194', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55195', '1', '55192', '海安县', '320621', '55195', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55196', '1', '55192', '如东县', '320623', '55196', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55197', '1', '55192', '启东市', '320681', '55197', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55198', '1', '55192', '如皋市', '320682', '55198', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55199', '1', '55192', '通州市', '320683', '55199', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55200', '1', '55192', '海门市', '320684', '55200', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55201', '1', '55136', '连云港市', '320700', '55201', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55202', '1', '55201', '连云区', '320703', '55202', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55203', '1', '55201', '新浦区', '320705', '55203', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55204', '1', '55201', '海州区', '320706', '55204', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55205', '1', '55201', '赣榆县', '320721', '55205', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55206', '1', '55201', '东海县', '320722', '55206', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55207', '1', '55201', '灌云县', '320723', '55207', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55208', '1', '55201', '灌南县', '320724', '55208', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55209', '1', '55136', '淮安市', '320800', '55209', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55210', '1', '55209', '清河区', '320802', '55210', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55211', '1', '55209', '楚州区', '320803', '55211', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55212', '1', '55209', '淮阴区', '320804', '55212', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55213', '1', '55209', '清浦区', '320811', '55213', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55214', '1', '55209', '涟水县', '320826', '55214', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55215', '1', '55209', '洪泽县', '320829', '55215', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55216', '1', '55209', '盱眙县', '320830', '55216', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55217', '1', '55209', '金湖县', '320831', '55217', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55218', '1', '55136', '盐城市', '320900', '55218', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55219', '1', '55218', '亭湖区', '320902', '55219', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55220', '1', '55218', '盐都区', '320903', '55220', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55221', '1', '55218', '响水县', '320921', '55221', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55222', '1', '55218', '滨海县', '320922', '55222', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55223', '1', '55218', '阜宁县', '320923', '55223', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55224', '1', '55218', '射阳县', '320924', '55224', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55225', '1', '55218', '建湖县', '320925', '55225', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55226', '1', '55218', '东台市', '320981', '55226', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55227', '1', '55218', '大丰市', '320982', '55227', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55228', '1', '55136', '扬州市', '321000', '55228', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55229', '1', '55228', '广陵区', '321002', '55229', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55230', '1', '55228', '邗江区', '321003', '55230', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55231', '1', '55228', '维扬区', '321011', '55231', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55232', '1', '55228', '宝应县', '321023', '55232', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55233', '1', '55228', '仪征市', '321081', '55233', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55234', '1', '55228', '高邮市', '321084', '55234', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55235', '1', '55228', '江都市', '321088', '55235', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55236', '1', '55136', '镇江市', '321100', '55236', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55237', '1', '55236', '京口区', '321102', '55237', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55238', '1', '55236', '润州区', '321111', '55238', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55239', '1', '55236', '丹徒区', '321112', '55239', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55240', '1', '55236', '丹阳市', '321181', '55240', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55241', '1', '55236', '扬中市', '321182', '55241', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55242', '1', '55236', '句容市', '321183', '55242', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55243', '1', '55136', '泰州市', '321200', '55243', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55244', '1', '55243', '海陵区', '321202', '55244', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55245', '1', '55243', '高港区', '321203', '55245', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55246', '1', '55243', '兴化市', '321281', '55246', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55247', '1', '55243', '靖江市', '321282', '55247', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55248', '1', '55243', '泰兴市', '321283', '55248', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55249', '1', '55243', '姜堰市', '321284', '55249', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55250', '1', '55136', '宿迁市', '321300', '55250', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55251', '1', '55250', '宿城区', '321302', '55251', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55252', '1', '55250', '宿豫区', '321311', '55252', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55253', '1', '55250', '沭阳县', '321322', '55253', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55254', '1', '55250', '泗阳县', '321323', '55254', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55255', '1', '55250', '泗洪县', '321324', '55255', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55256', '1', '54317', '浙江省', '330000', '55256', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55257', '1', '55256', '杭州市', '330100', '55257', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55258', '1', '55257', '上城区', '330102', '55258', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55259', '1', '55257', '下城区', '330103', '55259', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55260', '1', '55257', '江干区', '330104', '55260', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55261', '1', '55257', '拱墅区', '330105', '55261', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55262', '1', '55257', '西湖区', '330106', '55262', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55263', '1', '55257', '滨江区', '330108', '55263', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55264', '1', '55257', '萧山区', '330109', '55264', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55265', '1', '55257', '余杭区', '330110', '55265', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55266', '1', '55257', '桐庐县', '330122', '55266', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55267', '1', '55257', '淳安县', '330127', '55267', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55268', '1', '55257', '建德市', '330182', '55268', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55269', '1', '55257', '富阳市', '330183', '55269', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55270', '1', '55257', '临安市', '330185', '55270', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55271', '1', '55256', '宁波市', '330200', '55271', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55272', '1', '55271', '海曙区', '330203', '55272', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55273', '1', '55271', '江东区', '330204', '55273', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55274', '1', '55271', '江北区', '330205', '55274', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55275', '1', '55271', '北仑区', '330206', '55275', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55276', '1', '55271', '镇海区', '330211', '55276', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55277', '1', '55271', '鄞州区', '330212', '55277', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55278', '1', '55271', '象山县', '330225', '55278', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55279', '1', '55271', '宁海县', '330226', '55279', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55280', '1', '55271', '余姚市', '330281', '55280', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55281', '1', '55271', '慈溪市', '330282', '55281', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55282', '1', '55271', '奉化市', '330283', '55282', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55283', '1', '55256', '温州市', '330300', '55283', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55284', '1', '55283', '鹿城区', '330302', '55284', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55285', '1', '55283', '龙湾区', '330303', '55285', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55286', '1', '55283', '瓯海区', '330304', '55286', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55287', '1', '55283', '洞头县', '330322', '55287', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55288', '1', '55283', '永嘉县', '330324', '55288', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55289', '1', '55283', '平阳县', '330326', '55289', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55290', '1', '55283', '苍南县', '330327', '55290', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55291', '1', '55283', '文成县', '330328', '55291', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55292', '1', '55283', '泰顺县', '330329', '55292', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55293', '1', '55283', '瑞安市', '330381', '55293', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55294', '1', '55283', '乐清市', '330382', '55294', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55295', '1', '55256', '嘉兴市', '330400', '55295', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55296', '1', '55295', '南湖区', '330402', '55296', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55297', '1', '55295', '秀洲区', '330411', '55297', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55298', '1', '55295', '嘉善县', '330421', '55298', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55299', '1', '55295', '海盐县', '330424', '55299', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55300', '1', '55295', '海宁市', '330481', '55300', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55301', '1', '55295', '平湖市', '330482', '55301', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55302', '1', '55295', '桐乡市', '330483', '55302', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55303', '1', '55256', '湖州市', '330500', '55303', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55304', '1', '55303', '吴兴区', '330502', '55304', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55305', '1', '55303', '南浔区', '330503', '55305', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55306', '1', '55303', '德清县', '330521', '55306', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55307', '1', '55303', '长兴县', '330522', '55307', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55308', '1', '55303', '安吉县', '330523', '55308', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55309', '1', '55256', '绍兴市', '330600', '55309', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55310', '1', '55309', '越城区', '330602', '55310', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55311', '1', '55309', '绍兴县', '330621', '55311', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55312', '1', '55309', '新昌县', '330624', '55312', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55313', '1', '55309', '诸暨市', '330681', '55313', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55314', '1', '55309', '上虞市', '330682', '55314', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55315', '1', '55309', '嵊州市', '330683', '55315', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55316', '1', '55256', '金华市', '330700', '55316', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55317', '1', '55316', '婺城区', '330702', '55317', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55318', '1', '55316', '金东区', '330703', '55318', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55319', '1', '55316', '武义县', '330723', '55319', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55320', '1', '55316', '浦江县', '330726', '55320', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55321', '1', '55316', '磐安县', '330727', '55321', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55322', '1', '55316', '兰溪市', '330781', '55322', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55323', '1', '55316', '义乌市', '330782', '55323', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55324', '1', '55316', '东阳市', '330783', '55324', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55325', '1', '55316', '永康市', '330784', '55325', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55326', '1', '55256', '衢州市', '330800', '55326', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55327', '1', '55326', '柯城区', '330802', '55327', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55328', '1', '55326', '衢江区', '330803', '55328', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55329', '1', '55326', '常山县', '330822', '55329', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55330', '1', '55326', '开化县', '330824', '55330', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55331', '1', '55326', '龙游县', '330825', '55331', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55332', '1', '55326', '江山市', '330881', '55332', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55333', '1', '55256', '舟山市', '330900', '55333', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55334', '1', '55333', '定海区', '330902', '55334', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55335', '1', '55333', '普陀区', '330903', '55335', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55336', '1', '55333', '岱山县', '330921', '55336', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55337', '1', '55333', '嵊泗县', '330922', '55337', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55338', '1', '55256', '台州市', '331000', '55338', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55339', '1', '55338', '椒江区', '331002', '55339', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55340', '1', '55338', '黄岩区', '331003', '55340', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55341', '1', '55338', '路桥区', '331004', '55341', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55342', '1', '55338', '玉环县', '331021', '55342', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55343', '1', '55338', '三门县', '331022', '55343', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55344', '1', '55338', '天台县', '331023', '55344', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55345', '1', '55338', '仙居县', '331024', '55345', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55346', '1', '55338', '温岭市', '331081', '55346', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55347', '1', '55338', '临海市', '331082', '55347', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55348', '1', '55256', '丽水市', '331100', '55348', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55349', '1', '55348', '莲都区', '331102', '55349', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55350', '1', '55348', '青田县', '331121', '55350', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55351', '1', '55348', '缙云县', '331122', '55351', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55352', '1', '55348', '遂昌县', '331123', '55352', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55353', '1', '55348', '松阳县', '331124', '55353', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55354', '1', '55348', '云和县', '331125', '55354', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55355', '1', '55348', '庆元县', '331126', '55355', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55356', '1', '55348', '景宁畲族自治县', '331127', '55356', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55357', '1', '55348', '龙泉市', '331181', '55357', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55358', '1', '54317', '安徽省', '340000', '55358', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55359', '1', '55358', '合肥市', '340100', '55359', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55360', '1', '55359', '瑶海区', '340102', '55360', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55361', '1', '55359', '庐阳区', '340103', '55361', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55362', '1', '55359', '蜀山区', '340104', '55362', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55363', '1', '55359', '包河区', '340111', '55363', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55364', '1', '55359', '长丰县', '340121', '55364', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55365', '1', '55359', '肥东县', '340122', '55365', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55366', '1', '55359', '肥西县', '340123', '55366', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55367', '1', '55358', '芜湖市', '340200', '55367', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55368', '1', '55367', '镜湖区', '340202', '55368', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55369', '1', '55367', '弋江区', '340203', '55369', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55370', '1', '55367', '鸠江区', '340207', '55370', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55371', '1', '55367', '三山区', '340208', '55371', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55372', '1', '55367', '芜湖县', '340221', '55372', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55373', '1', '55367', '繁昌县', '340222', '55373', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55374', '1', '55367', '南陵县', '340223', '55374', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55375', '1', '55358', '蚌埠市', '340300', '55375', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55376', '1', '55375', '龙子湖区', '340302', '55376', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55377', '1', '55375', '蚌山区', '340303', '55377', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55378', '1', '55375', '禹会区', '340304', '55378', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55379', '1', '55375', '淮上区', '340311', '55379', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55380', '1', '55375', '怀远县', '340321', '55380', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55381', '1', '55375', '五河县', '340322', '55381', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55382', '1', '55375', '固镇县', '340323', '55382', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55383', '1', '55358', '淮南市', '340400', '55383', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55384', '1', '55383', '大通区', '340402', '55384', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55385', '1', '55383', '田家庵区', '340403', '55385', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55386', '1', '55383', '谢家集区', '340404', '55386', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55387', '1', '55383', '八公山区', '340405', '55387', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55388', '1', '55383', '潘集区', '340406', '55388', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55389', '1', '55383', '凤台县', '340421', '55389', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55390', '1', '55358', '马鞍山市', '340500', '55390', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55391', '1', '55390', '金家庄区', '340502', '55391', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55392', '1', '55390', '花山区', '340503', '55392', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55393', '1', '55390', '雨山区', '340504', '55393', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55394', '1', '55390', '当涂县', '340521', '55394', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55395', '1', '55358', '淮北市', '340600', '55395', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55396', '1', '55395', '杜集区', '340602', '55396', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55397', '1', '55395', '相山区', '340603', '55397', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55398', '1', '55395', '烈山区', '340604', '55398', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55399', '1', '55395', '濉溪县', '340621', '55399', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55400', '1', '55358', '铜陵市', '340700', '55400', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55401', '1', '55400', '铜官山区', '340702', '55401', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55402', '1', '55400', '狮子山区', '340703', '55402', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55403', '1', '55400', '郊区', '340711', '55403', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55404', '1', '55400', '铜陵县', '340721', '55404', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55405', '1', '55358', '安庆市', '340800', '55405', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55406', '1', '55405', '迎江区', '340802', '55406', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55407', '1', '55405', '大观区', '340803', '55407', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55408', '1', '55405', '宜秀区', '340811', '55408', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55409', '1', '55405', '怀宁县', '340822', '55409', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55410', '1', '55405', '枞阳县', '340823', '55410', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55411', '1', '55405', '潜山县', '340824', '55411', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55412', '1', '55405', '太湖县', '340825', '55412', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55413', '1', '55405', '宿松县', '340826', '55413', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55414', '1', '55405', '望江县', '340827', '55414', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55415', '1', '55405', '岳西县', '340828', '55415', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55416', '1', '55405', '桐城市', '340881', '55416', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55417', '1', '55358', '黄山市', '341000', '55417', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55418', '1', '55417', '屯溪区', '341002', '55418', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55419', '1', '55417', '黄山区', '341003', '55419', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55420', '1', '55417', '徽州区', '341004', '55420', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55421', '1', '55417', '歙县', '341021', '55421', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55422', '1', '55417', '休宁县', '341022', '55422', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55423', '1', '55417', '黟县', '341023', '55423', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55424', '1', '55417', '祁门县', '341024', '55424', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55425', '1', '55358', '滁州市', '341100', '55425', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55426', '1', '55425', '琅琊区', '341102', '55426', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55427', '1', '55425', '南谯区', '341103', '55427', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55428', '1', '55425', '来安县', '341122', '55428', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55429', '1', '55425', '全椒县', '341124', '55429', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55430', '1', '55425', '定远县', '341125', '55430', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55431', '1', '55425', '凤阳县', '341126', '55431', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55432', '1', '55425', '天长市', '341181', '55432', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55433', '1', '55425', '明光市', '341182', '55433', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55434', '1', '55358', '阜阳市', '341200', '55434', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55435', '1', '55434', '颍州区', '341202', '55435', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55436', '1', '55434', '颍东区', '341203', '55436', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55437', '1', '55434', '颍泉区', '341204', '55437', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55438', '1', '55434', '临泉县', '341221', '55438', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55439', '1', '55434', '太和县', '341222', '55439', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55440', '1', '55434', '阜南县', '341225', '55440', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55441', '1', '55434', '颍上县', '341226', '55441', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55442', '1', '55434', '界首市', '341282', '55442', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55443', '1', '55358', '宿州市', '341300', '55443', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55444', '1', '55443', '埇桥区', '341302', '55444', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55445', '1', '55443', '砀山县', '341321', '55445', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55446', '1', '55443', '萧县', '341322', '55446', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55447', '1', '55443', '灵璧县', '341323', '55447', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55448', '1', '55443', '泗县', '341324', '55448', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55449', '1', '55358', '巢湖市', '341400', '55449', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55450', '1', '55449', '居巢区', '341402', '55450', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55451', '1', '55449', '庐江县', '341421', '55451', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55452', '1', '55449', '无为县', '341422', '55452', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55453', '1', '55449', '含山县', '341423', '55453', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55454', '1', '55449', '和县', '341424', '55454', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55455', '1', '55358', '六安市', '341500', '55455', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55456', '1', '55455', '金安区', '341502', '55456', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55457', '1', '55455', '裕安区', '341503', '55457', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55458', '1', '55455', '寿县', '341521', '55458', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55459', '1', '55455', '霍邱县', '341522', '55459', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55460', '1', '55455', '舒城县', '341523', '55460', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55461', '1', '55455', '金寨县', '341524', '55461', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55462', '1', '55455', '霍山县', '341525', '55462', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55463', '1', '55358', '亳州市', '341600', '55463', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55464', '1', '55463', '谯城区', '341602', '55464', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55465', '1', '55463', '涡阳县', '341621', '55465', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55466', '1', '55463', '蒙城县', '341622', '55466', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55467', '1', '55463', '利辛县', '341623', '55467', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55468', '1', '55358', '池州市', '341700', '55468', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55469', '1', '55468', '贵池区', '341702', '55469', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55470', '1', '55468', '东至县', '341721', '55470', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55471', '1', '55468', '石台县', '341722', '55471', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55472', '1', '55468', '青阳县', '341723', '55472', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55473', '1', '55358', '宣城市', '341800', '55473', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55474', '1', '55473', '宣州区', '341802', '55474', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55475', '1', '55473', '郎溪县', '341821', '55475', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55476', '1', '55473', '广德县', '341822', '55476', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55477', '1', '55473', '泾县', '341823', '55477', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55478', '1', '55473', '绩溪县', '341824', '55478', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55479', '1', '55473', '旌德县', '341825', '55479', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55480', '1', '55473', '宁国市', '341881', '55480', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55481', '1', '54317', '福建省', '350000', '55481', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55482', '1', '55481', '福州市', '350100', '55482', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55483', '1', '55482', '鼓楼区', '350102', '55483', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55484', '1', '55482', '台江区', '350103', '55484', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55485', '1', '55482', '仓山区', '350104', '55485', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55486', '1', '55482', '马尾区', '350105', '55486', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55487', '1', '55482', '晋安区', '350111', '55487', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55488', '1', '55482', '闽侯县', '350121', '55488', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55489', '1', '55482', '连江县', '350122', '55489', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55490', '1', '55482', '罗源县', '350123', '55490', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55491', '1', '55482', '闽清县', '350124', '55491', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55492', '1', '55482', '永泰县', '350125', '55492', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55493', '1', '55482', '平潭县', '350128', '55493', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55494', '1', '55482', '福清市', '350181', '55494', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55495', '1', '55482', '长乐市', '350182', '55495', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55496', '1', '55481', '厦门市', '350200', '55496', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55497', '1', '55496', '思明区', '350203', '55497', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55498', '1', '55496', '海沧区', '350205', '55498', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55499', '1', '55496', '湖里区', '350206', '55499', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55500', '1', '55496', '集美区', '350211', '55500', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55501', '1', '55496', '同安区', '350212', '55501', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55502', '1', '55496', '翔安区', '350213', '55502', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55503', '1', '55481', '莆田市', '350300', '55503', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55504', '1', '55503', '城厢区', '350302', '55504', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55505', '1', '55503', '涵江区', '350303', '55505', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55506', '1', '55503', '荔城区', '350304', '55506', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55507', '1', '55503', '秀屿区', '350305', '55507', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55508', '1', '55503', '仙游县', '350322', '55508', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55509', '1', '55481', '三明市', '350400', '55509', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55510', '1', '55509', '梅列区', '350402', '55510', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55511', '1', '55509', '三元区', '350403', '55511', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55512', '1', '55509', '明溪县', '350421', '55512', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55513', '1', '55509', '清流县', '350423', '55513', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55514', '1', '55509', '宁化县', '350424', '55514', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55515', '1', '55509', '大田县', '350425', '55515', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55516', '1', '55509', '尤溪县', '350426', '55516', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55517', '1', '55509', '沙县', '350427', '55517', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55518', '1', '55509', '将乐县', '350428', '55518', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55519', '1', '55509', '泰宁县', '350429', '55519', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55520', '1', '55509', '建宁县', '350430', '55520', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55521', '1', '55509', '永安市', '350481', '55521', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55522', '1', '55481', '泉州市', '350500', '55522', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55523', '1', '55522', '鲤城区', '350502', '55523', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55524', '1', '55522', '丰泽区', '350503', '55524', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55525', '1', '55522', '洛江区', '350504', '55525', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55526', '1', '55522', '泉港区', '350505', '55526', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55527', '1', '55522', '惠安县', '350521', '55527', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55528', '1', '55522', '安溪县', '350524', '55528', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55529', '1', '55522', '永春县', '350525', '55529', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55530', '1', '55522', '德化县', '350526', '55530', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55531', '1', '55522', '金门县', '350527', '55531', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55532', '1', '55522', '石狮市', '350581', '55532', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55533', '1', '55522', '晋江市', '350582', '55533', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55534', '1', '55522', '南安市', '350583', '55534', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55535', '1', '55481', '漳州市', '350600', '55535', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55536', '1', '55535', '芗城区', '350602', '55536', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55537', '1', '55535', '龙文区', '350603', '55537', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55538', '1', '55535', '云霄县', '350622', '55538', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55539', '1', '55535', '漳浦县', '350623', '55539', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55540', '1', '55535', '诏安县', '350624', '55540', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55541', '1', '55535', '长泰县', '350625', '55541', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55542', '1', '55535', '东山县', '350626', '55542', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55543', '1', '55535', '南靖县', '350627', '55543', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55544', '1', '55535', '平和县', '350628', '55544', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55545', '1', '55535', '华安县', '350629', '55545', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55546', '1', '55535', '龙海市', '350681', '55546', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55547', '1', '55481', '南平市', '350700', '55547', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55548', '1', '55547', '延平区', '350702', '55548', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55549', '1', '55547', '顺昌县', '350721', '55549', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55550', '1', '55547', '浦城县', '350722', '55550', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55551', '1', '55547', '光泽县', '350723', '55551', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55552', '1', '55547', '松溪县', '350724', '55552', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55553', '1', '55547', '政和县', '350725', '55553', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55554', '1', '55547', '邵武市', '350781', '55554', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55555', '1', '55547', '武夷山市', '350782', '55555', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55556', '1', '55547', '建瓯市', '350783', '55556', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55557', '1', '55547', '建阳市', '350784', '55557', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55558', '1', '55481', '龙岩市', '350800', '55558', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55559', '1', '55558', '新罗区', '350802', '55559', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55560', '1', '55558', '长汀县', '350821', '55560', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55561', '1', '55558', '永定县', '350822', '55561', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55562', '1', '55558', '上杭县', '350823', '55562', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55563', '1', '55558', '武平县', '350824', '55563', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55564', '1', '55558', '连城县', '350825', '55564', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55565', '1', '55558', '漳平市', '350881', '55565', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55566', '1', '55481', '宁德市', '350900', '55566', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55567', '1', '55566', '蕉城区', '350902', '55567', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55568', '1', '55566', '霞浦县', '350921', '55568', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55569', '1', '55566', '古田县', '350922', '55569', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55570', '1', '55566', '屏南县', '350923', '55570', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55571', '1', '55566', '寿宁县', '350924', '55571', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55572', '1', '55566', '周宁县', '350925', '55572', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55573', '1', '55566', '柘荣县', '350926', '55573', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55574', '1', '55566', '福安市', '350981', '55574', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55575', '1', '55566', '福鼎市', '350982', '55575', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55576', '1', '54317', '江西省', '360000', '55576', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55577', '1', '55576', '南昌市', '360100', '55577', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55578', '1', '55577', '东湖区', '360102', '55578', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55579', '1', '55577', '西湖区', '360103', '55579', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55580', '1', '55577', '青云谱区', '360104', '55580', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55581', '1', '55577', '湾里区', '360105', '55581', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55582', '1', '55577', '青山湖区', '360111', '55582', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55583', '1', '55577', '南昌县', '360121', '55583', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55584', '1', '55577', '新建县', '360122', '55584', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55585', '1', '55577', '安义县', '360123', '55585', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55586', '1', '55577', '进贤县', '360124', '55586', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55587', '1', '55576', '景德镇市', '360200', '55587', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55588', '1', '55587', '昌江区', '360202', '55588', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55589', '1', '55587', '珠山区', '360203', '55589', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55590', '1', '55587', '浮梁县', '360222', '55590', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55591', '1', '55587', '乐平市', '360281', '55591', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55592', '1', '55576', '萍乡市', '360300', '55592', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55593', '1', '55592', '安源区', '360302', '55593', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55594', '1', '55592', '湘东区', '360313', '55594', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55595', '1', '55592', '莲花县', '360321', '55595', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55596', '1', '55592', '上栗县', '360322', '55596', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55597', '1', '55592', '芦溪县', '360323', '55597', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55598', '1', '55576', '九江市', '360400', '55598', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55599', '1', '55598', '庐山区', '360402', '55599', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55600', '1', '55598', '浔阳区', '360403', '55600', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55601', '1', '55598', '九江县', '360421', '55601', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55602', '1', '55598', '武宁县', '360423', '55602', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55603', '1', '55598', '修水县', '360424', '55603', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55604', '1', '55598', '永修县', '360425', '55604', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55605', '1', '55598', '德安县', '360426', '55605', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55606', '1', '55598', '星子县', '360427', '55606', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55607', '1', '55598', '都昌县', '360428', '55607', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55608', '1', '55598', '湖口县', '360429', '55608', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55609', '1', '55598', '彭泽县', '360430', '55609', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55610', '1', '55598', '瑞昌市', '360481', '55610', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55611', '1', '55576', '新余市', '360500', '55611', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55612', '1', '55611', '渝水区', '360502', '55612', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55613', '1', '55611', '分宜县', '360521', '55613', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55614', '1', '55576', '鹰潭市', '360600', '55614', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55615', '1', '55614', '月湖区', '360602', '55615', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55616', '1', '55614', '余江县', '360622', '55616', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55617', '1', '55614', '贵溪市', '360681', '55617', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55618', '1', '55576', '赣州市', '360700', '55618', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55619', '1', '55618', '章贡区', '360702', '55619', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55620', '1', '55618', '赣县', '360721', '55620', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55621', '1', '55618', '信丰县', '360722', '55621', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55622', '1', '55618', '大余县', '360723', '55622', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55623', '1', '55618', '上犹县', '360724', '55623', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55624', '1', '55618', '崇义县', '360725', '55624', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55625', '1', '55618', '安远县', '360726', '55625', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55626', '1', '55618', '龙南县', '360727', '55626', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55627', '1', '55618', '定南县', '360728', '55627', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55628', '1', '55618', '全南县', '360729', '55628', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55629', '1', '55618', '宁都县', '360730', '55629', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55630', '1', '55618', '于都县', '360731', '55630', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55631', '1', '55618', '兴国县', '360732', '55631', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55632', '1', '55618', '会昌县', '360733', '55632', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55633', '1', '55618', '寻乌县', '360734', '55633', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55634', '1', '55618', '石城县', '360735', '55634', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55635', '1', '55618', '瑞金市', '360781', '55635', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55636', '1', '55618', '南康市', '360782', '55636', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55637', '1', '55576', '吉安市', '360800', '55637', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55638', '1', '55637', '吉州区', '360802', '55638', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55639', '1', '55637', '青原区', '360803', '55639', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55640', '1', '55637', '吉安县', '360821', '55640', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55641', '1', '55637', '吉水县', '360822', '55641', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55642', '1', '55637', '峡江县', '360823', '55642', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55643', '1', '55637', '新干县', '360824', '55643', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55644', '1', '55637', '永丰县', '360825', '55644', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55645', '1', '55637', '泰和县', '360826', '55645', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55646', '1', '55637', '遂川县', '360827', '55646', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55647', '1', '55637', '万安县', '360828', '55647', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55648', '1', '55637', '安福县', '360829', '55648', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55649', '1', '55637', '永新县', '360830', '55649', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55650', '1', '55637', '井冈山市', '360881', '55650', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55651', '1', '55576', '宜春市', '360900', '55651', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55652', '1', '55651', '袁州区', '360902', '55652', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55653', '1', '55651', '奉新县', '360921', '55653', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55654', '1', '55651', '万载县', '360922', '55654', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55655', '1', '55651', '上高县', '360923', '55655', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55656', '1', '55651', '宜丰县', '360924', '55656', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55657', '1', '55651', '靖安县', '360925', '55657', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55658', '1', '55651', '铜鼓县', '360926', '55658', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55659', '1', '55651', '丰城市', '360981', '55659', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55660', '1', '55651', '樟树市', '360982', '55660', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55661', '1', '55651', '高安市', '360983', '55661', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55662', '1', '55576', '抚州市', '361000', '55662', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55663', '1', '55662', '临川区', '361002', '55663', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55664', '1', '55662', '南城县', '361021', '55664', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55665', '1', '55662', '黎川县', '361022', '55665', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55666', '1', '55662', '南丰县', '361023', '55666', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55667', '1', '55662', '崇仁县', '361024', '55667', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55668', '1', '55662', '乐安县', '361025', '55668', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55669', '1', '55662', '宜黄县', '361026', '55669', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55670', '1', '55662', '金溪县', '361027', '55670', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55671', '1', '55662', '资溪县', '361028', '55671', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55672', '1', '55662', '东乡县', '361029', '55672', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55673', '1', '55662', '广昌县', '361030', '55673', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55674', '1', '55576', '上饶市', '361100', '55674', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55675', '1', '55674', '信州区', '361102', '55675', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55676', '1', '55674', '上饶县', '361121', '55676', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55677', '1', '55674', '广丰县', '361122', '55677', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55678', '1', '55674', '玉山县', '361123', '55678', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55679', '1', '55674', '铅山县', '361124', '55679', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55680', '1', '55674', '横峰县', '361125', '55680', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55681', '1', '55674', '弋阳县', '361126', '55681', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55682', '1', '55674', '余干县', '361127', '55682', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55683', '1', '55674', '鄱阳县', '361128', '55683', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55684', '1', '55674', '万年县', '361129', '55684', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55685', '1', '55674', '婺源县', '361130', '55685', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55686', '1', '55674', '德兴市', '361181', '55686', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55687', '1', '54317', '山东省', '370000', '55687', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55688', '1', '55687', '济南市', '370100', '55688', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55689', '1', '55688', '历下区', '370102', '55689', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55690', '1', '55688', '市中区', '370103', '55690', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55691', '1', '55688', '槐荫区', '370104', '55691', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55692', '1', '55688', '天桥区', '370105', '55692', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55693', '1', '55688', '历城区', '370112', '55693', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55694', '1', '55688', '长清区', '370113', '55694', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55695', '1', '55688', '平阴县', '370124', '55695', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55696', '1', '55688', '济阳县', '370125', '55696', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55697', '1', '55688', '商河县', '370126', '55697', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55698', '1', '55688', '章丘市', '370181', '55698', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55699', '1', '55687', '青岛市', '370200', '55699', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55700', '1', '55699', '市南区', '370202', '55700', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55701', '1', '55699', '市北区', '370203', '55701', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55702', '1', '55699', '四方区', '370205', '55702', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55703', '1', '55699', '黄岛区', '370211', '55703', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55704', '1', '55699', '崂山区', '370212', '55704', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55705', '1', '55699', '李沧区', '370213', '55705', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55706', '1', '55699', '城阳区', '370214', '55706', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55707', '1', '55699', '胶州市', '370281', '55707', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55708', '1', '55699', '即墨市', '370282', '55708', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55709', '1', '55699', '平度市', '370283', '55709', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55710', '1', '55699', '胶南市', '370284', '55710', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55711', '1', '55699', '莱西市', '370285', '55711', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55712', '1', '55687', '淄博市', '370300', '55712', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55713', '1', '55712', '淄川区', '370302', '55713', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55714', '1', '55712', '张店区', '370303', '55714', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55715', '1', '55712', '博山区', '370304', '55715', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55716', '1', '55712', '临淄区', '370305', '55716', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55717', '1', '55712', '周村区', '370306', '55717', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55718', '1', '55712', '桓台县', '370321', '55718', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55719', '1', '55712', '高青县', '370322', '55719', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55720', '1', '55712', '沂源县', '370323', '55720', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55721', '1', '55687', '枣庄市', '370400', '55721', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55722', '1', '55721', '市中区', '370402', '55722', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55723', '1', '55721', '薛城区', '370403', '55723', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55724', '1', '55721', '峄城区', '370404', '55724', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55725', '1', '55721', '台儿庄区', '370405', '55725', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55726', '1', '55721', '山亭区', '370406', '55726', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55727', '1', '55721', '滕州市', '370481', '55727', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55728', '1', '55687', '东营市', '370500', '55728', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55729', '1', '55728', '东营区', '370502', '55729', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55730', '1', '55728', '河口区', '370503', '55730', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55731', '1', '55728', '垦利县', '370521', '55731', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55732', '1', '55728', '利津县', '370522', '55732', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55733', '1', '55728', '广饶县', '370523', '55733', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55734', '1', '55687', '烟台市', '370600', '55734', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55735', '1', '55734', '芝罘区', '370602', '55735', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55736', '1', '55734', '福山区', '370611', '55736', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55737', '1', '55734', '牟平区', '370612', '55737', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55738', '1', '55734', '莱山区', '370613', '55738', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55739', '1', '55734', '长岛县', '370634', '55739', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55740', '1', '55734', '龙口市', '370681', '55740', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55741', '1', '55734', '莱阳市', '370682', '55741', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55742', '1', '55734', '莱州市', '370683', '55742', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55743', '1', '55734', '蓬莱市', '370684', '55743', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55744', '1', '55734', '招远市', '370685', '55744', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55745', '1', '55734', '栖霞市', '370686', '55745', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55746', '1', '55734', '海阳市', '370687', '55746', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55747', '1', '55687', '潍坊市', '370700', '55747', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55748', '1', '55747', '潍城区', '370702', '55748', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55749', '1', '55747', '寒亭区', '370703', '55749', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55750', '1', '55747', '坊子区', '370704', '55750', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55751', '1', '55747', '奎文区', '370705', '55751', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55752', '1', '55747', '临朐县', '370724', '55752', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55753', '1', '55747', '昌乐县', '370725', '55753', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55754', '1', '55747', '青州市', '370781', '55754', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55755', '1', '55747', '诸城市', '370782', '55755', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55756', '1', '55747', '寿光市', '370783', '55756', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55757', '1', '55747', '安丘市', '370784', '55757', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55758', '1', '55747', '高密市', '370785', '55758', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55759', '1', '55747', '昌邑市', '370786', '55759', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55760', '1', '55687', '济宁市', '370800', '55760', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55761', '1', '55760', '市中区', '370802', '55761', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55762', '1', '55760', '任城区', '370811', '55762', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55763', '1', '55760', '微山县', '370826', '55763', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55764', '1', '55760', '鱼台县', '370827', '55764', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55765', '1', '55760', '金乡县', '370828', '55765', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55766', '1', '55760', '嘉祥县', '370829', '55766', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55767', '1', '55760', '汶上县', '370830', '55767', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55768', '1', '55760', '泗水县', '370831', '55768', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55769', '1', '55760', '梁山县', '370832', '55769', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55770', '1', '55760', '曲阜市', '370881', '55770', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55771', '1', '55760', '兖州市', '370882', '55771', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55772', '1', '55760', '邹城市', '370883', '55772', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55773', '1', '55687', '泰安市', '370900', '55773', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55774', '1', '55773', '泰山区', '370902', '55774', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55775', '1', '55773', '岱岳区', '370911', '55775', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55776', '1', '55773', '宁阳县', '370921', '55776', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55777', '1', '55773', '东平县', '370923', '55777', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55778', '1', '55773', '新泰市', '370982', '55778', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55779', '1', '55773', '肥城市', '370983', '55779', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55780', '1', '55687', '威海市', '371000', '55780', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55781', '1', '55780', '环翠区', '371002', '55781', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55782', '1', '55780', '文登市', '371081', '55782', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55783', '1', '55780', '荣成市', '371082', '55783', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55784', '1', '55780', '乳山市', '371083', '55784', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55785', '1', '55687', '日照市', '371100', '55785', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55786', '1', '55785', '东港区', '371102', '55786', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55787', '1', '55785', '岚山区', '371103', '55787', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55788', '1', '55785', '五莲县', '371121', '55788', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55789', '1', '55785', '莒县', '371122', '55789', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55790', '1', '55687', '莱芜市', '371200', '55790', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55791', '1', '55790', '莱城区', '371202', '55791', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55792', '1', '55790', '钢城区', '371203', '55792', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55793', '1', '55687', '临沂市', '371300', '55793', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55794', '1', '55793', '兰山区', '371302', '55794', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55795', '1', '55793', '罗庄区', '371311', '55795', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55796', '1', '55793', '河东区', '371312', '55796', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55797', '1', '55793', '沂南县', '371321', '55797', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55798', '1', '55793', '郯城县', '371322', '55798', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55799', '1', '55793', '沂水县', '371323', '55799', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55800', '1', '55793', '苍山县', '371324', '55800', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55801', '1', '55793', '费县', '371325', '55801', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55802', '1', '55793', '平邑县', '371326', '55802', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55803', '1', '55793', '莒南县', '371327', '55803', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55804', '1', '55793', '蒙阴县', '371328', '55804', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55805', '1', '55793', '临沭县', '371329', '55805', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55806', '1', '55687', '德州市', '371400', '55806', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55807', '1', '55806', '德城区', '371402', '55807', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55808', '1', '55806', '陵县', '371421', '55808', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55809', '1', '55806', '宁津县', '371422', '55809', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55810', '1', '55806', '庆云县', '371423', '55810', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55811', '1', '55806', '临邑县', '371424', '55811', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55812', '1', '55806', '齐河县', '371425', '55812', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55813', '1', '55806', '平原县', '371426', '55813', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55814', '1', '55806', '夏津县', '371427', '55814', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55815', '1', '55806', '武城县', '371428', '55815', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55816', '1', '55806', '乐陵市', '371481', '55816', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55817', '1', '55806', '禹城市', '371482', '55817', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55818', '1', '55687', '聊城市', '371500', '55818', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55819', '1', '55818', '东昌府区', '371502', '55819', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55820', '1', '55818', '阳谷县', '371521', '55820', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55821', '1', '55818', '莘县', '371522', '55821', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55822', '1', '55818', '茌平县', '371523', '55822', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55823', '1', '55818', '东阿县', '371524', '55823', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55824', '1', '55818', '冠县', '371525', '55824', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55825', '1', '55818', '高唐县', '371526', '55825', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55826', '1', '55818', '临清市', '371581', '55826', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55827', '1', '55687', '滨州市', '371600', '55827', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55828', '1', '55827', '滨城区', '371602', '55828', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55829', '1', '55827', '惠民县', '371621', '55829', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55830', '1', '55827', '阳信县', '371622', '55830', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55831', '1', '55827', '无棣县', '371623', '55831', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55832', '1', '55827', '沾化县', '371624', '55832', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55833', '1', '55827', '博兴县', '371625', '55833', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55834', '1', '55827', '邹平县', '371626', '55834', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55835', '1', '55687', '菏泽市', '371700', '55835', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55836', '1', '55835', '牡丹区', '371702', '55836', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55837', '1', '55835', '曹县', '371721', '55837', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55838', '1', '55835', '单县', '371722', '55838', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55839', '1', '55835', '成武县', '371723', '55839', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55840', '1', '55835', '巨野县', '371724', '55840', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55841', '1', '55835', '郓城县', '371725', '55841', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55842', '1', '55835', '鄄城县', '371726', '55842', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55843', '1', '55835', '定陶县', '371727', '55843', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55844', '1', '55835', '东明县', '371728', '55844', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55845', '1', '54317', '河南省', '410000', '55845', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55846', '1', '55845', '郑州市', '410100', '55846', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55847', '1', '55846', '中原区', '410102', '55847', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55848', '1', '55846', '二七区', '410103', '55848', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55849', '1', '55846', '管城回族区', '410104', '55849', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55850', '1', '55846', '金水区', '410105', '55850', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55851', '1', '55846', '上街区', '410106', '55851', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55852', '1', '55846', '惠济区', '410108', '55852', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55853', '1', '55846', '中牟县', '410122', '55853', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55854', '1', '55846', '巩义市', '410181', '55854', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55855', '1', '55846', '荥阳市', '410182', '55855', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55856', '1', '55846', '新密市', '410183', '55856', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55857', '1', '55846', '新郑市', '410184', '55857', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55858', '1', '55846', '登封市', '410185', '55858', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55859', '1', '55845', '开封市', '410200', '55859', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55860', '1', '55859', '龙亭区', '410202', '55860', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55861', '1', '55859', '顺河回族区', '410203', '55861', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55862', '1', '55859', '鼓楼区', '410204', '55862', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55863', '1', '55859', '禹王台区', '410205', '55863', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55864', '1', '55859', '金明区', '410211', '55864', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55865', '1', '55859', '杞县', '410221', '55865', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55866', '1', '55859', '通许县', '410222', '55866', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55867', '1', '55859', '尉氏县', '410223', '55867', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55868', '1', '55859', '开封县', '410224', '55868', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55869', '1', '55859', '兰考县', '410225', '55869', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55870', '1', '55845', '洛阳市', '410300', '55870', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55871', '1', '55870', '老城区', '410302', '55871', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55872', '1', '55870', '西工区', '410303', '55872', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55873', '1', '55870', '瀍河回族区', '410304', '55873', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55874', '1', '55870', '涧西区', '410305', '55874', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55875', '1', '55870', '吉利区', '410306', '55875', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55876', '1', '55870', '洛龙区', '410311', '55876', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55877', '1', '55870', '孟津县', '410322', '55877', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55878', '1', '55870', '新安县', '410323', '55878', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55879', '1', '55870', '栾川县', '410324', '55879', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55880', '1', '55870', '嵩县', '410325', '55880', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55881', '1', '55870', '汝阳县', '410326', '55881', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55882', '1', '55870', '宜阳县', '410327', '55882', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55883', '1', '55870', '洛宁县', '410328', '55883', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55884', '1', '55870', '伊川县', '410329', '55884', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55885', '1', '55870', '偃师市', '410381', '55885', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55886', '1', '55845', '平顶山市', '410400', '55886', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55887', '1', '55886', '新华区', '410402', '55887', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55888', '1', '55886', '卫东区', '410403', '55888', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55889', '1', '55886', '石龙区', '410404', '55889', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55890', '1', '55886', '湛河区', '410411', '55890', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55891', '1', '55886', '宝丰县', '410421', '55891', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55892', '1', '55886', '叶县', '410422', '55892', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55893', '1', '55886', '鲁山县', '410423', '55893', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55894', '1', '55886', '郏县', '410425', '55894', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55895', '1', '55886', '舞钢市', '410481', '55895', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55896', '1', '55886', '汝州市', '410482', '55896', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55897', '1', '55845', '安阳市', '410500', '55897', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55898', '1', '55897', '文峰区', '410502', '55898', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55899', '1', '55897', '北关区', '410503', '55899', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55900', '1', '55897', '殷都区', '410505', '55900', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55901', '1', '55897', '龙安区', '410506', '55901', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55902', '1', '55897', '安阳县', '410522', '55902', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55903', '1', '55897', '汤阴县', '410523', '55903', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55904', '1', '55897', '滑县', '410526', '55904', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55905', '1', '55897', '内黄县', '410527', '55905', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55906', '1', '55897', '林州市', '410581', '55906', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55907', '1', '55845', '鹤壁市', '410600', '55907', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55908', '1', '55907', '鹤山区', '410602', '55908', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55909', '1', '55907', '山城区', '410603', '55909', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55910', '1', '55907', '淇滨区', '410611', '55910', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55911', '1', '55907', '浚县', '410621', '55911', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55912', '1', '55907', '淇县', '410622', '55912', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55913', '1', '55845', '新乡市', '410700', '55913', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55914', '1', '55913', '红旗区', '410702', '55914', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55915', '1', '55913', '卫滨区', '410703', '55915', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55916', '1', '55913', '凤泉区', '410704', '55916', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55917', '1', '55913', '牧野区', '410711', '55917', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55918', '1', '55913', '新乡县', '410721', '55918', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55919', '1', '55913', '获嘉县', '410724', '55919', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55920', '1', '55913', '原阳县', '410725', '55920', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55921', '1', '55913', '延津县', '410726', '55921', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55922', '1', '55913', '封丘县', '410727', '55922', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55923', '1', '55913', '长垣县', '410728', '55923', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55924', '1', '55913', '卫辉市', '410781', '55924', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55925', '1', '55913', '辉县市', '410782', '55925', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55926', '1', '55845', '焦作市', '410800', '55926', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55927', '1', '55926', '解放区', '410802', '55927', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55928', '1', '55926', '中站区', '410803', '55928', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55929', '1', '55926', '马村区', '410804', '55929', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55930', '1', '55926', '山阳区', '410811', '55930', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55931', '1', '55926', '修武县', '410821', '55931', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55932', '1', '55926', '博爱县', '410822', '55932', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55933', '1', '55926', '武陟县', '410823', '55933', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55934', '1', '55926', '温县', '410825', '55934', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55935', '1', '55926', '沁阳市', '410882', '55935', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55936', '1', '55926', '孟州市', '410883', '55936', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55937', '1', '55845', '濮阳市', '410900', '55937', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55938', '1', '55937', '华龙区', '410902', '55938', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55939', '1', '55937', '清丰县', '410922', '55939', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55940', '1', '55937', '南乐县', '410923', '55940', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55941', '1', '55937', '范县', '410926', '55941', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55942', '1', '55937', '台前县', '410927', '55942', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55943', '1', '55937', '濮阳县', '410928', '55943', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55944', '1', '55845', '许昌市', '411000', '55944', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55945', '1', '55944', '魏都区', '411002', '55945', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55946', '1', '55944', '许昌县', '411023', '55946', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55947', '1', '55944', '鄢陵县', '411024', '55947', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55948', '1', '55944', '襄城县', '411025', '55948', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55949', '1', '55944', '禹州市', '411081', '55949', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55950', '1', '55944', '长葛市', '411082', '55950', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55951', '1', '55845', '漯河市', '411100', '55951', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55952', '1', '55951', '源汇区', '411102', '55952', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55953', '1', '55951', '郾城区', '411103', '55953', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55954', '1', '55951', '召陵区', '411104', '55954', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55955', '1', '55951', '舞阳县', '411121', '55955', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55956', '1', '55951', '临颍县', '411122', '55956', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55957', '1', '55845', '三门峡市', '411200', '55957', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55958', '1', '55957', '湖滨区', '411202', '55958', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55959', '1', '55957', '渑池县', '411221', '55959', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55960', '1', '55957', '陕县', '411222', '55960', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55961', '1', '55957', '卢氏县', '411224', '55961', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55962', '1', '55957', '义马市', '411281', '55962', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55963', '1', '55957', '灵宝市', '411282', '55963', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55964', '1', '55845', '南阳市', '411300', '55964', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55965', '1', '55964', '宛城区', '411302', '55965', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55966', '1', '55964', '卧龙区', '411303', '55966', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55967', '1', '55964', '南召县', '411321', '55967', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55968', '1', '55964', '方城县', '411322', '55968', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55969', '1', '55964', '西峡县', '411323', '55969', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55970', '1', '55964', '镇平县', '411324', '55970', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55971', '1', '55964', '内乡县', '411325', '55971', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55972', '1', '55964', '淅川县', '411326', '55972', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55973', '1', '55964', '社旗县', '411327', '55973', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55974', '1', '55964', '唐河县', '411328', '55974', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55975', '1', '55964', '新野县', '411329', '55975', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55976', '1', '55964', '桐柏县', '411330', '55976', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55977', '1', '55964', '邓州市', '411381', '55977', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55978', '1', '55845', '商丘市', '411400', '55978', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55979', '1', '55978', '梁园区', '411402', '55979', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55980', '1', '55978', '睢阳区', '411403', '55980', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55981', '1', '55978', '民权县', '411421', '55981', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55982', '1', '55978', '睢县', '411422', '55982', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55983', '1', '55978', '宁陵县', '411423', '55983', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55984', '1', '55978', '柘城县', '411424', '55984', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55985', '1', '55978', '虞城县', '411425', '55985', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55986', '1', '55978', '夏邑县', '411426', '55986', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55987', '1', '55978', '永城市', '411481', '55987', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55988', '1', '55845', '信阳市', '411500', '55988', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55989', '1', '55988', '浉河区', '411502', '55989', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55990', '1', '55988', '平桥区', '411503', '55990', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55991', '1', '55988', '罗山县', '411521', '55991', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55992', '1', '55988', '光山县', '411522', '55992', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55993', '1', '55988', '新县', '411523', '55993', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55994', '1', '55988', '商城县', '411524', '55994', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55995', '1', '55988', '固始县', '411525', '55995', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55996', '1', '55988', '潢川县', '411526', '55996', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55997', '1', '55988', '淮滨县', '411527', '55997', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55998', '1', '55988', '息县', '411528', '55998', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('55999', '1', '55845', '周口市', '411600', '55999', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56000', '1', '55999', '川汇区', '411602', '56000', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56001', '1', '55999', '扶沟县', '411621', '56001', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56002', '1', '55999', '西华县', '411622', '56002', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56003', '1', '55999', '商水县', '411623', '56003', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56004', '1', '55999', '沈丘县', '411624', '56004', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56005', '1', '55999', '郸城县', '411625', '56005', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56006', '1', '55999', '淮阳县', '411626', '56006', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56007', '1', '55999', '太康县', '411627', '56007', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56008', '1', '55999', '鹿邑县', '411628', '56008', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56009', '1', '55999', '项城市', '411681', '56009', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56010', '1', '55845', '驻马店市', '411700', '56010', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56011', '1', '56010', '驿城区', '411702', '56011', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56012', '1', '56010', '西平县', '411721', '56012', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56013', '1', '56010', '上蔡县', '411722', '56013', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56014', '1', '56010', '平舆县', '411723', '56014', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56015', '1', '56010', '正阳县', '411724', '56015', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56016', '1', '56010', '确山县', '411725', '56016', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56017', '1', '56010', '泌阳县', '411726', '56017', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56018', '1', '56010', '汝南县', '411727', '56018', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56019', '1', '56010', '遂平县', '411728', '56019', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56020', '1', '56010', '新蔡县', '411729', '56020', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56021', '1', '55845', '（省直辖县级行政区划）', '419000', '56021', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56022', '1', '56021', '济源市', '419001', '56022', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56023', '1', '54317', '湖北省', '420000', '56023', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56024', '1', '56023', '武汉市', '420100', '56024', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56025', '1', '56024', '江岸区', '420102', '56025', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56026', '1', '56024', '江汉区', '420103', '56026', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56027', '1', '56024', '硚口区', '420104', '56027', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56028', '1', '56024', '汉阳区', '420105', '56028', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56029', '1', '56024', '武昌区', '420106', '56029', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56030', '1', '56024', '青山区', '420107', '56030', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56031', '1', '56024', '洪山区', '420111', '56031', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56032', '1', '56024', '东西湖区', '420112', '56032', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56033', '1', '56024', '汉南区', '420113', '56033', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56034', '1', '56024', '蔡甸区', '420114', '56034', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56035', '1', '56024', '江夏区', '420115', '56035', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56036', '1', '56024', '黄陂区', '420116', '56036', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56037', '1', '56024', '新洲区', '420117', '56037', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56038', '1', '56023', '黄石市', '420200', '56038', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56039', '1', '56038', '黄石港区', '420202', '56039', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56040', '1', '56038', '西塞山区', '420203', '56040', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56041', '1', '56038', '下陆区', '420204', '56041', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56042', '1', '56038', '铁山区', '420205', '56042', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56043', '1', '56038', '阳新县', '420222', '56043', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56044', '1', '56038', '大冶市', '420281', '56044', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56045', '1', '56023', '十堰市', '420300', '56045', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56046', '1', '56045', '茅箭区', '420302', '56046', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56047', '1', '56045', '张湾区', '420303', '56047', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56048', '1', '56045', '郧县', '420321', '56048', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56049', '1', '56045', '郧西县', '420322', '56049', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56050', '1', '56045', '竹山县', '420323', '56050', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56051', '1', '56045', '竹溪县', '420324', '56051', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56052', '1', '56045', '房县', '420325', '56052', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56053', '1', '56045', '丹江口市', '420381', '56053', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56054', '1', '56023', '宜昌市', '420500', '56054', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56055', '1', '56054', '西陵区', '420502', '56055', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56056', '1', '56054', '伍家岗区', '420503', '56056', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56057', '1', '56054', '点军区', '420504', '56057', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56058', '1', '56054', '猇亭区', '420505', '56058', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56059', '1', '56054', '夷陵区', '420506', '56059', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56060', '1', '56054', '远安县', '420525', '56060', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56061', '1', '56054', '兴山县', '420526', '56061', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56062', '1', '56054', '秭归县', '420527', '56062', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56063', '1', '56054', '长阳土家族自治县', '420528', '56063', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56064', '1', '56054', '五峰土家族自治县', '420529', '56064', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56065', '1', '56054', '宜都市', '420581', '56065', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56066', '1', '56054', '当阳市', '420582', '56066', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56067', '1', '56054', '枝江市', '420583', '56067', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56068', '1', '56023', '襄樊市', '420600', '56068', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56069', '1', '56068', '襄城区', '420602', '56069', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56070', '1', '56068', '樊城区', '420606', '56070', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56071', '1', '56068', '襄阳区', '420607', '56071', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56072', '1', '56068', '南漳县', '420624', '56072', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56073', '1', '56068', '谷城县', '420625', '56073', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56074', '1', '56068', '保康县', '420626', '56074', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56075', '1', '56068', '老河口市', '420682', '56075', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56076', '1', '56068', '枣阳市', '420683', '56076', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56077', '1', '56068', '宜城市', '420684', '56077', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56078', '1', '56023', '鄂州市', '420700', '56078', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56079', '1', '56078', '梁子湖区', '420702', '56079', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56080', '1', '56078', '华容区', '420703', '56080', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56081', '1', '56078', '鄂城区', '420704', '56081', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56082', '1', '56023', '荆门市', '420800', '56082', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56083', '1', '56082', '东宝区', '420802', '56083', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56084', '1', '56082', '掇刀区', '420804', '56084', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56085', '1', '56082', '京山县', '420821', '56085', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56086', '1', '56082', '沙洋县', '420822', '56086', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56087', '1', '56082', '钟祥市', '420881', '56087', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56088', '1', '56023', '孝感市', '420900', '56088', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56089', '1', '56088', '孝南区', '420902', '56089', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56090', '1', '56088', '孝昌县', '420921', '56090', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56091', '1', '56088', '大悟县', '420922', '56091', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56092', '1', '56088', '云梦县', '420923', '56092', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56093', '1', '56088', '应城市', '420981', '56093', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56094', '1', '56088', '安陆市', '420982', '56094', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56095', '1', '56088', '汉川市', '420984', '56095', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56096', '1', '56023', '荆州市', '421000', '56096', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56097', '1', '56096', '沙市区', '421002', '56097', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56098', '1', '56096', '荆州区', '421003', '56098', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56099', '1', '56096', '公安县', '421022', '56099', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56100', '1', '56096', '监利县', '421023', '56100', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56101', '1', '56096', '江陵县', '421024', '56101', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56102', '1', '56096', '石首市', '421081', '56102', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56103', '1', '56096', '洪湖市', '421083', '56103', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56104', '1', '56096', '松滋市', '421087', '56104', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56105', '1', '56023', '黄冈市', '421100', '56105', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56106', '1', '56105', '黄州区', '421102', '56106', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56107', '1', '56105', '团风县', '421121', '56107', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56108', '1', '56105', '红安县', '421122', '56108', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56109', '1', '56105', '罗田县', '421123', '56109', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56110', '1', '56105', '英山县', '421124', '56110', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56111', '1', '56105', '浠水县', '421125', '56111', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56112', '1', '56105', '蕲春县', '421126', '56112', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56113', '1', '56105', '黄梅县', '421127', '56113', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56114', '1', '56105', '麻城市', '421181', '56114', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56115', '1', '56105', '武穴市', '421182', '56115', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56116', '1', '56023', '咸宁市', '421200', '56116', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56117', '1', '56116', '咸安区', '421202', '56117', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56118', '1', '56116', '嘉鱼县', '421221', '56118', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56119', '1', '56116', '通城县', '421222', '56119', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56120', '1', '56116', '崇阳县', '421223', '56120', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56121', '1', '56116', '通山县', '421224', '56121', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56122', '1', '56116', '赤壁市', '421281', '56122', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56123', '1', '56023', '随州市', '421300', '56123', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56124', '1', '56123', '曾都区', '421302', '56124', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56125', '1', '56123', '广水市', '421381', '56125', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56126', '1', '56023', '恩施土家族苗族自治州', '422800', '56126', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56127', '1', '56126', '恩施市', '422801', '56127', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56128', '1', '56126', '利川市', '422802', '56128', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56129', '1', '56126', '建始县', '422822', '56129', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56130', '1', '56126', '巴东县', '422823', '56130', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56131', '1', '56126', '宣恩县', '422825', '56131', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56132', '1', '56126', '咸丰县', '422826', '56132', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56133', '1', '56126', '来凤县', '422827', '56133', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56134', '1', '56126', '鹤峰县', '422828', '56134', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56135', '1', '56023', '（省直辖县级行政区划）', '429000', '56135', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56136', '1', '56135', '仙桃市', '429004', '56136', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56137', '1', '56135', '潜江市', '429005', '56137', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56138', '1', '56135', '天门市', '429006', '56138', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56139', '1', '56135', '神农架林区', '429021', '56139', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56140', '1', '54317', '湖南省', '430000', '56140', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56141', '1', '56140', '长沙市', '430100', '56141', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56142', '1', '56141', '芙蓉区', '430102', '56142', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56143', '1', '56141', '天心区', '430103', '56143', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56144', '1', '56141', '岳麓区', '430104', '56144', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56145', '1', '56141', '开福区', '430105', '56145', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56146', '1', '56141', '雨花区', '430111', '56146', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56147', '1', '56141', '长沙县', '430121', '56147', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56148', '1', '56141', '望城县', '430122', '56148', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56149', '1', '56141', '宁乡县', '430124', '56149', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56150', '1', '56141', '浏阳市', '430181', '56150', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56151', '1', '56140', '株洲市', '430200', '56151', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56152', '1', '56151', '荷塘区', '430202', '56152', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56153', '1', '56151', '芦淞区', '430203', '56153', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56154', '1', '56151', '石峰区', '430204', '56154', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56155', '1', '56151', '天元区', '430211', '56155', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56156', '1', '56151', '株洲县', '430221', '56156', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56157', '1', '56151', '攸县', '430223', '56157', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56158', '1', '56151', '茶陵县', '430224', '56158', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56159', '1', '56151', '炎陵县', '430225', '56159', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56160', '1', '56151', '醴陵市', '430281', '56160', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56161', '1', '56140', '湘潭市', '430300', '56161', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56162', '1', '56161', '雨湖区', '430302', '56162', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56163', '1', '56161', '岳塘区', '430304', '56163', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56164', '1', '56161', '湘潭县', '430321', '56164', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56165', '1', '56161', '湘乡市', '430381', '56165', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56166', '1', '56161', '韶山市', '430382', '56166', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56167', '1', '56140', '衡阳市', '430400', '56167', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56168', '1', '56167', '珠晖区', '430405', '56168', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56169', '1', '56167', '雁峰区', '430406', '56169', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56170', '1', '56167', '石鼓区', '430407', '56170', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56171', '1', '56167', '蒸湘区', '430408', '56171', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56172', '1', '56167', '南岳区', '430412', '56172', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56173', '1', '56167', '衡阳县', '430421', '56173', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56174', '1', '56167', '衡南县', '430422', '56174', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56175', '1', '56167', '衡山县', '430423', '56175', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56176', '1', '56167', '衡东县', '430424', '56176', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56177', '1', '56167', '祁东县', '430426', '56177', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56178', '1', '56167', '耒阳市', '430481', '56178', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56179', '1', '56167', '常宁市', '430482', '56179', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56180', '1', '56140', '邵阳市', '430500', '56180', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56181', '1', '56180', '双清区', '430502', '56181', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56182', '1', '56180', '大祥区', '430503', '56182', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56183', '1', '56180', '北塔区', '430511', '56183', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56184', '1', '56180', '邵东县', '430521', '56184', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56185', '1', '56180', '新邵县', '430522', '56185', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56186', '1', '56180', '邵阳县', '430523', '56186', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56187', '1', '56180', '隆回县', '430524', '56187', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56188', '1', '56180', '洞口县', '430525', '56188', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56189', '1', '56180', '绥宁县', '430527', '56189', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56190', '1', '56180', '新宁县', '430528', '56190', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56191', '1', '56180', '城步苗族自治县', '430529', '56191', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56192', '1', '56180', '武冈市', '430581', '56192', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56193', '1', '56140', '岳阳市', '430600', '56193', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56194', '1', '56193', '岳阳楼区', '430602', '56194', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56195', '1', '56193', '云溪区', '430603', '56195', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56196', '1', '56193', '君山区', '430611', '56196', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56197', '1', '56193', '岳阳县', '430621', '56197', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56198', '1', '56193', '华容县', '430623', '56198', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56199', '1', '56193', '湘阴县', '430624', '56199', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56200', '1', '56193', '平江县', '430626', '56200', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56201', '1', '56193', '汨罗市', '430681', '56201', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56202', '1', '56193', '临湘市', '430682', '56202', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56203', '1', '56140', '常德市', '430700', '56203', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56204', '1', '56203', '武陵区', '430702', '56204', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56205', '1', '56203', '鼎城区', '430703', '56205', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56206', '1', '56203', '安乡县', '430721', '56206', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56207', '1', '56203', '汉寿县', '430722', '56207', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56208', '1', '56203', '澧县', '430723', '56208', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56209', '1', '56203', '临澧县', '430724', '56209', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56210', '1', '56203', '桃源县', '430725', '56210', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56211', '1', '56203', '石门县', '430726', '56211', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56212', '1', '56203', '津市市', '430781', '56212', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56213', '1', '56140', '张家界市', '430800', '56213', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56214', '1', '56213', '永定区', '430802', '56214', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56215', '1', '56213', '武陵源区', '430811', '56215', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56216', '1', '56213', '慈利县', '430821', '56216', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56217', '1', '56213', '桑植县', '430822', '56217', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56218', '1', '56140', '益阳市', '430900', '56218', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56219', '1', '56218', '资阳区', '430902', '56219', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56220', '1', '56218', '赫山区', '430903', '56220', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56221', '1', '56218', '南县', '430921', '56221', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56222', '1', '56218', '桃江县', '430922', '56222', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56223', '1', '56218', '安化县', '430923', '56223', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56224', '1', '56218', '沅江市', '430981', '56224', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56225', '1', '56140', '郴州市', '431000', '56225', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56226', '1', '56225', '北湖区', '431002', '56226', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56227', '1', '56225', '苏仙区', '431003', '56227', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56228', '1', '56225', '桂阳县', '431021', '56228', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56229', '1', '56225', '宜章县', '431022', '56229', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56230', '1', '56225', '永兴县', '431023', '56230', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56231', '1', '56225', '嘉禾县', '431024', '56231', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56232', '1', '56225', '临武县', '431025', '56232', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56233', '1', '56225', '汝城县', '431026', '56233', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56234', '1', '56225', '桂东县', '431027', '56234', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56235', '1', '56225', '安仁县', '431028', '56235', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56236', '1', '56225', '资兴市', '431081', '56236', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56237', '1', '56140', '永州市', '431100', '56237', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56238', '1', '56237', '零陵区', '431102', '56238', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56239', '1', '56237', '冷水滩区', '431103', '56239', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56240', '1', '56237', '祁阳县', '431121', '56240', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56241', '1', '56237', '东安县', '431122', '56241', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56242', '1', '56237', '双牌县', '431123', '56242', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56243', '1', '56237', '道县', '431124', '56243', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56244', '1', '56237', '江永县', '431125', '56244', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56245', '1', '56237', '宁远县', '431126', '56245', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56246', '1', '56237', '蓝山县', '431127', '56246', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56247', '1', '56237', '新田县', '431128', '56247', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56248', '1', '56237', '江华瑶族自治县', '431129', '56248', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56249', '1', '56140', '怀化市', '431200', '56249', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56250', '1', '56249', '鹤城区', '431202', '56250', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56251', '1', '56249', '中方县', '431221', '56251', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56252', '1', '56249', '沅陵县', '431222', '56252', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56253', '1', '56249', '辰溪县', '431223', '56253', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56254', '1', '56249', '溆浦县', '431224', '56254', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56255', '1', '56249', '会同县', '431225', '56255', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56256', '1', '56249', '麻阳苗族自治县', '431226', '56256', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56257', '1', '56249', '新晃侗族自治县', '431227', '56257', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56258', '1', '56249', '芷江侗族自治县', '431228', '56258', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56259', '1', '56249', '靖州苗族侗族自治县', '431229', '56259', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56260', '1', '56249', '通道侗族自治县', '431230', '56260', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56261', '1', '56249', '洪江市', '431281', '56261', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56262', '1', '56140', '娄底市', '431300', '56262', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56263', '1', '56262', '娄星区', '431302', '56263', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56264', '1', '56262', '双峰县', '431321', '56264', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56265', '1', '56262', '新化县', '431322', '56265', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56266', '1', '56262', '冷水江市', '431381', '56266', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56267', '1', '56262', '涟源市', '431382', '56267', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56268', '1', '56140', '湘西土家族苗族自治州', '433100', '56268', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56269', '1', '56268', '吉首市', '433101', '56269', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56270', '1', '56268', '泸溪县', '433122', '56270', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56271', '1', '56268', '凤凰县', '433123', '56271', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56272', '1', '56268', '花垣县', '433124', '56272', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56273', '1', '56268', '保靖县', '433125', '56273', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56274', '1', '56268', '古丈县', '433126', '56274', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56275', '1', '56268', '永顺县', '433127', '56275', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56276', '1', '56268', '龙山县', '433130', '56276', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56277', '1', '54317', '广东省', '440000', '56277', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56278', '1', '56277', '广州市', '440100', '56278', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56279', '1', '56278', '荔湾区', '440103', '56279', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56280', '1', '56278', '越秀区', '440104', '56280', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56281', '1', '56278', '海珠区', '440105', '56281', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56282', '1', '56278', '天河区', '440106', '56282', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56283', '1', '56278', '白云区', '440111', '56283', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56284', '1', '56278', '黄埔区', '440112', '56284', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56285', '1', '56278', '番禺区', '440113', '56285', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56286', '1', '56278', '花都区', '440114', '56286', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56287', '1', '56278', '南沙区', '440115', '56287', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56288', '1', '56278', '萝岗区', '440116', '56288', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56289', '1', '56278', '增城市', '440183', '56289', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56290', '1', '56278', '从化市', '440184', '56290', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56291', '1', '56277', '韶关市', '440200', '56291', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56292', '1', '56291', '武江区', '440203', '56292', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56293', '1', '56291', '浈江区', '440204', '56293', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56294', '1', '56291', '曲江区', '440205', '56294', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56295', '1', '56291', '始兴县', '440222', '56295', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56296', '1', '56291', '仁化县', '440224', '56296', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56297', '1', '56291', '翁源县', '440229', '56297', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56298', '1', '56291', '乳源瑶族自治县', '440232', '56298', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56299', '1', '56291', '新丰县', '440233', '56299', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56300', '1', '56291', '乐昌市', '440281', '56300', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56301', '1', '56291', '南雄市', '440282', '56301', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56302', '1', '56277', '深圳市', '440300', '56302', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56303', '1', '56302', '罗湖区', '440303', '56303', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56304', '1', '56302', '福田区', '440304', '56304', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56305', '1', '56302', '南山区', '440305', '56305', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56306', '1', '56302', '宝安区', '440306', '56306', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56307', '1', '56302', '龙岗区', '440307', '56307', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56308', '1', '56302', '盐田区', '440308', '56308', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56309', '1', '56277', '珠海市', '440400', '56309', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56310', '1', '56309', '香洲区', '440402', '56310', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56311', '1', '56309', '斗门区', '440403', '56311', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56312', '1', '56309', '金湾区', '440404', '56312', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56313', '1', '56277', '汕头市', '440500', '56313', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56314', '1', '56313', '龙湖区', '440507', '56314', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56315', '1', '56313', '金平区', '440511', '56315', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56316', '1', '56313', '濠江区', '440512', '56316', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56317', '1', '56313', '潮阳区', '440513', '56317', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56318', '1', '56313', '潮南区', '440514', '56318', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56319', '1', '56313', '澄海区', '440515', '56319', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56320', '1', '56313', '南澳县', '440523', '56320', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56321', '1', '56277', '佛山市', '440600', '56321', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56322', '1', '56321', '禅城区', '440604', '56322', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56323', '1', '56321', '南海区', '440605', '56323', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56324', '1', '56321', '顺德区', '440606', '56324', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56325', '1', '56321', '三水区', '440607', '56325', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56326', '1', '56321', '高明区', '440608', '56326', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56327', '1', '56277', '江门市', '440700', '56327', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56328', '1', '56327', '蓬江区', '440703', '56328', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56329', '1', '56327', '江海区', '440704', '56329', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56330', '1', '56327', '新会区', '440705', '56330', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56331', '1', '56327', '台山市', '440781', '56331', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56332', '1', '56327', '开平市', '440783', '56332', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56333', '1', '56327', '鹤山市', '440784', '56333', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56334', '1', '56327', '恩平市', '440785', '56334', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56335', '1', '56277', '湛江市', '440800', '56335', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56336', '1', '56335', '赤坎区', '440802', '56336', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56337', '1', '56335', '霞山区', '440803', '56337', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56338', '1', '56335', '坡头区', '440804', '56338', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56339', '1', '56335', '麻章区', '440811', '56339', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56340', '1', '56335', '遂溪县', '440823', '56340', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56341', '1', '56335', '徐闻县', '440825', '56341', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56342', '1', '56335', '廉江市', '440881', '56342', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56343', '1', '56335', '雷州市', '440882', '56343', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56344', '1', '56335', '吴川市', '440883', '56344', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56345', '1', '56277', '茂名市', '440900', '56345', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56346', '1', '56345', '茂南区', '440902', '56346', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56347', '1', '56345', '茂港区', '440903', '56347', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56348', '1', '56345', '电白县', '440923', '56348', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56349', '1', '56345', '高州市', '440981', '56349', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56350', '1', '56345', '化州市', '440982', '56350', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56351', '1', '56345', '信宜市', '440983', '56351', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56352', '1', '56277', '肇庆市', '441200', '56352', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56353', '1', '56352', '端州区', '441202', '56353', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56354', '1', '56352', '鼎湖区', '441203', '56354', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56355', '1', '56352', '广宁县', '441223', '56355', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56356', '1', '56352', '怀集县', '441224', '56356', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56357', '1', '56352', '封开县', '441225', '56357', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56358', '1', '56352', '德庆县', '441226', '56358', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56359', '1', '56352', '高要市', '441283', '56359', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56360', '1', '56352', '四会市', '441284', '56360', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56361', '1', '56277', '惠州市', '441300', '56361', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56362', '1', '56361', '惠城区', '441302', '56362', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56363', '1', '56361', '惠阳区', '441303', '56363', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56364', '1', '56361', '博罗县', '441322', '56364', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56365', '1', '56361', '惠东县', '441323', '56365', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56366', '1', '56361', '龙门县', '441324', '56366', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56367', '1', '56277', '梅州市', '441400', '56367', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56368', '1', '56367', '梅江区', '441402', '56368', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56369', '1', '56367', '梅县', '441421', '56369', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56370', '1', '56367', '大埔县', '441422', '56370', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56371', '1', '56367', '丰顺县', '441423', '56371', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56372', '1', '56367', '五华县', '441424', '56372', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56373', '1', '56367', '平远县', '441426', '56373', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56374', '1', '56367', '蕉岭县', '441427', '56374', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56375', '1', '56367', '兴宁市', '441481', '56375', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56376', '1', '56277', '汕尾市', '441500', '56376', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56377', '1', '56376', '城区', '441502', '56377', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56378', '1', '56376', '海丰县', '441521', '56378', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56379', '1', '56376', '陆河县', '441523', '56379', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56380', '1', '56376', '陆丰市', '441581', '56380', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56381', '1', '56277', '河源市', '441600', '56381', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56382', '1', '56381', '源城区', '441602', '56382', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56383', '1', '56381', '紫金县', '441621', '56383', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56384', '1', '56381', '龙川县', '441622', '56384', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56385', '1', '56381', '连平县', '441623', '56385', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56386', '1', '56381', '和平县', '441624', '56386', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56387', '1', '56381', '东源县', '441625', '56387', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56388', '1', '56277', '阳江市', '441700', '56388', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56389', '1', '56388', '江城区', '441702', '56389', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56390', '1', '56388', '阳西县', '441721', '56390', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56391', '1', '56388', '阳东县', '441723', '56391', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56392', '1', '56388', '阳春市', '441781', '56392', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56393', '1', '56277', '清远市', '441800', '56393', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56394', '1', '56393', '清城区', '441802', '56394', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56395', '1', '56393', '佛冈县', '441821', '56395', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56396', '1', '56393', '阳山县', '441823', '56396', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56397', '1', '56393', '连山壮族瑶族自治县', '441825', '56397', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56398', '1', '56393', '连南瑶族自治县', '441826', '56398', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56399', '1', '56393', '清新县', '441827', '56399', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56400', '1', '56393', '英德市', '441881', '56400', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56401', '1', '56393', '连州市', '441882', '56401', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56402', '1', '56277', '东莞市', '441900', '56402', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56403', '1', '56277', '中山市', '442000', '56403', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56404', '1', '56277', '潮州市', '445100', '56404', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56405', '1', '56404', '湘桥区', '445102', '56405', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56406', '1', '56404', '潮安县', '445121', '56406', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56407', '1', '56404', '饶平县', '445122', '56407', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56408', '1', '56277', '揭阳市', '445200', '56408', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56409', '1', '56408', '榕城区', '445202', '56409', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56410', '1', '56408', '揭东县', '445221', '56410', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56411', '1', '56408', '揭西县', '445222', '56411', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56412', '1', '56408', '惠来县', '445224', '56412', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56413', '1', '56408', '普宁市', '445281', '56413', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56414', '1', '56277', '云浮市', '445300', '56414', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56415', '1', '56414', '云城区', '445302', '56415', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56416', '1', '56414', '新兴县', '445321', '56416', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56417', '1', '56414', '郁南县', '445322', '56417', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56418', '1', '56414', '云安县', '445323', '56418', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56419', '1', '56414', '罗定市', '445381', '56419', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56420', '1', '54317', '广西壮族自治区', '450000', '56420', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56421', '1', '56420', '南宁市', '450100', '56421', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56422', '1', '56421', '兴宁区', '450102', '56422', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56423', '1', '56421', '青秀区', '450103', '56423', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56424', '1', '56421', '江南区', '450105', '56424', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56425', '1', '56421', '西乡塘区', '450107', '56425', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56426', '1', '56421', '良庆区', '450108', '56426', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56427', '1', '56421', '邕宁区', '450109', '56427', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56428', '1', '56421', '武鸣县', '450122', '56428', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56429', '1', '56421', '隆安县', '450123', '56429', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56430', '1', '56421', '马山县', '450124', '56430', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56431', '1', '56421', '上林县', '450125', '56431', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56432', '1', '56421', '宾阳县', '450126', '56432', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56433', '1', '56421', '横县', '450127', '56433', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56434', '1', '56420', '柳州市', '450200', '56434', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56435', '1', '56434', '城中区', '450202', '56435', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56436', '1', '56434', '鱼峰区', '450203', '56436', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56437', '1', '56434', '柳南区', '450204', '56437', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56438', '1', '56434', '柳北区', '450205', '56438', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56439', '1', '56434', '柳江县', '450221', '56439', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56440', '1', '56434', '柳城县', '450222', '56440', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56441', '1', '56434', '鹿寨县', '450223', '56441', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56442', '1', '56434', '融安县', '450224', '56442', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56443', '1', '56434', '融水苗族自治县', '450225', '56443', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56444', '1', '56434', '三江侗族自治县', '450226', '56444', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56445', '1', '56420', '桂林市', '450300', '56445', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56446', '1', '56445', '秀峰区', '450302', '56446', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56447', '1', '56445', '叠彩区', '450303', '56447', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56448', '1', '56445', '象山区', '450304', '56448', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56449', '1', '56445', '七星区', '450305', '56449', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56450', '1', '56445', '雁山区', '450311', '56450', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56451', '1', '56445', '阳朔县', '450321', '56451', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56452', '1', '56445', '临桂县', '450322', '56452', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56453', '1', '56445', '灵川县', '450323', '56453', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56454', '1', '56445', '全州县', '450324', '56454', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56455', '1', '56445', '兴安县', '450325', '56455', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56456', '1', '56445', '永福县', '450326', '56456', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56457', '1', '56445', '灌阳县', '450327', '56457', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56458', '1', '56445', '龙胜各族自治县', '450328', '56458', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56459', '1', '56445', '资源县', '450329', '56459', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56460', '1', '56445', '平乐县', '450330', '56460', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56461', '1', '56445', '荔浦县', '450331', '56461', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56462', '1', '56445', '恭城瑶族自治县', '450332', '56462', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56463', '1', '56420', '梧州市', '450400', '56463', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56464', '1', '56463', '万秀区', '450403', '56464', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56465', '1', '56463', '蝶山区', '450404', '56465', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56466', '1', '56463', '长洲区', '450405', '56466', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56467', '1', '56463', '苍梧县', '450421', '56467', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56468', '1', '56463', '藤县', '450422', '56468', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56469', '1', '56463', '蒙山县', '450423', '56469', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56470', '1', '56463', '岑溪市', '450481', '56470', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56471', '1', '56420', '北海市', '450500', '56471', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56472', '1', '56471', '海城区', '450502', '56472', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56473', '1', '56471', '银海区', '450503', '56473', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56474', '1', '56471', '铁山港区', '450512', '56474', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56475', '1', '56471', '合浦县', '450521', '56475', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56476', '1', '56420', '防城港市', '450600', '56476', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56477', '1', '56476', '港口区', '450602', '56477', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56478', '1', '56476', '防城区', '450603', '56478', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56479', '1', '56476', '上思县', '450621', '56479', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56480', '1', '56476', '东兴市', '450681', '56480', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56481', '1', '56420', '钦州市', '450700', '56481', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56482', '1', '56481', '钦南区', '450702', '56482', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56483', '1', '56481', '钦北区', '450703', '56483', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56484', '1', '56481', '灵山县', '450721', '56484', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56485', '1', '56481', '浦北县', '450722', '56485', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56486', '1', '56420', '贵港市', '450800', '56486', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56487', '1', '56486', '港北区', '450802', '56487', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56488', '1', '56486', '港南区', '450803', '56488', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56489', '1', '56486', '覃塘区', '450804', '56489', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56490', '1', '56486', '平南县', '450821', '56490', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56491', '1', '56486', '桂平市', '450881', '56491', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56492', '1', '56420', '玉林市', '450900', '56492', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56493', '1', '56492', '玉州区', '450902', '56493', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56494', '1', '56492', '容县', '450921', '56494', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56495', '1', '56492', '陆川县', '450922', '56495', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56496', '1', '56492', '博白县', '450923', '56496', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56497', '1', '56492', '兴业县', '450924', '56497', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56498', '1', '56492', '北流市', '450981', '56498', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56499', '1', '56420', '百色市', '451000', '56499', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56500', '1', '56499', '右江区', '451002', '56500', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56501', '1', '56499', '田阳县', '451021', '56501', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56502', '1', '56499', '田东县', '451022', '56502', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56503', '1', '56499', '平果县', '451023', '56503', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56504', '1', '56499', '德保县', '451024', '56504', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56505', '1', '56499', '靖西县', '451025', '56505', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56506', '1', '56499', '那坡县', '451026', '56506', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56507', '1', '56499', '凌云县', '451027', '56507', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56508', '1', '56499', '乐业县', '451028', '56508', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56509', '1', '56499', '田林县', '451029', '56509', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56510', '1', '56499', '西林县', '451030', '56510', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56511', '1', '56499', '隆林各族自治县', '451031', '56511', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56512', '1', '56420', '贺州市', '451100', '56512', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56513', '1', '56512', '八步区', '451102', '56513', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56514', '1', '56512', '昭平县', '451121', '56514', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56515', '1', '56512', '钟山县', '451122', '56515', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56516', '1', '56512', '富川瑶族自治县', '451123', '56516', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56517', '1', '56420', '河池市', '451200', '56517', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56518', '1', '56517', '金城江区', '451202', '56518', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56519', '1', '56517', '南丹县', '451221', '56519', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56520', '1', '56517', '天峨县', '451222', '56520', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56521', '1', '56517', '凤山县', '451223', '56521', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56522', '1', '56517', '东兰县', '451224', '56522', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56523', '1', '56517', '罗城仫佬族自治县', '451225', '56523', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56524', '1', '56517', '环江毛南族自治县', '451226', '56524', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56525', '1', '56517', '巴马瑶族自治县', '451227', '56525', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56526', '1', '56517', '都安瑶族自治县', '451228', '56526', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56527', '1', '56517', '大化瑶族自治县', '451229', '56527', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56528', '1', '56517', '宜州市', '451281', '56528', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56529', '1', '56420', '来宾市', '451300', '56529', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56530', '1', '56529', '兴宾区', '451302', '56530', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56531', '1', '56529', '忻城县', '451321', '56531', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56532', '1', '56529', '象州县', '451322', '56532', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56533', '1', '56529', '武宣县', '451323', '56533', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56534', '1', '56529', '金秀瑶族自治县', '451324', '56534', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56535', '1', '56529', '合山市', '451381', '56535', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56536', '1', '56420', '崇左市', '451400', '56536', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56537', '1', '56536', '江洲区', '451402', '56537', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56538', '1', '56536', '扶绥县', '451421', '56538', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56539', '1', '56536', '宁明县', '451422', '56539', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56540', '1', '56536', '龙州县', '451423', '56540', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56541', '1', '56536', '大新县', '451424', '56541', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56542', '1', '56536', '天等县', '451425', '56542', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56543', '1', '56536', '凭祥市', '451481', '56543', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56544', '1', '54317', '海南省', '460000', '56544', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56545', '1', '56544', '海口市', '460100', '56545', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56546', '1', '56545', '秀英区', '460105', '56546', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56547', '1', '56545', '龙华区', '460106', '56547', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56548', '1', '56545', '琼山区', '460107', '56548', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56549', '1', '56545', '美兰区', '460108', '56549', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56550', '1', '56544', '三亚市', '460200', '56550', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56551', '1', '56544', '三沙市\n', '460300', '56551', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56552', '1', '56551', '西沙群岛', '460321', '56552', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56553', '1', '56551', '南沙群岛', '460322', '56553', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56554', '1', '56551', '中沙群岛的岛礁及其海域', '460323', '56554', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56555', '1', '56544', '（省直辖县级行政区划）', '469000', '56555', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56556', '1', '56555', '五指山市', '469001', '56556', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56557', '1', '56555', '琼海市', '469002', '56557', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56558', '1', '56555', '儋州市', '469003', '56558', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56559', '1', '56555', '文昌市', '469005', '56559', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56560', '1', '56555', '万宁市', '469006', '56560', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56561', '1', '56555', '东方市', '469007', '56561', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56562', '1', '56555', '定安县', '469021', '56562', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56563', '1', '56555', '屯昌县', '469022', '56563', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56564', '1', '56555', '澄迈县', '469023', '56564', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56565', '1', '56555', '临高县', '469024', '56565', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56566', '1', '56555', '白沙黎族自治县', '469025', '56566', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56567', '1', '56555', '昌江黎族自治县', '469026', '56567', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56568', '1', '56555', '乐东黎族自治县', '469027', '56568', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56569', '1', '56555', '陵水黎族自治县', '469028', '56569', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56570', '1', '56555', '保亭黎族苗族自治县', '469029', '56570', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56571', '1', '56555', '琼中黎族苗族自治县', '469030', '56571', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56572', '1', '57618', '重庆市', '500100', '56572', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56573', '1', '56572', '万州区', '500101', '56573', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56574', '1', '56572', '涪陵区', '500102', '56574', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56575', '1', '56572', '渝中区', '500103', '56575', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56576', '1', '56572', '大渡口区', '500104', '56576', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56577', '1', '56572', '江北区', '500105', '56577', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56578', '1', '56572', '沙坪坝区', '500106', '56578', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56579', '1', '56572', '九龙坡区', '500107', '56579', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56580', '1', '56572', '南岸区', '500108', '56580', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56581', '1', '56572', '北碚区', '500109', '56581', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56582', '1', '56572', '万盛区', '500110', '56582', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56583', '1', '56572', '双桥区', '500111', '56583', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56584', '1', '56572', '渝北区', '500112', '56584', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56585', '1', '56572', '巴南区', '500113', '56585', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56586', '1', '56572', '黔江区', '500114', '56586', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56587', '1', '56572', '长寿区', '500115', '56587', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56588', '1', '56572', '江津区', '500116', '56588', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56589', '1', '56572', '合川区', '500117', '56589', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56590', '1', '56572', '永川区', '500118', '56590', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56591', '1', '56572', '南川区', '500119', '56591', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56592', '1', '56572', '綦江县', '500222', '56592', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56593', '1', '56572', '潼南县', '500223', '56593', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56594', '1', '56572', '铜梁县', '500224', '56594', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56595', '1', '56572', '大足县', '500225', '56595', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56596', '1', '56572', '荣昌县', '500226', '56596', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56597', '1', '56572', '璧山县', '500227', '56597', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56598', '1', '56572', '梁平县', '500228', '56598', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56599', '1', '56572', '城口县', '500229', '56599', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56600', '1', '56572', '丰都县', '500230', '56600', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56601', '1', '56572', '垫江县', '500231', '56601', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56602', '1', '56572', '武隆县', '500232', '56602', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56603', '1', '56572', '忠县', '500233', '56603', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56604', '1', '56572', '开县', '500234', '56604', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56605', '1', '56572', '云阳县', '500235', '56605', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56606', '1', '56572', '奉节县', '500236', '56606', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56607', '1', '56572', '巫山县', '500237', '56607', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56608', '1', '56572', '巫溪县', '500238', '56608', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56609', '1', '56572', '石柱土家族自治县', '500240', '56609', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56610', '1', '56572', '秀山土家族苗族自治县', '500241', '56610', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56611', '1', '56572', '酉阳土家族苗族自治县', '500242', '56611', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56612', '1', '56572', '彭水苗族土家族自治县', '500243', '56612', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56613', '1', '54317', '四川省', '510000', '56613', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56614', '1', '56613', '成都市', '510100', '56614', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56615', '1', '56614', '锦江区', '510104', '56615', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56616', '1', '56614', '青羊区', '510105', '56616', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56617', '1', '56614', '金牛区', '510106', '56617', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56618', '1', '56614', '武侯区', '510107', '56618', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56619', '1', '56614', '成华区', '510108', '56619', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56620', '1', '56614', '高新区', '510109', '56620', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56621', '1', '56614', '龙泉驿区', '510112', '56621', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56622', '1', '56614', '青白江区', '510113', '56622', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56623', '1', '56614', '新都区', '510114', '56623', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56624', '1', '56614', '温江区', '510115', '56624', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56625', '1', '56614', '金堂县', '510121', '56625', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56626', '1', '56614', '双流县', '510122', '56626', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56627', '1', '56614', '郫县', '510124', '56627', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56628', '1', '56614', '大邑县', '510129', '56628', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56629', '1', '56614', '蒲江县', '510131', '56629', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56630', '1', '56614', '新津县', '510132', '56630', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56631', '1', '56614', '都江堰市', '510181', '56631', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56632', '1', '56614', '彭州市', '510182', '56632', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56633', '1', '56614', '邛崃市', '510183', '56633', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56634', '1', '56614', '崇州市', '510184', '56634', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56635', '1', '56613', '自贡市', '510300', '56635', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56636', '1', '56635', '自流井区', '510302', '56636', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56637', '1', '56635', '贡井区', '510303', '56637', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56638', '1', '56635', '大安区', '510304', '56638', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56639', '1', '56635', '沿滩区', '510311', '56639', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56640', '1', '56635', '荣县', '510321', '56640', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56641', '1', '56635', '富顺县', '510322', '56641', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56642', '1', '56613', '攀枝花市', '510400', '56642', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56643', '1', '56642', '东区', '510402', '56643', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56644', '1', '56642', '西区', '510403', '56644', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56645', '1', '56642', '仁和区', '510411', '56645', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56646', '1', '56642', '米易县', '510421', '56646', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56647', '1', '56642', '盐边县', '510422', '56647', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56648', '1', '56613', '泸州市', '510500', '56648', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56649', '1', '56648', '江阳区', '510502', '56649', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56650', '1', '56648', '纳溪区', '510503', '56650', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56651', '1', '56648', '龙马潭区', '510504', '56651', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56652', '1', '56648', '泸县', '510521', '56652', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56653', '1', '56648', '合江县', '510522', '56653', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56654', '1', '56648', '叙永县', '510524', '56654', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56655', '1', '56648', '古蔺县', '510525', '56655', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56656', '1', '56613', '德阳市', '510600', '56656', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56657', '1', '56656', '旌阳区', '510603', '56657', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56658', '1', '56656', '中江县', '510623', '56658', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56659', '1', '56656', '罗江县', '510626', '56659', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56660', '1', '56656', '广汉市', '510681', '56660', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56661', '1', '56656', '什邡市', '510682', '56661', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56662', '1', '56656', '绵竹市', '510683', '56662', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56663', '1', '56613', '绵阳市', '510700', '56663', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56664', '1', '56663', '涪城区', '510703', '56664', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56665', '1', '56663', '游仙区', '510704', '56665', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56666', '1', '56663', '高新区', '510705', '56666', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56667', '1', '56663', '科学城', '510706', '56667', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56668', '1', '56663', '三台县', '510722', '56668', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56669', '1', '56663', '盐亭县', '510723', '56669', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56670', '1', '56663', '安县', '510724', '56670', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56671', '1', '56663', '梓潼县', '510725', '56671', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56672', '1', '56663', '北川羌族自治县', '510726', '56672', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56673', '1', '56663', '平武县', '510727', '56673', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56674', '1', '56663', '江油市', '510781', '56674', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56675', '1', '56613', '广元市', '510800', '56675', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56676', '1', '56675', '利州区', '510802', '56676', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56677', '1', '56675', '元坝区', '510811', '56677', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56678', '1', '56675', '朝天区', '510812', '56678', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56679', '1', '56675', '旺苍县', '510821', '56679', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56680', '1', '56675', '青川县', '510822', '56680', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56681', '1', '56675', '剑阁县', '510823', '56681', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56682', '1', '56675', '苍溪县', '510824', '56682', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56683', '1', '56613', '遂宁市', '510900', '56683', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56684', '1', '56683', '船山区', '510903', '56684', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56685', '1', '56683', '安居区', '510904', '56685', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56686', '1', '56683', '蓬溪县', '510921', '56686', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56687', '1', '56683', '射洪县', '510922', '56687', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56688', '1', '56683', '大英县', '510923', '56688', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56689', '1', '56613', '内江市', '511000', '56689', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56690', '1', '56689', '市中区', '511002', '56690', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56691', '1', '56689', '东兴区', '511011', '56691', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56692', '1', '56689', '威远县', '511024', '56692', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56693', '1', '56689', '资中县', '511025', '56693', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56694', '1', '56689', '隆昌县', '511028', '56694', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56695', '1', '56613', '乐山市', '511100', '56695', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56696', '1', '56695', '市中区', '511102', '56696', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56697', '1', '56695', '沙湾区', '511111', '56697', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56698', '1', '56695', '五通桥区', '511112', '56698', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56699', '1', '56695', '金口河区', '511113', '56699', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56700', '1', '56695', '犍为县', '511123', '56700', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56701', '1', '56695', '井研县', '511124', '56701', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56702', '1', '56695', '夹江县', '511126', '56702', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56703', '1', '56695', '沐川县', '511129', '56703', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56704', '1', '56695', '峨边彝族自治县', '511132', '56704', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56705', '1', '56695', '马边彝族自治县', '511133', '56705', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56706', '1', '56695', '峨眉山市', '511181', '56706', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56707', '1', '56613', '南充市', '511300', '56707', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56708', '1', '56707', '顺庆区', '511302', '56708', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56709', '1', '56707', '高坪区', '511303', '56709', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56710', '1', '56707', '嘉陵区', '511304', '56710', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56711', '1', '56707', '南部县', '511321', '56711', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56712', '1', '56707', '营山县', '511322', '56712', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56713', '1', '56707', '蓬安县', '511323', '56713', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56714', '1', '56707', '仪陇县', '511324', '56714', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56715', '1', '56707', '西充县', '511325', '56715', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56716', '1', '56707', '阆中市', '511381', '56716', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56717', '1', '56613', '眉山市', '511400', '56717', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56718', '1', '56717', '东坡区', '511402', '56718', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56719', '1', '56717', '仁寿县', '511421', '56719', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56720', '1', '56717', '彭山县', '511422', '56720', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56721', '1', '56717', '洪雅县', '511423', '56721', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56722', '1', '56717', '丹棱县', '511424', '56722', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56723', '1', '56717', '青神县', '511425', '56723', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56724', '1', '56613', '宜宾市', '511500', '56724', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56725', '1', '56724', '翠屏区', '511502', '56725', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56726', '1', '56724', '宜宾县', '511521', '56726', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56727', '1', '56724', '南溪县', '511522', '56727', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56728', '1', '56724', '江安县', '511523', '56728', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56729', '1', '56724', '长宁县', '511524', '56729', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56730', '1', '56724', '高县', '511525', '56730', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56731', '1', '56724', '珙县', '511526', '56731', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56732', '1', '56724', '筠连县', '511527', '56732', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56733', '1', '56724', '兴文县', '511528', '56733', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56734', '1', '56724', '屏山县', '511529', '56734', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56735', '1', '56613', '广安市', '511600', '56735', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56736', '1', '56735', '广安区', '511602', '56736', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56737', '1', '56735', '岳池县', '511621', '56737', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56738', '1', '56735', '武胜县', '511622', '56738', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56739', '1', '56735', '邻水县', '511623', '56739', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56740', '1', '56735', '华蓥市', '511681', '56740', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56741', '1', '56613', '达州市', '511700', '56741', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56742', '1', '56741', '通川区', '511702', '56742', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56743', '1', '56741', '达县', '511721', '56743', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56744', '1', '56741', '宣汉县', '511722', '56744', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56745', '1', '56741', '开江县', '511723', '56745', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56746', '1', '56741', '大竹县', '511724', '56746', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56747', '1', '56741', '渠县', '511725', '56747', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56748', '1', '56741', '万源市', '511781', '56748', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56749', '1', '56613', '雅安市', '511800', '56749', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56750', '1', '56749', '雨城区', '511802', '56750', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56751', '1', '56749', '名山县', '511821', '56751', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56752', '1', '56749', '荥经县', '511822', '56752', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56753', '1', '56749', '汉源县', '511823', '56753', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56754', '1', '56749', '石棉县', '511824', '56754', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56755', '1', '56749', '天全县', '511825', '56755', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56756', '1', '56749', '芦山县', '511826', '56756', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56757', '1', '56749', '宝兴县', '511827', '56757', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56758', '1', '56613', '巴中市', '511900', '56758', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56759', '1', '56758', '巴州区', '511902', '56759', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56760', '1', '56758', '通江县', '511921', '56760', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56761', '1', '56758', '南江县', '511922', '56761', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56762', '1', '56758', '平昌县', '511923', '56762', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56763', '1', '56613', '资阳市', '512000', '56763', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56764', '1', '56763', '雁江区', '512002', '56764', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56765', '1', '56763', '安岳县', '512021', '56765', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56766', '1', '56763', '乐至县', '512022', '56766', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56767', '1', '56763', '简阳市', '512081', '56767', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56768', '1', '56613', '阿坝藏族羌族自治州', '513200', '56768', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56769', '1', '56768', '汶川县', '513221', '56769', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56770', '1', '56768', '理县', '513222', '56770', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56771', '1', '56768', '茂县', '513223', '56771', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56772', '1', '56768', '松潘县', '513224', '56772', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56773', '1', '56768', '九寨沟县', '513225', '56773', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56774', '1', '56768', '金川县', '513226', '56774', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56775', '1', '56768', '小金县', '513227', '56775', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56776', '1', '56768', '黑水县', '513228', '56776', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56777', '1', '56768', '马尔康县', '513229', '56777', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56778', '1', '56768', '壤塘县', '513230', '56778', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56779', '1', '56768', '阿坝县', '513231', '56779', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56780', '1', '56768', '若尔盖县', '513232', '56780', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56781', '1', '56768', '红原县', '513233', '56781', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56782', '1', '56613', '甘孜藏族自治州', '513300', '56782', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56783', '1', '56782', '康定县', '513321', '56783', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56784', '1', '56782', '泸定县', '513322', '56784', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56785', '1', '56782', '丹巴县', '513323', '56785', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56786', '1', '56782', '九龙县', '513324', '56786', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56787', '1', '56782', '雅江县', '513325', '56787', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56788', '1', '56782', '道孚县', '513326', '56788', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56789', '1', '56782', '炉霍县', '513327', '56789', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56790', '1', '56782', '甘孜县', '513328', '56790', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56791', '1', '56782', '新龙县', '513329', '56791', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56792', '1', '56782', '德格县', '513330', '56792', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56793', '1', '56782', '白玉县', '513331', '56793', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56794', '1', '56782', '石渠县', '513332', '56794', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56795', '1', '56782', '色达县', '513333', '56795', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56796', '1', '56782', '理塘县', '513334', '56796', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56797', '1', '56782', '巴塘县', '513335', '56797', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56798', '1', '56782', '乡城县', '513336', '56798', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56799', '1', '56782', '稻城县', '513337', '56799', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56800', '1', '56782', '得荣县', '513338', '56800', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56801', '1', '56613', '凉山彝族自治州', '513400', '56801', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56802', '1', '56801', '西昌市', '513401', '56802', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56803', '1', '56801', '木里藏族自治县', '513422', '56803', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56804', '1', '56801', '盐源县', '513423', '56804', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56805', '1', '56801', '德昌县', '513424', '56805', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56806', '1', '56801', '会理县', '513425', '56806', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56807', '1', '56801', '会东县', '513426', '56807', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56808', '1', '56801', '宁南县', '513427', '56808', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56809', '1', '56801', '普格县', '513428', '56809', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56810', '1', '56801', '布拖县', '513429', '56810', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56811', '1', '56801', '金阳县', '513430', '56811', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56812', '1', '56801', '昭觉县', '513431', '56812', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56813', '1', '56801', '喜德县', '513432', '56813', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56814', '1', '56801', '冕宁县', '513433', '56814', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56815', '1', '56801', '越西县', '513434', '56815', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56816', '1', '56801', '甘洛县', '513435', '56816', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56817', '1', '56801', '美姑县', '513436', '56817', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56818', '1', '56801', '雷波县', '513437', '56818', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56819', '1', '54317', '贵州省', '520000', '56819', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56820', '1', '56819', '贵阳市', '520100', '56820', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56821', '1', '56820', '南明区', '520102', '56821', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56822', '1', '56820', '云岩区', '520103', '56822', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56823', '1', '56820', '花溪区', '520111', '56823', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56824', '1', '56820', '乌当区', '520112', '56824', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56825', '1', '56820', '白云区', '520113', '56825', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56826', '1', '56820', '小河区', '520114', '56826', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56827', '1', '56820', '开阳县', '520121', '56827', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56828', '1', '56820', '息烽县', '520122', '56828', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56829', '1', '56820', '修文县', '520123', '56829', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56830', '1', '56820', '清镇市', '520181', '56830', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56831', '1', '56819', '六盘水市', '520200', '56831', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56832', '1', '56831', '钟山区', '520201', '56832', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56833', '1', '56831', '六枝特区', '520203', '56833', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56834', '1', '56831', '水城县', '520221', '56834', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56835', '1', '56831', '盘县', '520222', '56835', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56836', '1', '56819', '遵义市', '520300', '56836', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56837', '1', '56836', '红花岗区', '520302', '56837', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56838', '1', '56836', '汇川区', '520303', '56838', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56839', '1', '56836', '遵义县', '520321', '56839', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56840', '1', '56836', '桐梓县', '520322', '56840', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56841', '1', '56836', '绥阳县', '520323', '56841', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56842', '1', '56836', '正安县', '520324', '56842', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56843', '1', '56836', '道真仡佬族苗族自治县', '520325', '56843', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56844', '1', '56836', '务川仡佬族苗族自治县', '520326', '56844', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56845', '1', '56836', '凤冈县', '520327', '56845', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56846', '1', '56836', '湄潭县', '520328', '56846', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56847', '1', '56836', '余庆县', '520329', '56847', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56848', '1', '56836', '习水县', '520330', '56848', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56849', '1', '56836', '赤水市', '520381', '56849', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56850', '1', '56836', '仁怀市', '520382', '56850', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56851', '1', '56819', '安顺市', '520400', '56851', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56852', '1', '56851', '西秀区', '520402', '56852', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56853', '1', '56851', '平坝县', '520421', '56853', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56854', '1', '56851', '普定县', '520422', '56854', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56855', '1', '56851', '镇宁布依族苗族自治县', '520423', '56855', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56856', '1', '56851', '关岭布依族苗族自治县', '520424', '56856', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56857', '1', '56851', '紫云苗族布依族自治县', '520425', '56857', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56858', '1', '56819', '铜仁地区', '522200', '56858', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56859', '1', '56858', '铜仁市', '522201', '56859', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56860', '1', '56858', '江口县', '522222', '56860', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56861', '1', '56858', '玉屏侗族自治县', '522223', '56861', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56862', '1', '56858', '石阡县', '522224', '56862', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56863', '1', '56858', '思南县', '522225', '56863', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56864', '1', '56858', '印江土家族苗族自治县', '522226', '56864', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56865', '1', '56858', '德江县', '522227', '56865', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56866', '1', '56858', '沿河土家族自治县', '522228', '56866', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56867', '1', '56858', '松桃苗族自治县', '522229', '56867', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56868', '1', '56858', '万山特区', '522230', '56868', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56869', '1', '56819', '黔西南布依族苗族自治州', '522300', '56869', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56870', '1', '56869', '兴义市', '522301', '56870', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56871', '1', '56869', '兴仁县', '522322', '56871', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56872', '1', '56869', '普安县', '522323', '56872', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56873', '1', '56869', '晴隆县', '522324', '56873', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56874', '1', '56869', '贞丰县', '522325', '56874', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56875', '1', '56869', '望谟县', '522326', '56875', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56876', '1', '56869', '册亨县', '522327', '56876', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56877', '1', '56869', '安龙县', '522328', '56877', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56878', '1', '56819', '毕节地区', '522400', '56878', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56879', '1', '56878', '毕节市', '522401', '56879', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56880', '1', '56878', '大方县', '522422', '56880', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56881', '1', '56878', '黔西县', '522423', '56881', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56882', '1', '56878', '金沙县', '522424', '56882', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56883', '1', '56878', '织金县', '522425', '56883', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56884', '1', '56878', '纳雍县', '522426', '56884', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56885', '1', '56878', '威宁彝族回族苗族自治县', '522427', '56885', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56886', '1', '56878', '赫章县', '522428', '56886', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56887', '1', '56819', '黔东南苗族侗族自治州', '522600', '56887', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56888', '1', '56887', '凯里市', '522601', '56888', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56889', '1', '56887', '黄平县', '522622', '56889', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56890', '1', '56887', '施秉县', '522623', '56890', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56891', '1', '56887', '三穗县', '522624', '56891', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56892', '1', '56887', '镇远县', '522625', '56892', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56893', '1', '56887', '岑巩县', '522626', '56893', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56894', '1', '56887', '天柱县', '522627', '56894', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56895', '1', '56887', '锦屏县', '522628', '56895', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56896', '1', '56887', '剑河县', '522629', '56896', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56897', '1', '56887', '台江县', '522630', '56897', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56898', '1', '56887', '黎平县', '522631', '56898', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56899', '1', '56887', '榕江县', '522632', '56899', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56900', '1', '56887', '从江县', '522633', '56900', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56901', '1', '56887', '雷山县', '522634', '56901', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56902', '1', '56887', '麻江县', '522635', '56902', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56903', '1', '56887', '丹寨县', '522636', '56903', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56904', '1', '56819', '黔南布依族苗族自治州', '522700', '56904', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56905', '1', '56904', '都匀市', '522701', '56905', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56906', '1', '56904', '福泉市', '522702', '56906', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56907', '1', '56904', '荔波县', '522722', '56907', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56908', '1', '56904', '贵定县', '522723', '56908', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56909', '1', '56904', '瓮安县', '522725', '56909', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56910', '1', '56904', '独山县', '522726', '56910', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56911', '1', '56904', '平塘县', '522727', '56911', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56912', '1', '56904', '罗甸县', '522728', '56912', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56913', '1', '56904', '长顺县', '522729', '56913', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56914', '1', '56904', '龙里县', '522730', '56914', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56915', '1', '56904', '惠水县', '522731', '56915', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56916', '1', '56904', '三都水族自治县', '522732', '56916', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56917', '1', '54317', '云南省', '530000', '56917', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56918', '1', '56917', '昆明市', '530100', '56918', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56919', '1', '56918', '五华区', '530102', '56919', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56920', '1', '56918', '盘龙区', '530103', '56920', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56921', '1', '56918', '官渡区', '530111', '56921', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56922', '1', '56918', '西山区', '530112', '56922', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56923', '1', '56918', '东川区', '530113', '56923', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56924', '1', '56918', '呈贡县', '530121', '56924', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56925', '1', '56918', '晋宁县', '530122', '56925', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56926', '1', '56918', '富民县', '530124', '56926', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56927', '1', '56918', '宜良县', '530125', '56927', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56928', '1', '56918', '石林彝族自治县', '530126', '56928', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56929', '1', '56918', '嵩明县', '530127', '56929', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56930', '1', '56918', '禄劝彝族苗族自治县', '530128', '56930', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56931', '1', '56918', '寻甸回族彝族自治县', '530129', '56931', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56932', '1', '56918', '安宁市', '530181', '56932', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56933', '1', '56917', '曲靖市', '530300', '56933', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56934', '1', '56933', '麒麟区', '530302', '56934', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56935', '1', '56933', '马龙县', '530321', '56935', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56936', '1', '56933', '陆良县', '530322', '56936', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56937', '1', '56933', '师宗县', '530323', '56937', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56938', '1', '56933', '罗平县', '530324', '56938', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56939', '1', '56933', '富源县', '530325', '56939', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56940', '1', '56933', '会泽县', '530326', '56940', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56941', '1', '56933', '沾益县', '530328', '56941', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56942', '1', '56933', '宣威市', '530381', '56942', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56943', '1', '56917', '玉溪市', '530400', '56943', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56944', '1', '56943', '红塔区', '530402', '56944', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56945', '1', '56943', '江川县', '530421', '56945', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56946', '1', '56943', '澄江县', '530422', '56946', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56947', '1', '56943', '通海县', '530423', '56947', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56948', '1', '56943', '华宁县', '530424', '56948', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56949', '1', '56943', '易门县', '530425', '56949', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56950', '1', '56943', '峨山彝族自治县', '530426', '56950', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56951', '1', '56943', '新平彝族傣族自治县', '530427', '56951', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56952', '1', '56943', '元江哈尼族彝族傣族自治县', '530428', '56952', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56953', '1', '56917', '保山市', '530500', '56953', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56954', '1', '56953', '隆阳区', '530502', '56954', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56955', '1', '56953', '施甸县', '530521', '56955', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56956', '1', '56953', '腾冲县', '530522', '56956', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56957', '1', '56953', '龙陵县', '530523', '56957', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56958', '1', '56953', '昌宁县', '530524', '56958', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56959', '1', '56917', '昭通市', '530600', '56959', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56960', '1', '56959', '昭阳区', '530602', '56960', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56961', '1', '56959', '鲁甸县', '530621', '56961', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56962', '1', '56959', '巧家县', '530622', '56962', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56963', '1', '56959', '盐津县', '530623', '56963', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56964', '1', '56959', '大关县', '530624', '56964', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56965', '1', '56959', '永善县', '530625', '56965', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56966', '1', '56959', '绥江县', '530626', '56966', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56967', '1', '56959', '镇雄县', '530627', '56967', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56968', '1', '56959', '彝良县', '530628', '56968', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56969', '1', '56959', '威信县', '530629', '56969', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56970', '1', '56959', '水富县', '530630', '56970', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56971', '1', '56917', '丽江市', '530700', '56971', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56972', '1', '56971', '古城区', '530702', '56972', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56973', '1', '56971', '玉龙纳西族自治县', '530721', '56973', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56974', '1', '56971', '永胜县', '530722', '56974', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56975', '1', '56971', '华坪县', '530723', '56975', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56976', '1', '56971', '宁蒗彝族自治县', '530724', '56976', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56977', '1', '56917', '普洱市', '530800', '56977', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56978', '1', '56977', '思茅区', '530802', '56978', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56979', '1', '56977', '宁洱哈尼族彝族自治县', '530821', '56979', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56980', '1', '56977', '墨江哈尼族自治县', '530822', '56980', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56981', '1', '56977', '景东彝族自治县', '530823', '56981', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56982', '1', '56977', '景谷傣族彝族自治县', '530824', '56982', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56983', '1', '56977', '镇沅彝族哈尼族拉祜族自治县', '530825', '56983', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56984', '1', '56977', '江城哈尼族彝族自治县', '530826', '56984', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56985', '1', '56977', '孟连傣族拉祜族佤族自治县', '530827', '56985', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56986', '1', '56977', '澜沧拉祜族自治县', '530828', '56986', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56987', '1', '56977', '西盟佤族自治县', '530829', '56987', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56988', '1', '56917', '临沧市', '530900', '56988', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56989', '1', '56988', '临翔区', '530902', '56989', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56990', '1', '56988', '凤庆县', '530921', '56990', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56991', '1', '56988', '云县', '530922', '56991', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56992', '1', '56988', '永德县', '530923', '56992', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56993', '1', '56988', '镇康县', '530924', '56993', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56994', '1', '56988', '双江拉祜族佤族布朗族傣族自治县', '530925', '56994', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56995', '1', '56988', '耿马傣族佤族自治县', '530926', '56995', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56996', '1', '56988', '沧源佤族自治县', '530927', '56996', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56997', '1', '56917', '楚雄彝族自治州', '532300', '56997', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56998', '1', '56997', '楚雄市', '532301', '56998', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('56999', '1', '56997', '双柏县', '532322', '56999', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57000', '1', '56997', '牟定县', '532323', '57000', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57001', '1', '56997', '南华县', '532324', '57001', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57002', '1', '56997', '姚安县', '532325', '57002', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57003', '1', '56997', '大姚县', '532326', '57003', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57004', '1', '56997', '永仁县', '532327', '57004', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57005', '1', '56997', '元谋县', '532328', '57005', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57006', '1', '56997', '武定县', '532329', '57006', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57007', '1', '56997', '禄丰县', '532331', '57007', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57008', '1', '56917', '红河哈尼族彝族自治州', '532500', '57008', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57009', '1', '57008', '个旧市', '532501', '57009', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57010', '1', '57008', '开远市', '532502', '57010', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57011', '1', '57008', '蒙自县', '532522', '57011', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57012', '1', '57008', '屏边苗族自治县', '532523', '57012', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57013', '1', '57008', '建水县', '532524', '57013', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57014', '1', '57008', '石屏县', '532525', '57014', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57015', '1', '57008', '弥勒县', '532526', '57015', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57016', '1', '57008', '泸西县', '532527', '57016', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57017', '1', '57008', '元阳县', '532528', '57017', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57018', '1', '57008', '红河县', '532529', '57018', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57019', '1', '57008', '金平苗族瑶族傣族自治县', '532530', '57019', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57020', '1', '57008', '绿春县', '532531', '57020', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57021', '1', '57008', '河口瑶族自治县', '532532', '57021', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57022', '1', '56917', '文山壮族苗族自治州', '532600', '57022', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57023', '1', '57022', '文山县', '532621', '57023', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57024', '1', '57022', '砚山县', '532622', '57024', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57025', '1', '57022', '西畴县', '532623', '57025', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57026', '1', '57022', '麻栗坡县', '532624', '57026', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57027', '1', '57022', '马关县', '532625', '57027', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57028', '1', '57022', '丘北县', '532626', '57028', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57029', '1', '57022', '广南县', '532627', '57029', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57030', '1', '57022', '富宁县', '532628', '57030', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57031', '1', '56917', '西双版纳傣族自治州', '532800', '57031', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57032', '1', '57031', '景洪市', '532801', '57032', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57033', '1', '57031', '勐海县', '532822', '57033', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57034', '1', '57031', '勐腊县', '532823', '57034', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57035', '1', '56917', '大理白族自治州', '532900', '57035', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57036', '1', '57035', '大理市', '532901', '57036', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57037', '1', '57035', '漾濞彝族自治县', '532922', '57037', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57038', '1', '57035', '祥云县', '532923', '57038', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57039', '1', '57035', '宾川县', '532924', '57039', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57040', '1', '57035', '弥渡县', '532925', '57040', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57041', '1', '57035', '南涧彝族自治县', '532926', '57041', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57042', '1', '57035', '巍山彝族回族自治县', '532927', '57042', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57043', '1', '57035', '永平县', '532928', '57043', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57044', '1', '57035', '云龙县', '532929', '57044', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57045', '1', '57035', '洱源县', '532930', '57045', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57046', '1', '57035', '剑川县', '532931', '57046', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57047', '1', '57035', '鹤庆县', '532932', '57047', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57048', '1', '56917', '德宏傣族景颇族自治州', '533100', '57048', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57049', '1', '57048', '瑞丽市', '533102', '57049', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57050', '1', '57048', '潞西市', '533103', '57050', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57051', '1', '57048', '梁河县', '533122', '57051', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57052', '1', '57048', '盈江县', '533123', '57052', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57053', '1', '57048', '陇川县', '533124', '57053', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57054', '1', '56917', '怒江傈僳族自治州', '533300', '57054', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57055', '1', '57054', '泸水县', '533321', '57055', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57056', '1', '57054', '福贡县', '533323', '57056', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57057', '1', '57054', '贡山独龙族怒族自治县', '533324', '57057', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57058', '1', '57054', '兰坪白族普米族自治县', '533325', '57058', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57059', '1', '56917', '迪庆藏族自治州', '533400', '57059', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57060', '1', '57059', '香格里拉县', '533421', '57060', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57061', '1', '57059', '德钦县', '533422', '57061', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57062', '1', '57059', '维西傈僳族自治县', '533423', '57062', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57063', '1', '54317', '西藏自治区', '540000', '57063', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57064', '1', '57063', '拉萨市', '540100', '57064', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57065', '1', '57064', '城关区', '540102', '57065', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57066', '1', '57064', '林周县', '540121', '57066', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57067', '1', '57064', '当雄县', '540122', '57067', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57068', '1', '57064', '尼木县', '540123', '57068', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57069', '1', '57064', '曲水县', '540124', '57069', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57070', '1', '57064', '堆龙德庆县', '540125', '57070', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57071', '1', '57064', '达孜县', '540126', '57071', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57072', '1', '57064', '墨竹工卡县', '540127', '57072', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57073', '1', '57063', '昌都地区', '542100', '57073', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57074', '1', '57073', '昌都县', '542121', '57074', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57075', '1', '57073', '江达县', '542122', '57075', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57076', '1', '57073', '贡觉县', '542123', '57076', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57077', '1', '57073', '类乌齐县', '542124', '57077', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57078', '1', '57073', '丁青县', '542125', '57078', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57079', '1', '57073', '察雅县', '542126', '57079', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57080', '1', '57073', '八宿县', '542127', '57080', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57081', '1', '57073', '左贡县', '542128', '57081', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57082', '1', '57073', '芒康县', '542129', '57082', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57083', '1', '57073', '洛隆县', '542132', '57083', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57084', '1', '57073', '边坝县', '542133', '57084', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57085', '1', '57063', '山南地区', '542200', '57085', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57086', '1', '57085', '乃东县', '542221', '57086', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57087', '1', '57085', '扎囊县', '542222', '57087', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57088', '1', '57085', '贡嘎县', '542223', '57088', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57089', '1', '57085', '桑日县', '542224', '57089', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57090', '1', '57085', '琼结县', '542225', '57090', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57091', '1', '57085', '曲松县', '542226', '57091', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57092', '1', '57085', '措美县', '542227', '57092', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57093', '1', '57085', '洛扎县', '542228', '57093', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57094', '1', '57085', '加查县', '542229', '57094', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57095', '1', '57085', '隆子县', '542231', '57095', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57096', '1', '57085', '错那县', '542232', '57096', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57097', '1', '57085', '浪卡子县', '542233', '57097', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57098', '1', '57063', '日喀则地区', '542300', '57098', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57099', '1', '57098', '日喀则市', '542301', '57099', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57100', '1', '57098', '南木林县', '542322', '57100', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57101', '1', '57098', '江孜县', '542323', '57101', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57102', '1', '57098', '定日县', '542324', '57102', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57103', '1', '57098', '萨迦县', '542325', '57103', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57104', '1', '57098', '拉孜县', '542326', '57104', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57105', '1', '57098', '昂仁县', '542327', '57105', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57106', '1', '57098', '谢通门县', '542328', '57106', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57107', '1', '57098', '白朗县', '542329', '57107', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57108', '1', '57098', '仁布县', '542330', '57108', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57109', '1', '57098', '康马县', '542331', '57109', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57110', '1', '57098', '定结县', '542332', '57110', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57111', '1', '57098', '仲巴县', '542333', '57111', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57112', '1', '57098', '亚东县', '542334', '57112', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57113', '1', '57098', '吉隆县', '542335', '57113', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57114', '1', '57098', '聂拉木县', '542336', '57114', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57115', '1', '57098', '萨嘎县', '542337', '57115', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57116', '1', '57098', '岗巴县', '542338', '57116', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57117', '1', '57063', '那曲地区', '542400', '57117', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57118', '1', '57117', '那曲县', '542421', '57118', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57119', '1', '57117', '嘉黎县', '542422', '57119', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57120', '1', '57117', '比如县', '542423', '57120', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57121', '1', '57117', '聂荣县', '542424', '57121', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57122', '1', '57117', '安多县', '542425', '57122', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57123', '1', '57117', '申扎县', '542426', '57123', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57124', '1', '57117', '索县', '542427', '57124', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57125', '1', '57117', '班戈县', '542428', '57125', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57126', '1', '57117', '巴青县', '542429', '57126', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57127', '1', '57117', '尼玛县', '542430', '57127', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57128', '1', '57063', '阿里地区', '542500', '57128', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57129', '1', '57128', '普兰县', '542521', '57129', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57130', '1', '57128', '札达县', '542522', '57130', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57131', '1', '57128', '噶尔县', '542523', '57131', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57132', '1', '57128', '日土县', '542524', '57132', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57133', '1', '57128', '革吉县', '542525', '57133', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57134', '1', '57128', '改则县', '542526', '57134', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57135', '1', '57128', '措勤县', '542527', '57135', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57136', '1', '57063', '林芝地区', '542600', '57136', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57137', '1', '57136', '林芝县', '542621', '57137', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57138', '1', '57136', '工布江达县', '542622', '57138', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57139', '1', '57136', '米林县', '542623', '57139', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57140', '1', '57136', '墨脱县', '542624', '57140', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57141', '1', '57136', '波密县', '542625', '57141', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57142', '1', '57136', '察隅县', '542626', '57142', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57143', '1', '57136', '朗县', '542627', '57143', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57144', '1', '54317', '陕西省', '610000', '57144', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57145', '1', '57144', '西安市', '610100', '57145', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57146', '1', '57145', '新城区', '610102', '57146', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57147', '1', '57145', '碑林区', '610103', '57147', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57148', '1', '57145', '莲湖区', '610104', '57148', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57149', '1', '57145', '灞桥区', '610111', '57149', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57150', '1', '57145', '未央区', '610112', '57150', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57151', '1', '57145', '雁塔区', '610113', '57151', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57152', '1', '57145', '阎良区', '610114', '57152', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57153', '1', '57145', '临潼区', '610115', '57153', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57154', '1', '57145', '长安区', '610116', '57154', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57155', '1', '57145', '蓝田县', '610122', '57155', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57156', '1', '57145', '周至县', '610124', '57156', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57157', '1', '57145', '户县', '610125', '57157', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57158', '1', '57145', '高陵县', '610126', '57158', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57159', '1', '57144', '铜川市', '610200', '57159', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57160', '1', '57159', '王益区', '610202', '57160', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57161', '1', '57159', '印台区', '610203', '57161', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57162', '1', '57159', '耀州区', '610204', '57162', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57163', '1', '57159', '宜君县', '610222', '57163', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57164', '1', '57144', '宝鸡市', '610300', '57164', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57165', '1', '57164', '渭滨区', '610302', '57165', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57166', '1', '57164', '金台区', '610303', '57166', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57167', '1', '57164', '陈仓区', '610304', '57167', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57168', '1', '57164', '凤翔县', '610322', '57168', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57169', '1', '57164', '岐山县', '610323', '57169', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57170', '1', '57164', '扶风县', '610324', '57170', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57171', '1', '57164', '眉县', '610326', '57171', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57172', '1', '57164', '陇县', '610327', '57172', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57173', '1', '57164', '千阳县', '610328', '57173', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57174', '1', '57164', '麟游县', '610329', '57174', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57175', '1', '57164', '凤县', '610330', '57175', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57176', '1', '57164', '太白县', '610331', '57176', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57177', '1', '57144', '咸阳市', '610400', '57177', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57178', '1', '57177', '秦都区', '610402', '57178', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57179', '1', '57177', '杨凌区', '610403', '57179', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57180', '1', '57177', '渭城区', '610404', '57180', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57181', '1', '57177', '三原县', '610422', '57181', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57182', '1', '57177', '泾阳县', '610423', '57182', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57183', '1', '57177', '乾县', '610424', '57183', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57184', '1', '57177', '礼泉县', '610425', '57184', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57185', '1', '57177', '永寿县', '610426', '57185', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57186', '1', '57177', '彬县', '610427', '57186', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57187', '1', '57177', '长武县', '610428', '57187', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57188', '1', '57177', '旬邑县', '610429', '57188', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57189', '1', '57177', '淳化县', '610430', '57189', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57190', '1', '57177', '武功县', '610431', '57190', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57191', '1', '57177', '兴平市', '610481', '57191', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57192', '1', '57144', '渭南市', '610500', '57192', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57193', '1', '57192', '临渭区', '610502', '57193', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57194', '1', '57192', '华县', '610521', '57194', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57195', '1', '57192', '潼关县', '610522', '57195', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57196', '1', '57192', '大荔县', '610523', '57196', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57197', '1', '57192', '合阳县', '610524', '57197', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57198', '1', '57192', '澄城县', '610525', '57198', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57199', '1', '57192', '蒲城县', '610526', '57199', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57200', '1', '57192', '白水县', '610527', '57200', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57201', '1', '57192', '富平县', '610528', '57201', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57202', '1', '57192', '韩城市', '610581', '57202', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57203', '1', '57192', '华阴市', '610582', '57203', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57204', '1', '57144', '延安市', '610600', '57204', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57205', '1', '57204', '宝塔区', '610602', '57205', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57206', '1', '57204', '延长县', '610621', '57206', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57207', '1', '57204', '延川县', '610622', '57207', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57208', '1', '57204', '子长县', '610623', '57208', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57209', '1', '57204', '安塞县', '610624', '57209', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57210', '1', '57204', '志丹县', '610625', '57210', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57211', '1', '57204', '吴起县', '610626', '57211', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57212', '1', '57204', '甘泉县', '610627', '57212', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57213', '1', '57204', '富县', '610628', '57213', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57214', '1', '57204', '洛川县', '610629', '57214', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57215', '1', '57204', '宜川县', '610630', '57215', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57216', '1', '57204', '黄龙县', '610631', '57216', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57217', '1', '57204', '黄陵县', '610632', '57217', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57218', '1', '57144', '汉中市', '610700', '57218', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57219', '1', '57218', '汉台区', '610702', '57219', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57220', '1', '57218', '南郑县', '610721', '57220', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57221', '1', '57218', '城固县', '610722', '57221', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57222', '1', '57218', '洋县', '610723', '57222', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57223', '1', '57218', '西乡县', '610724', '57223', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57224', '1', '57218', '勉县', '610725', '57224', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57225', '1', '57218', '宁强县', '610726', '57225', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57226', '1', '57218', '略阳县', '610727', '57226', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57227', '1', '57218', '镇巴县', '610728', '57227', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57228', '1', '57218', '留坝县', '610729', '57228', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57229', '1', '57218', '佛坪县', '610730', '57229', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57230', '1', '57144', '榆林市', '610800', '57230', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57231', '1', '57230', '榆阳区', '610802', '57231', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57232', '1', '57230', '神木县', '610821', '57232', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57233', '1', '57230', '府谷县', '610822', '57233', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57234', '1', '57230', '横山县', '610823', '57234', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57235', '1', '57230', '靖边县', '610824', '57235', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57236', '1', '57230', '定边县', '610825', '57236', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57237', '1', '57230', '绥德县', '610826', '57237', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57238', '1', '57230', '米脂县', '610827', '57238', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57239', '1', '57230', '佳县', '610828', '57239', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57240', '1', '57230', '吴堡县', '610829', '57240', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57241', '1', '57230', '清涧县', '610830', '57241', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57242', '1', '57230', '子洲县', '610831', '57242', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57243', '1', '57144', '安康市', '610900', '57243', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57244', '1', '57243', '汉滨区', '610902', '57244', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57245', '1', '57243', '汉阴县', '610921', '57245', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57246', '1', '57243', '石泉县', '610922', '57246', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57247', '1', '57243', '宁陕县', '610923', '57247', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57248', '1', '57243', '紫阳县', '610924', '57248', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57249', '1', '57243', '岚皋县', '610925', '57249', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57250', '1', '57243', '平利县', '610926', '57250', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57251', '1', '57243', '镇坪县', '610927', '57251', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57252', '1', '57243', '旬阳县', '610928', '57252', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57253', '1', '57243', '白河县', '610929', '57253', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57254', '1', '57144', '商洛市', '611000', '57254', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57255', '1', '57254', '商州区', '611002', '57255', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57256', '1', '57254', '洛南县', '611021', '57256', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57257', '1', '57254', '丹凤县', '611022', '57257', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57258', '1', '57254', '商南县', '611023', '57258', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57259', '1', '57254', '山阳县', '611024', '57259', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57260', '1', '57254', '镇安县', '611025', '57260', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57261', '1', '57254', '柞水县', '611026', '57261', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57262', '1', '54317', '甘肃省', '620000', '57262', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57263', '1', '57262', '兰州市', '620100', '57263', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57264', '1', '57263', '城关区', '620102', '57264', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57265', '1', '57263', '七里河区', '620103', '57265', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57266', '1', '57263', '西固区', '620104', '57266', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57267', '1', '57263', '安宁区', '620105', '57267', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57268', '1', '57263', '红古区', '620111', '57268', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57269', '1', '57263', '永登县', '620121', '57269', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57270', '1', '57263', '皋兰县', '620122', '57270', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57271', '1', '57263', '榆中县', '620123', '57271', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57272', '1', '57262', '嘉峪关市', '620200', '57272', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57273', '1', '57262', '金昌市', '620300', '57273', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57274', '1', '57273', '金川区', '620302', '57274', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57275', '1', '57273', '永昌县', '620321', '57275', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57276', '1', '57262', '白银市', '620400', '57276', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57277', '1', '57276', '白银区', '620402', '57277', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57278', '1', '57276', '平川区', '620403', '57278', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57279', '1', '57276', '靖远县', '620421', '57279', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57280', '1', '57276', '会宁县', '620422', '57280', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57281', '1', '57276', '景泰县', '620423', '57281', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57282', '1', '57262', '天水市', '620500', '57282', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57283', '1', '57282', '秦州区', '620502', '57283', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57284', '1', '57282', '麦积区', '620503', '57284', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57285', '1', '57282', '清水县', '620521', '57285', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57286', '1', '57282', '秦安县', '620522', '57286', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57287', '1', '57282', '甘谷县', '620523', '57287', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57288', '1', '57282', '武山县', '620524', '57288', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57289', '1', '57282', '张家川回族自治县', '620525', '57289', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57290', '1', '57262', '武威市', '620600', '57290', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57291', '1', '57290', '凉州区', '620602', '57291', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57292', '1', '57290', '民勤县', '620621', '57292', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57293', '1', '57290', '古浪县', '620622', '57293', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57294', '1', '57290', '天祝藏族自治县', '620623', '57294', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57295', '1', '57262', '张掖市', '620700', '57295', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57296', '1', '57295', '甘州区', '620702', '57296', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57297', '1', '57295', '肃南裕固族自治县', '620721', '57297', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57298', '1', '57295', '民乐县', '620722', '57298', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57299', '1', '57295', '临泽县', '620723', '57299', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57300', '1', '57295', '高台县', '620724', '57300', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57301', '1', '57295', '山丹县', '620725', '57301', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57302', '1', '57262', '平凉市', '620800', '57302', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57303', '1', '57302', '崆峒区', '620802', '57303', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57304', '1', '57302', '泾川县', '620821', '57304', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57305', '1', '57302', '灵台县', '620822', '57305', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57306', '1', '57302', '崇信县', '620823', '57306', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57307', '1', '57302', '华亭县', '620824', '57307', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57308', '1', '57302', '庄浪县', '620825', '57308', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57309', '1', '57302', '静宁县', '620826', '57309', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57310', '1', '57262', '酒泉市', '620900', '57310', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57311', '1', '57310', '肃州区', '620902', '57311', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57312', '1', '57310', '金塔县', '620921', '57312', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57313', '1', '57310', '瓜州县', '620922', '57313', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57314', '1', '57310', '肃北蒙古族自治县', '620923', '57314', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57315', '1', '57310', '阿克塞哈萨克族自治县', '620924', '57315', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57316', '1', '57310', '玉门市', '620981', '57316', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57317', '1', '57310', '敦煌市', '620982', '57317', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57318', '1', '57262', '庆阳市', '621000', '57318', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57319', '1', '57318', '西峰区', '621002', '57319', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57320', '1', '57318', '庆城县', '621021', '57320', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57321', '1', '57318', '环县', '621022', '57321', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57322', '1', '57318', '华池县', '621023', '57322', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57323', '1', '57318', '合水县', '621024', '57323', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57324', '1', '57318', '正宁县', '621025', '57324', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57325', '1', '57318', '宁县', '621026', '57325', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57326', '1', '57318', '镇原县', '621027', '57326', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57327', '1', '57262', '定西市', '621100', '57327', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57328', '1', '57327', '安定区', '621102', '57328', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57329', '1', '57327', '通渭县', '621121', '57329', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57330', '1', '57327', '陇西县', '621122', '57330', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57331', '1', '57327', '渭源县', '621123', '57331', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57332', '1', '57327', '临洮县', '621124', '57332', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57333', '1', '57327', '漳县', '621125', '57333', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57334', '1', '57327', '岷县', '621126', '57334', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57335', '1', '57262', '陇南市', '621200', '57335', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57336', '1', '57335', '武都区', '621202', '57336', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57337', '1', '57335', '成县', '621221', '57337', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57338', '1', '57335', '文县', '621222', '57338', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57339', '1', '57335', '宕昌县', '621223', '57339', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57340', '1', '57335', '康县', '621224', '57340', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57341', '1', '57335', '西和县', '621225', '57341', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57342', '1', '57335', '礼县', '621226', '57342', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57343', '1', '57335', '徽县', '621227', '57343', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57344', '1', '57335', '两当县', '621228', '57344', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57345', '1', '57262', '临夏回族自治州', '622900', '57345', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57346', '1', '57345', '临夏市', '622901', '57346', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57347', '1', '57345', '临夏县', '622921', '57347', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57348', '1', '57345', '康乐县', '622922', '57348', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57349', '1', '57345', '永靖县', '622923', '57349', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57350', '1', '57345', '广河县', '622924', '57350', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57351', '1', '57345', '和政县', '622925', '57351', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57352', '1', '57345', '东乡族自治县', '622926', '57352', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57353', '1', '57345', '积石山保安族东乡族撒拉族自治县', '622927', '57353', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57354', '1', '57262', '甘南藏族自治州', '623000', '57354', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57355', '1', '57354', '合作市', '623001', '57355', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57356', '1', '57354', '临潭县', '623021', '57356', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57357', '1', '57354', '卓尼县', '623022', '57357', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57358', '1', '57354', '舟曲县', '623023', '57358', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57359', '1', '57354', '迭部县', '623024', '57359', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57360', '1', '57354', '玛曲县', '623025', '57360', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57361', '1', '57354', '碌曲县', '623026', '57361', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57362', '1', '57354', '夏河县', '623027', '57362', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57363', '1', '54317', '青海省', '630000', '57363', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57364', '1', '57363', '西宁市', '630100', '57364', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57365', '1', '57364', '城东区', '630102', '57365', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57366', '1', '57364', '城中区', '630103', '57366', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57367', '1', '57364', '城西区', '630104', '57367', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57368', '1', '57364', '城北区', '630105', '57368', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57369', '1', '57364', '大通回族土族自治县', '630121', '57369', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57370', '1', '57364', '湟中县', '630122', '57370', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57371', '1', '57364', '湟源县', '630123', '57371', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57372', '1', '57363', '海东地区', '632100', '57372', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57373', '1', '57372', '平安县', '632121', '57373', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57374', '1', '57372', '民和回族土族自治县', '632122', '57374', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57375', '1', '57372', '乐都县', '632123', '57375', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57376', '1', '57372', '互助土族自治县', '632126', '57376', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57377', '1', '57372', '化隆回族自治县', '632127', '57377', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57378', '1', '57372', '循化撒拉族自治县', '632128', '57378', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57379', '1', '57363', '海北藏族自治州', '632200', '57379', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57380', '1', '57379', '门源回族自治县', '632221', '57380', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57381', '1', '57379', '祁连县', '632222', '57381', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57382', '1', '57379', '海晏县', '632223', '57382', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57383', '1', '57379', '刚察县', '632224', '57383', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57384', '1', '57363', '黄南藏族自治州', '632300', '57384', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57385', '1', '57384', '同仁县', '632321', '57385', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57386', '1', '57384', '尖扎县', '632322', '57386', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57387', '1', '57384', '泽库县', '632323', '57387', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57388', '1', '57384', '河南蒙古族自治县', '632324', '57388', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57389', '1', '57363', '海南藏族自治州', '632500', '57389', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57390', '1', '57389', '共和县', '632521', '57390', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57391', '1', '57389', '同德县', '632522', '57391', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57392', '1', '57389', '贵德县', '632523', '57392', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57393', '1', '57389', '兴海县', '632524', '57393', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57394', '1', '57389', '贵南县', '632525', '57394', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57395', '1', '57363', '果洛藏族自治州', '632600', '57395', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57396', '1', '57395', '玛沁县', '632621', '57396', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57397', '1', '57395', '班玛县', '632622', '57397', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57398', '1', '57395', '甘德县', '632623', '57398', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57399', '1', '57395', '达日县', '632624', '57399', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57400', '1', '57395', '久治县', '632625', '57400', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57401', '1', '57395', '玛多县', '632626', '57401', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57402', '1', '57363', '玉树藏族自治州', '632700', '57402', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57403', '1', '57402', '玉树县', '632721', '57403', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57404', '1', '57402', '杂多县', '632722', '57404', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57405', '1', '57402', '称多县', '632723', '57405', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57406', '1', '57402', '治多县', '632724', '57406', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57407', '1', '57402', '囊谦县', '632725', '57407', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57408', '1', '57402', '曲麻莱县', '632726', '57408', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57409', '1', '57363', '海西蒙古族藏族自治州', '632800', '57409', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57410', '1', '57409', '格尔木市', '632801', '57410', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57411', '1', '57409', '德令哈市', '632802', '57411', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57412', '1', '57409', '乌兰县', '632821', '57412', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57413', '1', '57409', '都兰县', '632822', '57413', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57414', '1', '57409', '天峻县', '632823', '57414', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57415', '1', '54317', '宁夏回族自治区', '640000', '57415', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57416', '1', '57415', '银川市', '640100', '57416', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57417', '1', '57416', '兴庆区', '640104', '57417', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57418', '1', '57416', '西夏区', '640105', '57418', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57419', '1', '57416', '金凤区', '640106', '57419', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57420', '1', '57416', '永宁县', '640121', '57420', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57421', '1', '57416', '贺兰县', '640122', '57421', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57422', '1', '57416', '灵武市', '640181', '57422', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57423', '1', '57415', '石嘴山市', '640200', '57423', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57424', '1', '57423', '大武口区', '640202', '57424', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57425', '1', '57423', '惠农区', '640205', '57425', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57426', '1', '57423', '平罗县', '640221', '57426', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57427', '1', '57415', '吴忠市', '640300', '57427', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57428', '1', '57427', '利通区', '640302', '57428', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57429', '1', '57427', '盐池县', '640323', '57429', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57430', '1', '57427', '同心县', '640324', '57430', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57431', '1', '57427', '青铜峡市', '640381', '57431', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57432', '1', '57415', '固原市', '640400', '57432', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57433', '1', '57432', '原州区', '640402', '57433', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57434', '1', '57432', '西吉县', '640422', '57434', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57435', '1', '57432', '隆德县', '640423', '57435', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57436', '1', '57432', '泾源县', '640424', '57436', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57437', '1', '57432', '彭阳县', '640425', '57437', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57438', '1', '57415', '中卫市', '640500', '57438', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57439', '1', '57438', '沙坡头区', '640502', '57439', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57440', '1', '57438', '中宁县', '640521', '57440', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57441', '1', '57438', '海原县', '640522', '57441', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57442', '1', '54317', '新疆维吾尔自治区', '650000', '57442', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57443', '1', '57442', '乌鲁木齐市', '650100', '57443', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57444', '1', '57443', '天山区', '650102', '57444', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57445', '1', '57443', '沙依巴克区', '650103', '57445', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57446', '1', '57443', '新市区', '650104', '57446', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57447', '1', '57443', '水磨沟区', '650105', '57447', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57448', '1', '57443', '头屯河区', '650106', '57448', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57449', '1', '57443', '达坂城区', '650107', '57449', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57450', '1', '57443', '米东区', '650109', '57450', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57451', '1', '57443', '乌鲁木齐县', '650121', '57451', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57452', '1', '57442', '克拉玛依市', '650200', '57452', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57453', '1', '57452', '独山子区', '650202', '57453', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57454', '1', '57452', '克拉玛依区', '650203', '57454', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57455', '1', '57452', '白碱滩区', '650204', '57455', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57456', '1', '57452', '乌尔禾区', '650205', '57456', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57457', '1', '57442', '吐鲁番地区', '652100', '57457', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57458', '1', '57457', '吐鲁番市', '652101', '57458', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57459', '1', '57457', '鄯善县', '652122', '57459', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57460', '1', '57457', '托克逊县', '652123', '57460', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57461', '1', '57442', '哈密地区', '652200', '57461', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57462', '1', '57461', '哈密市', '652201', '57462', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57463', '1', '57461', '巴里坤哈萨克自治县', '652222', '57463', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57464', '1', '57461', '伊吾县', '652223', '57464', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57465', '1', '57442', '昌吉回族自治州', '652300', '57465', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57466', '1', '57465', '昌吉市', '652301', '57466', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57467', '1', '57465', '阜康市', '652302', '57467', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57468', '1', '57465', '呼图壁县', '652323', '57468', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57469', '1', '57465', '玛纳斯县', '652324', '57469', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57470', '1', '57465', '奇台县', '652325', '57470', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57471', '1', '57465', '吉木萨尔县', '652327', '57471', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57472', '1', '57465', '木垒哈萨克自治县', '652328', '57472', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57473', '1', '57442', '博尔塔拉蒙古自治州', '652700', '57473', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57474', '1', '57473', '博乐市', '652701', '57474', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57475', '1', '57473', '精河县', '652722', '57475', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57476', '1', '57473', '温泉县', '652723', '57476', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57477', '1', '57442', '巴音郭楞蒙古自治州', '652800', '57477', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57478', '1', '57477', '库尔勒市', '652801', '57478', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57479', '1', '57477', '轮台县', '652822', '57479', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57480', '1', '57477', '尉犁县', '652823', '57480', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57481', '1', '57477', '若羌县', '652824', '57481', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57482', '1', '57477', '且末县', '652825', '57482', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57483', '1', '57477', '焉耆回族自治县', '652826', '57483', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57484', '1', '57477', '和静县', '652827', '57484', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57485', '1', '57477', '和硕县', '652828', '57485', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57486', '1', '57477', '博湖县', '652829', '57486', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57487', '1', '57442', '阿克苏地区', '652900', '57487', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57488', '1', '57487', '阿克苏市', '652901', '57488', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57489', '1', '57487', '温宿县', '652922', '57489', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57490', '1', '57487', '库车县', '652923', '57490', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57491', '1', '57487', '沙雅县', '652924', '57491', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57492', '1', '57487', '新和县', '652925', '57492', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57493', '1', '57487', '拜城县', '652926', '57493', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57494', '1', '57487', '乌什县', '652927', '57494', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57495', '1', '57487', '阿瓦提县', '652928', '57495', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57496', '1', '57487', '柯坪县', '652929', '57496', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57497', '1', '57442', '克孜勒苏柯尔克孜自治州', '653000', '57497', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57498', '1', '57497', '阿图什市', '653001', '57498', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57499', '1', '57497', '阿克陶县', '653022', '57499', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57500', '1', '57497', '阿合奇县', '653023', '57500', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57501', '1', '57497', '乌恰县', '653024', '57501', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57502', '1', '57442', '喀什地区', '653100', '57502', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57503', '1', '57502', '喀什市', '653101', '57503', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57504', '1', '57502', '疏附县', '653121', '57504', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57505', '1', '57502', '疏勒县', '653122', '57505', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57506', '1', '57502', '英吉沙县', '653123', '57506', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57507', '1', '57502', '泽普县', '653124', '57507', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57508', '1', '57502', '莎车县', '653125', '57508', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57509', '1', '57502', '叶城县', '653126', '57509', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57510', '1', '57502', '麦盖提县', '653127', '57510', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57511', '1', '57502', '岳普湖县', '653128', '57511', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57512', '1', '57502', '伽师县', '653129', '57512', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57513', '1', '57502', '巴楚县', '653130', '57513', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57514', '1', '57502', '塔什库尔干塔吉克自治县', '653131', '57514', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57515', '1', '57442', '和田地区', '653200', '57515', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57516', '1', '57515', '和田市', '653201', '57516', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57517', '1', '57515', '和田县', '653221', '57517', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57518', '1', '57515', '墨玉县', '653222', '57518', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57519', '1', '57515', '皮山县', '653223', '57519', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57520', '1', '57515', '洛浦县', '653224', '57520', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57521', '1', '57515', '策勒县', '653225', '57521', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57522', '1', '57515', '于田县', '653226', '57522', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57523', '1', '57515', '民丰县', '653227', '57523', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57524', '1', '57442', '伊犁哈萨克自治州', '654000', '57524', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57525', '1', '57524', '伊宁市', '654002', '57525', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57526', '1', '57524', '奎屯市', '654003', '57526', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57527', '1', '57524', '伊宁县', '654021', '57527', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57528', '1', '57524', '察布查尔锡伯自治县', '654022', '57528', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57529', '1', '57524', '霍城县', '654023', '57529', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57530', '1', '57524', '巩留县', '654024', '57530', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57531', '1', '57524', '新源县', '654025', '57531', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57532', '1', '57524', '昭苏县', '654026', '57532', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57533', '1', '57524', '特克斯县', '654027', '57533', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57534', '1', '57524', '尼勒克县', '654028', '57534', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57535', '1', '57442', '塔城地区', '654200', '57535', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57536', '1', '57535', '塔城市', '654201', '57536', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57537', '1', '57535', '乌苏市', '654202', '57537', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57538', '1', '57535', '额敏县', '654221', '57538', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57539', '1', '57535', '沙湾县', '654223', '57539', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57540', '1', '57535', '托里县', '654224', '57540', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57541', '1', '57535', '裕民县', '654225', '57541', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57542', '1', '57535', '和布克赛尔蒙古自治县', '654226', '57542', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57543', '1', '57442', '阿勒泰地区', '654300', '57543', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57544', '1', '57543', '阿勒泰市', '654301', '57544', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57545', '1', '57543', '布尔津县', '654321', '57545', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57546', '1', '57543', '富蕴县', '654322', '57546', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57547', '1', '57543', '福海县', '654323', '57547', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57548', '1', '57543', '哈巴河县', '654324', '57548', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57549', '1', '57543', '青河县', '654325', '57549', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57550', '1', '57543', '吉木乃县', '654326', '57550', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57551', '1', '57442', '（自治区直辖县级行政区）', '659000', '57551', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57552', '1', '57551', '石河子市', '659001', '57552', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57553', '1', '57551', '阿拉尔市', '659002', '57553', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57554', '1', '57551', '图木舒克市', '659003', '57554', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57555', '1', '57551', '五家渠市', '659004', '57555', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57556', '1', '54317', '台湾省', '710000', '57556', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57557', '1', '57556', '台北市', '710001', '57557', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57558', '1', '57556', '高雄市', '710002', '57558', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57559', '1', '57556', '基隆市', '710003', '57559', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57560', '1', '57556', '新竹市', '710004', '57560', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57561', '1', '57556', '台中市', '710005', '57561', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57562', '1', '57556', '嘉义市', '710006', '57562', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57563', '1', '57556', '台南市', '710007', '57563', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57564', '1', '57556', '台北县', '710008', '57564', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57565', '1', '57556', '宜兰县', '710009', '57565', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57566', '1', '57556', '桃园县', '710010', '57566', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57567', '1', '57556', '新竹县', '710011', '57567', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57568', '1', '57556', '苗栗县', '710012', '57568', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57569', '1', '57556', '台中县', '710013', '57569', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57570', '1', '57556', '彰化县', '710014', '57570', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57571', '1', '57556', '南投县', '710015', '57571', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57572', '1', '57556', '云林县', '710016', '57572', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57573', '1', '57556', '嘉义县', '710017', '57573', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57574', '1', '57556', '台南县', '710018', '57574', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57575', '1', '57556', '高雄县', '710019', '57575', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57576', '1', '57556', '屏东县', '710020', '57576', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57577', '1', '57556', '台东县', '710021', '57577', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57578', '1', '57556', '花莲县', '710022', '57578', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57579', '1', '57556', '澎湖县', '710023', '57579', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57580', '1', '57620', '香港特别行政区', '810100', '57580', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57581', '1', '57621', '澳门特别行政区', '820100', '57581', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57616', '1', '54317', '北京市', '110000', '57616', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57617', '1', '54317', '天津市', '120000', '57617', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57618', '1', '54317', '重庆市', '500000', '57618', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57619', '1', '54317', '上海市', '310000', '57619', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57620', '1', '54317', '香港特别行政区', '810000', '57620', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('57621', '1', '54317', '澳门特别行政区', '820000', '57621', '1', '2017-08-01 18:22:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100000', '1', '0', '佣金类型', 'dic_commission_type', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100001', '1', '100000', '前端佣金', 'dic_commission_type_front', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100002', '1', '100000', '前端+后端佣金', 'dic_commission_type_front_back', '2', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100003', '1', '0', '佣金类型', 'dic_quo_commission_type', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100004', '1', '100003', '前端佣金', 'dic_quo_commission_type_front', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100005', '1', '100003', '前端+后端佣金', 'dic_quo_commission_type_front_bk', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100006', '1', '0', '收益类型', 'dic_income_type', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100007', '1', '100006', '固定收益', 'dic_income_type_fix', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100008', '1', '100006', '浮动收益', 'dic_income_type_float', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100009', '1', '100006', '固定+浮动收益', 'dic_income_type_fix_float', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100010', '1', '0', '发行状态', 'dic_product_issued_status', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100011', '1', '100010', '未上线', '0', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100012', '1', '100010', '上线准备中', '1', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100013', '1', '100010', '预售', '2', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100014', '1', '100010', '募集中', '3', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100015', '1', '100010', '募集结束', '4', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100016', '1', '100010', '存续封闭中', '5', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100017', '1', '100010', '清算退出', '6', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100018', '1', '0', '产品审核状态', 'dic_product_examine_status', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100019', '1', '100018', '未提交', '0', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100020', '1', '100018', '审核中', '1', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100021', '1', '100018', '已通过', '2', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100022', '1', '100018', '已驳回', '3', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100023', '1', '100018', '已撤销', '4', '1', '1', null, null, null, null, '0');
INSERT INTO `dictionary` VALUES ('100024', '1', '0', '跟进方式', 'dic_follow_up_type', '1', '1', '2017-08-08 20:00:20', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100025', '1', '100024', '电话', '1', '1', '1', '2017-08-08 20:00:20', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100026', '1', '100024', '短信', '2', '2', '1', '2017-08-08 20:00:20', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100027', '1', '100024', '微信/QQ', '3', '3', '1', '2017-08-08 20:00:20', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100028', '1', '100024', '上门拜访', '4', '4', '1', '2017-08-08 20:00:20', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100029', '1', '100024', '其他', '5', '5', '1', '2017-08-08 20:00:21', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100030', '1', '0', '跟进状态', 'dic_follow_up_status', '1', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100031', '1', '100030', '开场白', '1', '1', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100032', '1', '100030', '拒访', '2', '2', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100033', '1', '100030', '成交', '3', '3', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100034', '1', '100030', '关机', '4', '4', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100035', '1', '100030', '已发资料', '5', '5', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100036', '1', '100030', '无人接听', '6', '6', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100037', '1', '100030', '无效号码', '7', '7', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100038', '1', '100030', '忙音', '8', '8', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100039', '1', '100030', '约访', '9', '9', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100040', '1', '100030', '其他', '10', '10', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100041', '1', '0', '性别', 'dic_sex', '1', '1', '2017-08-08 20:08:31', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100042', '1', '100041', '男', '1', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100043', '1', '100041', '女', '2', '2', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100044', '1', '0', '客户级别', 'dic_customer_level', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100045', '1', '100044', 'A[最重要]', '1', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100046', '1', '100044', 'B[重要]', '2', '2', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100047', '1', '100044', 'C[普通]', '3', '3', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100048', '1', '100044', 'D[沉默]', '4', '4', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100049', '1', '0', '来源', 'dic_customer_source', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100050', '1', '100049', '自我开发', '1', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100051', '1', '100049', '客户转介绍', '2', '2', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100052', '1', '100049', '市场活动', '3', '3', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100053', '1', '100049', '其他', '4', '4', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100054', '1', '0', '证件类型', 'dic_customer_credentials', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100055', '1', '100054', '身份证', '1', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100056', '1', '100054', '护照', '2', '2', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100057', '1', '0', '投资人类型', 'dic_customer_type', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100058', '1', '100057', '普通投资人', '1', '1', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100059', '1', '100057', '专业投资人', '2', '2', '1', '2017-08-08 20:08:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100060', '1', '0', '风险特征', 'dic_customer_risk_rating', '1', '1', '2017-08-08 20:08:33', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100061', '1', '100060', '保守型', '1', '1', '1', '2017-08-08 20:08:33', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100062', '1', '100060', '适度保守型', '2', '2', '1', '2017-08-08 20:08:33', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100063', '1', '100060', '平衡型', '3', '3', '1', '2017-08-08 20:08:33', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100064', '1', '100060', '适度进取型', '4', '2', '1', '2017-08-08 20:08:33', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100065', '1', '100060', '进取型', '5', '5', '1', '2017-08-08 20:08:33', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100076', '1', '0', '回访方式', 'dic_user_visit_type', '1', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100077', '1', '100076', '电话', '1', '1', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100078', '1', '100076', '短信', '2', '2', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100079', '1', '100076', '微信/QQ', '3', '3', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100080', '1', '100076', '上门拜访', '4', '4', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100081', '1', '100076', '其他', '5', '5', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100082', '1', '0', '回访状态', 'dic_user_visit_status', '1', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100083', '1', '100082', '成功', '1', '1', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100084', '1', '100082', '失败', '0', '2', '2', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100085', '1', '0', '是否', 'dic_yes_or_no', '1', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100086', '1', '100085', '是', '1', '1', '1', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100087', '1', '100085', '否', '0', '2', '2', '2017-08-08 20:08:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100088', '1', '0', '客户回退审核状态', 'dic_customer_back_status', '1', '1', '2017-08-10 15:07:14', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100089', '1', '100088', '审核中', '1', '1', '1', '2017-08-10 15:07:14', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100090', '1', '100088', '已通过', '2', '2', '1', '2017-08-10 15:07:14', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100091', '1', '100088', '已驳回', '3', '3', '1', '2017-08-10 15:07:14', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100092', '1', '0', '消息二级类型', 'dic_msg_message_two_type', '1', '1', '2017-08-17 16:41:55', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100093', '1', '100092', '客户', '1', '1', '1', '2017-08-17 16:42:32', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100094', '1', '100092', '产品', '2', '2', '1', '2017-08-17 16:42:53', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100095', '1', '100092', '待回访', '3', '3', '1', '2017-08-17 16:43:21', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100096', '1', '100092', '待跟进', '4', '4', '1', '2017-08-17 16:43:23', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100097', '1', '100092', '待审核', '5', '5', '1', '2017-08-17 16:43:36', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100098', '1', '100092', '待确认', '6', '6', '1', '2017-08-17 16:43:48', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100099', '1', '100092', '交易', '7', '7', '1', '2017-08-17 16:44:03', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100100', '1', '0', '消息一级类型', 'dic_msg_message_frist_type', '1', '1', '2017-08-17 16:45:06', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100101', '1', '100100', '代办', '1', '1', '1', '2017-08-17 16:45:24', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100102', '1', '100100', '通知', '2', '1', '1', '2017-08-17 16:45:56', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100103', '1', '0', '动态类型', 'dic_msg_feed_type', '1', '1', '2017-08-17 16:46:46', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100104', '1', '100103', '客户', '1', '1', '1', '2017-08-17 16:49:59', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100105', '1', '100103', '交易', '2', '1', '1', '2017-08-17 16:50:16', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100119', '1', '0', '是否已上传打款凭证', 'dic_has_pay_evidence', '1', '1', '2017-08-28 13:48:38', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100120', '1', '100119', '已上传', '1', '1', '1', '2017-08-28 13:48:38', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100121', '1', '100119', '未上传', '0', '2', '2', '2017-08-28 13:48:38', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100136', '1', '0', '报单审核状态', 'dic_declaration_status', '1', '1', '2017-08-29 13:44:17', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100137', '1', '100136', '待审核', '1', '1', '1', '2017-08-29 13:44:17', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100138', '1', '100136', '已通过', '2', '2', '1', '2017-08-29 13:44:17', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100139', '1', '100136', '已驳回', '3', '3', '1', '2017-08-29 13:44:17', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100140', '1', '100136', '已取消', '4', '4', '1', '2017-08-29 13:44:17', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100142', '1', '0', '预约审核状态', 'dic_reservation_status', '1', '1', '2017-09-02 11:57:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100143', '1', '100142', '待审核', '1', '1', '1', '2017-09-02 11:57:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100144', '1', '100142', '已通过', '2', '2', '1', '2017-09-02 11:57:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100145', '1', '100142', '已驳回', '3', '3', '1', '2017-09-02 11:57:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100146', '1', '100142', '已取消', '4', '4', '1', '2017-09-02 11:57:08', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100147', '1', '0', '销售线索类型', 'dic_leads_type', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100148', '1', '100147', '预约产品', '1', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100149', '1', '100147', '注册', '2', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100150', '1', '0', '销售线索渠道', 'dic_leads_channel', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100151', '1', '100150', '网站', '1', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100152', '1', '100150', '服务号', '2', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100153', '1', '0', '销售线索状态', 'dic_leads_status', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100154', '1', '100153', '未处理', '0', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100155', '1', '100153', '已联系', '1', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100156', '1', '100153', '关闭', '2', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100157', '1', '0', '客户状态', 'dic_customer_status', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100158', '1', '100157', '未确认', '0', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100159', '1', '100157', '有效', '1', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100160', '1', '100157', '无效', '2', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100161', '1', '0', '销售线索回访状态', 'dic_leads_visit_status', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100162', '1', '100161', '未分配', '0', '1', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100163', '1', '100161', '已分配', '1', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');
INSERT INTO `dictionary` VALUES ('100164', '1', '100161', '已回访', '2', '2', '1', '2017-09-06 19:42:34', '1', null, null, '0');


UPDATE dictionary SET tenant_id=_tenantId;


delete from `msg_template`;
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', '1', '新增客户', '新增客户\r\n操作人：$!{createUserName}', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'add_customer', '', '新增客户', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('2', '1', '客户待跟进', '', '您计划于$!{nextFollowDate} 跟进客户（$!{name}$!{mobile}），请及时跟进', '您计划于$!{nextFollowDate} 跟进客户（$!{name}$!{mobile}），请及时跟进', '0', NULL, '跟进客户（$!{name}，$!{mobile}）', 'yundaojinfub://www.yundaocustomer.com/customer_detail?customerId=$!{customerId}', NULL, 'next_follow', '{\"customerId\":{\"isBlank\":false,\"message\":\"客户ID不能为空\"},\"userId\":{\"isBlank\":false,\"message\":\"理财师ID不能为空\"},\"name\":{\"isBlank\":false,\"message\":\"客户名称不能为空\"},\"mobile\":{\"isBlank\":false,\"message\":\"客户手机号不能为空\"},\"nextFollowDate\":{\"isBlank\":false,\"message\":\"下次跟进时间不能为空\"}}', '下次跟进', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('3', '1', '客户跟进', '客户跟进：$!{content}\r\n方式：$!{typeName} , 操作人：$!{createUserName}', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'customer_follow', '{\"customerId\":{\"isBlank\":false,\"message\":\"客户ID不能为空\"},\"content\":{\"isBlank\":false,\"message\":\"跟进内容不允许为空\"},\"typeName\":{\"isBlank\":false,\"message\":\"跟进类型不允许为空\"},\"createUserName\":{\"isBlank\":false,\"message\":\"跟进状态\"}}', '客户跟进', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('4', '1', '新产品上线', '', '$!{productTypeName}类产品$!{productName}上线了，敬请关注', '$!{productTypeName}类产品$!{productName}上线了，敬请关注', '0', NULL, NULL, 'yundaojinfub://www.yundaoproduct.com/product_detail?productId=$!{productId}&productName=$!{productName}', '/product/detail/$!{productId}', 'product_on_line', '{\"productId\":{\"isBlank\":false,\"message\":\"产品ID不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"productTypeName\":{\"isBlank\":false,\"message\":\"产品类型名称不能为空\"}}', '新产品上线', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('5', '1', '项目附件更新', NULL, '$!{productName}产品的附件$!{attachSourceName}有更新，敬请关注', '$!{productName}产品的附件$!{attachSourceName}有更新，敬请关注', '0', NULL, NULL, 'yundaojinfub://www.yundaoproduct.com/product_detail?productId=$!{productId}&productName=$!{productName}', '/product/detail/$!{productId}?tab=info', 'product_add_attach', '{\"productId\":{\"isBlank\":false,\"message\":\"产品ID不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"attachSourceName\":{\"isBlank\":false,\"message\":\"产品附件名称不能为空\"}}', '项目附件更新', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('6', '1', '有待上线审批的产品', NULL, '用户$!{submitUserRealName}提交产品上线审批（$!{productTypeName}，$!{productName}），请及时处理', '用户$!{submitUserRealName}提交产品上线审批（$!{productTypeName}，$!{productName}），请及时处理', '0', NULL, NULL, NULL, '/product/control/audit', 'product_on_line_audit', '{\"productId\":{\"isBlank\":false,\"message\":\"产品ID不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"productTypeName\":{\"isBlank\":false,\"message\":\"产品类型名称不能为空\"}}', '有待上线审批的产品', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('7', '1', '客户回退申请已通过', '客户回退到客户池\r\n申请人：$!{applyUserName}，操作人：$!{auditUserName}', '您的客户（$!{customerName}，$!{customerMobile}）回退申请被$!{auditUserName} 审批通过，已回退到客户池', '您的客户（$!{customerName}，$!{customerMobile}）回退申请被$!{auditUserName} 审批通过，已回退到客户池', '0', NULL, NULL, NULL, NULL, 'customer_back_examine_pass', '{\"customerName\":{\"isBlank\":false,\"message\":\"客户名称不能为空\"},\"customerMobile\":{\"isBlank\":false,\"message\":\"客户手机号不能为空\"},\"auditUserName\":{\"isBlank\":false,\"message\":\"审批人名称不能为空\"},\"applyUserName\":{\"isBlank\":false,\"message\":\"申请人名称不能为空\"}}', '客户回退-审批通过', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('8', '1', '客户回退申请被驳回', '客户回退被驳回，原因：$!{rejectReason}\r\n操作人：$!{auditUserName}', '您的客户（$!{customerName}，$!{customerMobile}）回退申请被$!{auditUserName} 驳回，原因$!{rejectReason}', '您的客户（$!{customerName}，$!{customerMobile}）回退申请被$!{auditUserName} 驳回，原因$!{rejectReason}', '0', NULL, NULL, NULL, NULL, 'customer_back_examine_reject', '{\"customerName\":{\"isBlank\":false,\"message\":\"客户名称不能为空\"},\"customerMobile\":{\"isBlank\":false,\"message\":\"客户手机号不能为空\"},\"auditUserName\":{\"isBlank\":false,\"message\":\"审批人名称不能为空\"}}', '客户回退-驳回', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('9', '1', '产品公告发布', NULL, '$!{productName}产品发布新公告（$!{typeName}，$!{title}），请及时关注', '$!{productName}产品发布新公告（$!{typeName}，$!{title}），请及时关注', '0', NULL, NULL, 'yundaojinfub://www.yundaoproduct.com/product_notice_detail?noticeId=$!{id}', '/product/detail/$!{productId}?tab=announce', 'send_notice', '{\"id\":{\"isBlank\":false,\"message\":\"公告ID不能为空\"},\"userIds\":{\"isBlank\":false,\"message\":\"发送人IDS不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"typeName\":{\"isBlank\":false,\"message\":\"公告类型不能为空\"},\"title\":{\"isBlank\":false,\"message\":\"公告标题不能为空\"},\"productId\":{\"isBlank\":false,\"message\":\"产品ID不能为空\"}}', '产品公告发布', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('10', '1', '有待发布审批的公告', NULL, '用户$!{realName}提交公告发布审批（$!{productName}），$!{typeName}，$!{title}）请及时处理', '用户$!{realName}提交公告发布审批（$!{productName}），$!{typeName}，$!{title}）请及时处理', '0', NULL, NULL, NULL, '/product/notice/audit', 'product_notice_audit', '{\"userIds\":{\"isBlank\":false,\"message\":\"发送人IDS不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"typeName\":{\"isBlank\":false,\"message\":\"公告类型不能为空\"},\"title\":{\"isBlank\":false,\"message\":\"公告标题不能为空\"},\"realName\":{\"isBlank\":false,\"message\":\"用户名不能为空\"}}', '有待发布审批的公告', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('11', '1', '回访了您的客户', '客户回访：$!{content}\r\n方式：$!{type}，状态：$!{status}，操作人：$!{visitOperationUserName}', '$!{visitOperationUserName} 对您的客户$!{customerName}进行了回访：$!{content}', '$!{visitOperationUserName} 对您的客户$!{customerName}进行了回访：$!{content}', '0', NULL, NULL, 'yundaojinfub://www.yundaocustomer.com/customer_detail/callback?customerId=$!{customerId}', '/customer/detail/$!{customerId}?tab=visit', 'customer_visit', '{\"userId\":{\"isBlank\":false,\"message\":\"发送人不能为空\"},\"customerId\":{\"isBlank\":false,\"message\":\"客户ID不能为空\"},\"customerName\":{\"isBlank\":false,\"message\":\"客户名称不能为空\"},\"type\":{\"isBlank\":false,\"message\":\"回访方式不能为空\"},\"status\":{\"isBlank\":false,\"message\":\"回访状态不能为空\"}}', '回访了您的客户', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('12', '1', '客户待回访', NULL, '您计划于$!{nextTime} 回访客户（$!{customerName}，$!{customerMobile}），请及时处理', '您计划于$!{nextTime} 回访客户（$!{customerName}，$!{customerMobile}），请及时处理', '0', NULL, '回访客户（$!{customerName}，$!{customerMobile}）', NULL, '/operation/allot', 'customer_next_visit', NULL, '客户待回访', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('17', '1', '给您调配了新客户', '客户调配：客户调配到$!{fpName}名下\n操作人：$!{createUserName}', '$!{createUserName} 给你调配了新客户（$!{name}，$!{mobile}），请及时跟进', '$!{createUserName} 给你调配了新客户（$!{name}，$!{mobile}），请及时跟进', '0', NULL, '', 'yundaojinfub://www.yundaocustomer.com/customer_list', '/customer/my', 'customer_allot', '', '单个客户调配', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('18', '1', '给您调配了新客户', '客户调配：客户调配到$!{fpName}名下\n操作人：$!{createUserName}', '$!{createUserName} 给你调配了$!{customerNum}位新客户，请及时跟进', '$!{createUserName} 给你调配了$!{customerNum}位新客户，请及时跟进', '0', NULL, '', 'yundaojinfub://www.yundaocustomer.com/customer_list', '/customer/my', 'customer_allot_multi', '', '批量客户调配', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('19', '1', '客户回收到客户池', '客户回收到客户池\n操作人：$!{createUserName}', '您的客户（$!{customerName}，$!{mobile}）已被$!{createUserName} 回收到客户池', '您的客户（$!{customerName}，$!{mobile}）已被$!{createUserName} 回收到客户池', '0', NULL, '', NULL, '', 'customer_recycle', NULL, '批量客户回收', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('20', '1', '报单审批通过', '您为客户$!{customerName}认购（$!{productName}，$!{dealAmount}，$!{dealTime}）的报单已确认', '报单确认：$!{productName}，打款金额$!{dealAmount}，打款日期$!{dealTime}\r\n操作人：$!{audioName}', '您为客户$!{customerName}认购（$!{productName}，$!{dealAmount}，$!{dealTime}）的报单已确认', '0', NULL, NULL, 'yundaojinfub://www.yundaoorder.com/order_detail?orderId=$!{id}', '/declaration/detail/$!{id}', 'declaration_audio_pass', '{\"userId\":{\"isBlank\":false,\"message\":\"发送人ID不能为空\"},\"id\":{\"isBlank\":false,\"message\":\"报单ID不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"dealAmount\":{\"isBlank\":false,\"message\":\"打款金额不能为空\"},\"audioName\":{\"isBlank\":false,\"message\":\"报单审批人不能为空\"},\"dealTime\":{\"isBlank\":false,\"message\":\"打款时间不能为空\"}}', '报单审批通过', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template` (`id`, `tenant_id`, `title`, `feed_content`, `message_content`, `app_content`, `need_push`, `push_content`, `index_content`, `app_action`, `pc_action`, `code`, `params`, `remark`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('21', '1', '报单被驳回', '您为客户$!{customerName}认购（$!{productName}，$!{dealAmount}，$!{dealTime}）的报单被$!{audioName} 驳回，原因$!{reason}', '您为客户$!{customerName}认购（$!{productName}，$!{dealAmount}，$!{dealTime}）的报单被$!{audioName} 驳回，原因$!{reason}', '您为客户$!{customerName}认购（$!{productName}，$!{dealAmount}，$!{dealTime}）的报单被$!{audioName} 驳回，原因$!{reason}', '0', NULL, NULL, 'yundaojinfub://www.yundaoorder.com/order_detail?orderId=$!{id}', '/declaration/detail/$!{id}', 'declaration_audio_reject', '{\"userId\":{\"isBlank\":false,\"message\":\"发送人ID不能为空\"},\"productName\":{\"isBlank\":false,\"message\":\"产品名称不能为空\"},\"dealAmount\":{\"isBlank\":false,\"message\":\"打款金额不能为空\"},\"audioName\":{\"isBlank\":false,\"message\":\"报单审批人不能为空\"},\"dealTime\":{\"isBlank\":false,\"message\":\"打款时间不能为空\"},\"reason\":{\"isBlank\":false,\"message\":\"驳回原因不能为空\"},\"id\":{\"isBlank\":false,\"message\":\"报单不能为空\"}}', '报单被驳回', NULL, NULL, NULL, NULL, '0');

UPDATE msg_template SET tenant_id=_tenantId;

delete from `msg_template_type`;
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', '1', '新增客户', '1', '1', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('2', '1', '下次跟进客户', '2', '1', '4', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('3', '1', '客户跟进', '1', '1', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('4', '1', '产品上线', '2', '2', '2', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('5', '1', '项目附件更新', '2', '2', '2', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('6', '1', '有待上线审核的产品', '2', '1', '4', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('7', '1', '客户回退-审核通过', '1', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('8', '1', '客户回退-审核通过', '2', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('9', '1', '客户回退-驳回', '1', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('10', '1', '客户回退-驳回', '2', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('11', '1', '产品公告发布', '2', '2', '2', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('12', '1', '有待发布审核的公告', '2', '1', '5', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('13', '1', '客户回访', '1', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('14', '1', '客户回访', '2', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('15', '1', '下次回访', '2', '1', '3', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('16', '1', '给您调配了新客户', '2', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('17', '1', '给您调配了新客户', '1', '1', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('18', '1', '客户回收到客户池', '2', '2', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('19', '1', '客户回收到客户池', '1', '1', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('20', '1', '报单审核通过', '1', '2', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('21', '1', '报单审核通过', '2', '2', '7', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('22', '1', '报单被驳回', '1', '2', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type` (`id`, `tenant_id`, `name`, `type`, `firstType`, `twoTpe`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('23', '1', '报单被驳回', '2', '2', '7', NULL, NULL, NULL, NULL, '0');

UPDATE msg_template_type SET tenant_id=_tenantId;
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('1', '1', '1', '1', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('2', '1', '2', '2', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('3', '1', '3', '3', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('4', '1', '4', '4', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('5', '1', '5', '5', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('6', '1', '6', '6', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('7', '1', '7', '7', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('8', '1', '7', '8', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('9', '1', '8', '9', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('10', '1', '8', '10', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('11', '1', '9', '11', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('12', '1', '10', '12', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('13', '1', '11', '13', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('14', '1', '11', '14', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('15', '1', '12', '15', NULL, NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('17', '1', '17', '17', '-1', '2017-08-27 20:52:54', NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('18', '1', '17', '16', '-1', '2017-08-27 20:53:38', NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('19', '1', '18', '17', '-1', '2017-08-27 20:54:00', NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('20', '1', '18', '16', '-1', '2017-08-27 20:54:00', NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('21', '1', '19', '19', '-1', '2017-08-29 08:47:03', NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('22', '1', '19', '18', '-1', '2017-08-29 08:49:06', NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('23', '1', '20', '20', '-1', NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('24', '1', '20', '21', '-1', NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('25', '1', '21', '22', '-1', NULL, NULL, NULL, '0');
INSERT INTO `msg_template_type_ref` (`id`, `tenant_id`, `template_id`, `type_id`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `is_delete`) VALUES ('26', '1', '21', '23', '-1', NULL, NULL, NULL, '0');

UPDATE msg_template_type_ref SET tenant_id=_tenantId;


delete from cc_question_type;
INSERT INTO `cc_question_type` (`id`, `tenant_id`, `code`, `name`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (1, 1, 'risk', '分析评估', NULL, NULL, NULL, NULL, 0);

UPDATE cc_question_type SET tenant_id=_tenantId;



delete from cc_question;
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, 1, 1, '您现在的年龄是？', 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (2, 1, 1, '您目前的家庭净资产是？（折合人民币）', 0, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (3, 1, 1, '您的家庭年收入的状况是？（折合人民币）', 0, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (4, 1, 1, '以下哪项最能描述您的过去的投资分布？', 0, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (5, 1, 1, '以下哪项最能描述您对投资期限的偏好？', 0, 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (6, 1, 1, '以下哪项最能描述您对投资历史经验？', 0, 6, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (7, 1, 1, '以下情况，您会选择哪一种？', 0, 7, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (8, 1, 1, '对投资以下哪项最能描述您投资的目的？', 0, 8, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (9, 1, 1, '您最倾向于选择以下哪一种产品组合？', 0, 9, NULL, NULL, NULL, NULL, 0);

UPDATE cc_question SET tenant_id=_tenantId;


delete from cc_question_option;
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, 1, 1, 'A.18-30', 3, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (2, 1, 1, 'B.31-50', 5, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (3, 1, 1, 'C.51-65', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (4, 1, 1, 'D.高于65岁', 2, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (5, 1, 2, 'A.低于600万', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (6, 1, 2, 'B.600万-2000万', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (7, 1, 2, 'C.2000万-1亿', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (8, 1, 2, 'D.大于1亿', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (9, 1, 3, 'A.收入来源稳定，平均年收入在50万以下', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (10, 1, 3, 'B.收入来源稳定，平均年收入在50万-200万', 4, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (11, 1, 3, 'C.收入来源稳定，平均年收入在200万以上', 5, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (12, 1, 3, 'D.收入来源不稳定，过去五年中平均年收入100万以下', 1, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (13, 1, 3, 'E.收入来源不稳定，过去五年的平均年收入在100万以上', 3, 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (14, 1, 4, 'A.大部分投资于银行的存款和理财产品，少部分投资于其他金融产品，比如基金和股票', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (15, 1, 4, 'B.资产均衡地分布于存款和银行理财产品、信托或资管产品、基金和股票等', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (16, 1, 4, 'C.大部分投资于股票、基金、外汇等高风险产品，少部分投资于信托等类固定收益产品', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (17, 1, 4, 'D.投资多元化，以股权投资和资本市场投资为主，包括股票，期货等', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (18, 1, 5, 'A.以6个月以内的短期产品或方便赎回的流动性强的产品为主', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (19, 1, 5, 'B.在资产配置的基础上，以1-5年的中等期限的投资为主', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (20, 1, 5, 'C.在资产配置的基础上，以大于5年的长期投资为主', 5, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (21, 1, 5, 'D.通过资产配置，均衡分布于短期（小于1年），中期（1-5年）和长期（大于5年）的期限分布', 4, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (22, 1, 6, 'A.初涉投资，经验尚浅。具有1年以内的经验，主要接触的是基金和股票等公募产品或信托类型的类固定收益产品', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (23, 1, 6, 'B.略懂一二，经验尚可。具有1-3年的经验，主要接触的资本市场产品，包括股票和基金；或者信托和资管类的类固定收益产品；接触过海外市场背景的产品', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (24, 1, 6, 'C.比较熟悉，较有经验。具有3－10年的经验，熟悉资本市场产品，包括股票和基金；或者信托和资管类的类固定收益产品；或者私募类的投资产品以及房产，贵金属等投资；接触过海外市场背景的产品', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (25, 1, 6, 'D.深谙此道，经验丰富。拥有10年以上的经验，熟悉通过股权和债权等方式进行的实业相关的投资或房产投资，或者或者熟悉资本市场产品，包括股票和基金；或者信托和资管类的类固定收益产品。对海外市场的投资有一定了解', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (26, 1, 7, 'A.有100%的机会赢取5000元现金', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (27, 1, 7, 'B.有50%的机会赢取5万元现金', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (28, 1, 7, 'C.有25%的机会赢取10万元现金', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (29, 1, 7, 'D.有10%的机会赢取50万元现金', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (30, 1, 8, 'A.保全现有资产，抵御通货膨胀', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (31, 1, 8, 'B.多元化配置分散风险，稳健增值，考虑资产传承', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (32, 1, 8, 'C.增加财产性收入，达到或巩固财务自由状态', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (33, 1, 8, 'D.实现资本增值和继续的积累', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (34, 1, 9, 'A.预期收益60％，最好150%，最差损失100%本金', 5, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (35, 1, 9, 'B.预期收益20%，最好50%，最差损失30%本金', 4, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (36, 1, 9, 'C.预期收益15%，最好20%，最差损失10%本金', 3, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (37, 1, 9, 'D.预期收益4%，最好8%，最差收益0%', 2, 4, NULL, NULL, NULL, NULL, 0);

UPDATE cc_question_option SET tenant_id=_tenantId;


delete from cc_risk_rating;
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, 1, '保守型', 1, 0, 60, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (2, 1, '适度保守型', 2, 60, 70, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (3, 1, '平衡型', 3, 70, 80, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (4, 1, '适度进取型', 4, 80, 90, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (5, 1, '进取型', 5, 90, 100, NULL, NULL, NULL, NULL, NULL, 0);

UPDATE cc_risk_rating SET tenant_id=_tenantId;

INSERT INTO sms_account (tenant_id, access_key_id, access_key_secret, sign, is_enable, create_date, create_user_id, update_user_id, update_date, is_delete) VALUES (_tenantId, _smsAccessKeyId, _smsAccesskeySecret, _smsSign, 1, null, null, null, null, 0);
INSERT INTO sms_template (tenant_id, code, third_party_code, name, message, description, is_enable, create_user_id, create_date, update_user_id, update_date, is_delete) VALUES (_tenantId, 'captcha_2c_retrieve_pwd', 'SMS_92240007', '找回密码', null, null, 1, null, null, null, null, 0);
INSERT INTO sms_template (tenant_id, code, third_party_code, name, message, description, is_enable, create_user_id, create_date, update_user_id, update_date, is_delete) VALUES (_tenantId, 'captcha_2c_register', 'SMS_82840129', '注册', null, null, 1, null, null, null, null, 0);

ALTER TABLE object_field ADD can_edit_mandatory TINYINT NULL COMMENT '是否能够修改 必填项';
ALTER TABLE object_field
  MODIFY COLUMN can_edit_mandatory TINYINT COMMENT '是否能够修改 必填项' AFTER is_enabled;

ALTER TABLE object_field ADD can_edit_enabled TINYINT NULL COMMENT '是否可修改 启用 项';
ALTER TABLE object_field
  MODIFY COLUMN can_edit_enabled TINYINT COMMENT '是否可修改 启用 项' AFTER can_edit_mandatory;

UPDATE object_field SET can_edit_mandatory=1,can_edit_enabled=1;
UPDATE object_field SET can_edit_mandatory=0,can_edit_enabled=0 WHERE id IN(1,2,4,6,7,10,11,15,16,17);

/*暂时删除 销售线索 和 跟进*/
UPDATE data_object SET is_delete=1 WHERE id IN(12,13);
UPDATE data_object_access SET is_delete=1 WHERE data_object_id IN(12,13);
UPDATE data_object_init SET is_delete=1 WHERE data_object_id IN(12,13);

END;

CALL initial ();
DROP PROCEDURE initial;

//
















