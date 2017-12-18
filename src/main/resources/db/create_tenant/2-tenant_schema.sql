

DROP TABLE IF EXISTS `tenant_temp_table`;
CREATE TABLE `tenant_temp_table` (
  `tenant_id` bigint(20) DEFAULT NULL,
  `sms_access_key_id` varchar(250) DEFAULT NULL,
  `sms_access_key_secret` varchar(250) DEFAULT NULL,
  `sms_sign` varchar(250) DEFAULT NULL,
  `sms_is_default` bigint(20) DEFAULT NULL COMMENT '是否使默认sms'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `app_login`;
CREATE TABLE `app_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `login_id` bigint(20) DEFAULT NULL COMMENT '登录id',
  `network_type` varchar(32) DEFAULT NULL COMMENT '网络类型（WIFI）',
  `device_id` varchar(64) DEFAULT NULL COMMENT '设备id',
  `device_name` varchar(64) DEFAULT NULL COMMENT '设备名称（iPhone 6s）',
  `device_model` varchar(64) DEFAULT NULL COMMENT '设备型号（iPhone）',
  `vendor` varchar(64) DEFAULT NULL COMMENT '厂商（iPhone）',
  `operating_system` varchar(64) DEFAULT NULL COMMENT '操作系统（iPhone OS）',
  `app_version` varchar(64) DEFAULT NULL COMMENT 'app版本号',
  `device_resolution` varchar(32) DEFAULT NULL COMMENT '设备分辨率',
  `imei` varchar(32) DEFAULT NULL COMMENT '国际移动设备身份',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_login_id` (`login_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP登录表';

-- ----------------------------
-- Table structure for browser_login
-- ----------------------------
DROP TABLE IF EXISTS `browser_login`;
CREATE TABLE `browser_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `login_id` bigint(20) DEFAULT NULL COMMENT '登录id',
  `user_agent` varchar(1024) DEFAULT NULL COMMENT '浏览器头部代理信息',
  `browser_type` varchar(64) DEFAULT NULL COMMENT '浏览器类型（Internet Explorer 6）',
  `device_type` varchar(64) DEFAULT NULL COMMENT '设备类型（Computer）',
  `operating_system` varchar(64) DEFAULT NULL COMMENT '操作系统（Windows XP）',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_login_id` (`login_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览器登录表';

-- ----------------------------
-- Table structure for business_object
-- ----------------------------
DROP TABLE IF EXISTS `business_object`;
CREATE TABLE `business_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_share` tinyint(4) DEFAULT '0' COMMENT '是否共用，0：否，1：是',
  `is_data_access` tinyint(4) DEFAULT '0' COMMENT '是否开启数据访问，0：否，1：是',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='业务对象';

-- ----------------------------
-- Table structure for cc_customer_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `cc_customer_user_rel`;
CREATE TABLE `cc_customer_user_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_account_id` bigint(20) NOT NULL COMMENT '用户账号id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户用户关系';

-- ----------------------------
-- Table structure for cc_login
-- ----------------------------
DROP TABLE IF EXISTS `cc_login`;
CREATE TABLE `cc_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint(4) DEFAULT NULL COMMENT '登录状态，对应账号状态，1：正常使用；2：禁止登陆',
  `ticket` varchar(512) DEFAULT NULL COMMENT '登录凭证码',
  `type` varchar(32) DEFAULT NULL COMMENT '登录类型',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='投资用户登录';

-- ----------------------------
-- Table structure for cc_login_detail
-- ----------------------------
DROP TABLE IF EXISTS `cc_login_detail`;
CREATE TABLE `cc_login_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `login_id` bigint(20) DEFAULT NULL COMMENT '登录id',
  `os_name` varchar(32) DEFAULT NULL COMMENT '操作系统名称',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `device_name` varchar(32) DEFAULT NULL COMMENT '设备名称',
  `resolution` varchar(16) DEFAULT NULL COMMENT '分辨率',
  `user_agent` varchar(512) DEFAULT NULL COMMENT '终端信息',
  `browser` varchar(64) DEFAULT NULL COMMENT '浏览器',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='登录详情';

-- ----------------------------
-- Table structure for cc_question
-- ----------------------------
DROP TABLE IF EXISTS `cc_question`;
CREATE TABLE `cc_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型id',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，0：单选，1：多选，2：文本',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='问答问题';

-- ----------------------------
-- Table structure for cc_question_answer
-- ----------------------------
DROP TABLE IF EXISTS `cc_question_answer`;
CREATE TABLE `cc_question_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `question_id` bigint(20) DEFAULT NULL COMMENT '问答id',
  `option_id` bigint(20) DEFAULT NULL COMMENT '选项id',
  `score_id` bigint(20) DEFAULT NULL COMMENT '答题成绩id',
  `content` varchar(512) DEFAULT NULL COMMENT '答题文本，当问题类型为“文本”时填写',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='用户答题';

-- ----------------------------
-- Table structure for cc_question_option
-- ----------------------------
DROP TABLE IF EXISTS `cc_question_option`;
CREATE TABLE `cc_question_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `question_id` bigint(20) DEFAULT NULL COMMENT '问题id',
  `content` varchar(128) DEFAULT NULL COMMENT '选项内容',
  `grade` int(11) DEFAULT NULL COMMENT '分数',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='问答选项';

-- ----------------------------
-- Table structure for cc_question_score
-- ----------------------------
DROP TABLE IF EXISTS `cc_question_score`;
CREATE TABLE `cc_question_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `grade` int(11) DEFAULT NULL COMMENT '得分',
  `question_type_id` bigint(20) DEFAULT NULL COMMENT '问答类型id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户答题成绩';

-- ----------------------------
-- Table structure for cc_question_type
-- ----------------------------
DROP TABLE IF EXISTS `cc_question_type`;
CREATE TABLE `cc_question_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `name` varchar(64) DEFAULT NULL COMMENT '类型名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='问答类型';

-- ----------------------------
-- Table structure for cc_risk_rating
-- ----------------------------
DROP TABLE IF EXISTS `cc_risk_rating`;
CREATE TABLE `cc_risk_rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `label` varchar(16) DEFAULT NULL COMMENT '文本',
  `value` int(11) DEFAULT NULL COMMENT '值，1：保守型，2：适度保守型，3：平衡型，4：适度进取型，5：进取型',
  `grade_min` int(11) DEFAULT NULL COMMENT '分数最小区间',
  `grade_max` int(11) DEFAULT NULL COMMENT '分数最大区间',
  `comment` varchar(256) DEFAULT NULL COMMENT '评语',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户风险评估';

-- ----------------------------
-- Table structure for cc_ticket
-- ----------------------------
DROP TABLE IF EXISTS `cc_ticket`;
CREATE TABLE `cc_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `ticket` varchar(512) DEFAULT NULL COMMENT '登录凭证码',
  `active_time` int(11) DEFAULT NULL COMMENT '存活时间，单位秒，-1代表永不过期',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `type` varchar(32) DEFAULT NULL COMMENT '类型，C_PC，C_APP',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='投资用户登录凭证';

-- ----------------------------
-- Table structure for cc_user_account
-- ----------------------------
DROP TABLE IF EXISTS `cc_user_account`;
CREATE TABLE `cc_user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `mobile` varchar(256) DEFAULT NULL COMMENT '手机号',
  `user_name` varchar(256) DEFAULT NULL COMMENT '账号',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `status` tinyint(4) DEFAULT '1' COMMENT '账号状态，1：正常使用；2：禁止登陆',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='投资用户账号表';

-- ----------------------------
-- Table structure for cc_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `cc_user_detail`;
CREATE TABLE `cc_user_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `avatar` varchar(64) DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(16) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(4) DEFAULT NULL COMMENT '1：男；2：女',
  `birth` datetime DEFAULT NULL COMMENT '生日',
  `wechat` varchar(256) DEFAULT NULL COMMENT '微信',
  `qq` varchar(256) DEFAULT NULL COMMENT 'qq',
  `email` varchar(256) DEFAULT NULL COMMENT '邮箱',
  `province_code` varchar(32) DEFAULT NULL COMMENT '省份',
  `city_code` varchar(32) DEFAULT NULL COMMENT '市',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='投资用户详情';

-- ----------------------------
-- Table structure for cloud_file
-- ----------------------------
DROP TABLE IF EXISTS `cloud_file`;
CREATE TABLE `cloud_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `type` tinyint(2) DEFAULT '0' COMMENT '云类型，0：阿里云；1：腾讯云；2：ucloud云',
  `url` varchar(512) DEFAULT NULL COMMENT '链接',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 ',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  `original_name` varchar(128) DEFAULT NULL COMMENT '原文件名',
  `nsc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8 COMMENT='云文件表';

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别(1：男，2：女)',
  `number` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `mobile` varchar(256) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(256) DEFAULT NULL COMMENT '邮箱',
  `level` tinyint(2) DEFAULT NULL COMMENT '客户级别(1：A[最重要]，2：[重要]，3：[普通]，4[沉默])',
  `risk_rating` tinyint(2) DEFAULT NULL COMMENT '风险特征（1：保守型，2：适度保守型，3：平衡型，4：适度进取型，5：进取型）',
  `type` tinyint(2) DEFAULT NULL COMMENT '投资人类型（1：普通投资人，2：专业投资人）',
  `source` tinyint(2) DEFAULT NULL COMMENT '客户来源（1：自我开发，2：客户转介绍，3：市场活动，4：其他）',
  `status` tinyint(2) DEFAULT '0' COMMENT '客户状态（0：未确认，1：有效，2：无效）',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15871 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Table structure for customer_anniversaries
-- ----------------------------
DROP TABLE IF EXISTS `customer_anniversaries`;
CREATE TABLE `customer_anniversaries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `anvr_time` datetime DEFAULT NULL COMMENT '日期',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户纪念日表';

-- ----------------------------
-- Table structure for customer_attach
-- ----------------------------
DROP TABLE IF EXISTS `customer_attach`;
CREATE TABLE `customer_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `name` varchar(128) DEFAULT NULL COMMENT '附件名称',
  `url` varchar(256) DEFAULT NULL COMMENT 'url',
  `type` int(6) DEFAULT NULL COMMENT '附件类型（1：资产证明）',
  `type_name` char(10) DEFAULT NULL COMMENT '类型名称',
  `seqencing` int(6) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='客户附件表';

-- ----------------------------
-- Table structure for customer_back_examine
-- ----------------------------
DROP TABLE IF EXISTS `customer_back_examine`;
CREATE TABLE `customer_back_examine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '申请发起人',
  `reason` varchar(128) DEFAULT NULL COMMENT '回退原因',
  `application_date` datetime DEFAULT NULL COMMENT '申请时间',
  `examine_date` datetime DEFAULT NULL COMMENT '审核时间',
  `examine_user_id` bigint(20) DEFAULT NULL COMMENT '审核人',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态  1:审核中  2:通过  3驳回',
  `reject_reason` varchar(128) DEFAULT NULL COMMENT '驳回原因',
  `is_delete` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='客户回退审核';

-- ----------------------------
-- Table structure for customer_bank
-- ----------------------------
DROP TABLE IF EXISTS `customer_bank`;
CREATE TABLE `customer_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `account` varchar(32) DEFAULT NULL COMMENT '银行卡账号',
  `bank_name` varchar(128) DEFAULT NULL COMMENT '开户行',
  `front` varchar(128) DEFAULT NULL COMMENT '银行卡正面',
  `back` varchar(128) DEFAULT NULL COMMENT '银行卡反面',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='客户银行卡表';

-- ----------------------------
-- Table structure for customer_bank_rel
-- ----------------------------
DROP TABLE IF EXISTS `customer_bank_rel`;
CREATE TABLE `customer_bank_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `bank_id` bigint(20) DEFAULT NULL COMMENT '银行卡id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tenant_id_index` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='客户银行卡关系';

-- ----------------------------
-- Table structure for customer_credentials
-- ----------------------------
DROP TABLE IF EXISTS `customer_credentials`;
CREATE TABLE `customer_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `type` bigint(2) DEFAULT NULL COMMENT '证件类型（1：身份证，2：护照）',
  `number` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `front` varchar(128) DEFAULT NULL COMMENT '证件正面',
  `back` varchar(128) DEFAULT NULL COMMENT '证件反面',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='客户证件表';

-- ----------------------------
-- Table structure for customer_credentials_rel
-- ----------------------------
DROP TABLE IF EXISTS `customer_credentials_rel`;
CREATE TABLE `customer_credentials_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `credentials_id` bigint(20) DEFAULT NULL COMMENT '证件id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='客户证件关系表';

-- ----------------------------
-- Table structure for customer_detail
-- ----------------------------
DROP TABLE IF EXISTS `customer_detail`;
CREATE TABLE `customer_detail` (
  `id` bigint(20) NOT NULL COMMENT '客户id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `wechat` varchar(256) DEFAULT NULL COMMENT '微信',
  `qq` varchar(256) DEFAULT NULL COMMENT 'qq',
  `province_code` varchar(32) DEFAULT NULL COMMENT '省份',
  `city_code` varchar(32) DEFAULT NULL COMMENT '市',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `trade` varchar(64) DEFAULT NULL COMMENT '行业',
  `organization` varchar(128) DEFAULT NULL COMMENT '机构',
  `position` varchar(64) DEFAULT NULL COMMENT '职位',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户详情表';

-- ----------------------------
-- Table structure for customer_follow_up
-- ----------------------------
DROP TABLE IF EXISTS `customer_follow_up`;
CREATE TABLE `customer_follow_up` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `type` tinyint(2) DEFAULT NULL COMMENT '跟进方式',
  `status` tinyint(2) DEFAULT NULL COMMENT '跟进状态',
  `content` varchar(512) DEFAULT NULL COMMENT '跟进内容',
  `next_follow_date` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `next_message_send` tinyint(2) DEFAULT '1' COMMENT '下次跟进是否生成消息，1未生成，2生成。',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='客户跟进';

-- ----------------------------
-- Table structure for customer_invest_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_invest_type`;
CREATE TABLE `customer_invest_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `product_type_id` bigint(20) DEFAULT NULL COMMENT '投资偏好',
  `seqencing` int(6) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='客户投资偏好';

-- ----------------------------
-- Table structure for customer_tag
-- ----------------------------
DROP TABLE IF EXISTS `customer_tag`;
CREATE TABLE `customer_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) DEFAULT NULL COMMENT '标签表_id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `seqencing` bigint(6) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `customer_tag_index` (`tag_id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8 COMMENT='客户标签关联表';

-- ----------------------------
-- Table structure for customer_transfer
-- ----------------------------
DROP TABLE IF EXISTS `customer_transfer`;
CREATE TABLE `customer_transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `after_user` varchar(64) DEFAULT NULL COMMENT '移交后归属人名称',
  `after_user_id` bigint(20) DEFAULT NULL COMMENT '移交后归属id',
  `before_user` varchar(64) DEFAULT NULL COMMENT '移交前归属人名称',
  `before_user_id` bigint(20) DEFAULT NULL COMMENT '移交前归属id',
  `transfer_date` datetime DEFAULT NULL COMMENT '移交时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8 COMMENT='客户移交记录';

-- ----------------------------
-- Table structure for data_access
-- ----------------------------
DROP TABLE IF EXISTS `data_access`;
CREATE TABLE `data_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `business_object_id` bigint(20) DEFAULT NULL COMMENT '业务对象id',
  `delete_permission` tinyint(4) DEFAULT '0' COMMENT '删除权限，0：无权限，1：本人，2：本人及下属，3：本级，4：本级及下属，5：全部',
  `edit_permission` tinyint(4) DEFAULT '0' COMMENT '编辑权限，0：无权限，1：本人，2：本人及下属，3：本级，4：本级及下属，5：全部',
  `read_permission` tinyint(4) DEFAULT '0' COMMENT '读取权限，0：无权限，1：本人，2：本人及下属，3：本级，4：本级及下属，5：全部',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_role_id` (`role_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象数据访问控制(删除)';

-- ----------------------------
-- Table structure for data_object
-- ----------------------------
DROP TABLE IF EXISTS `data_object`;
CREATE TABLE `data_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_object_access
-- ----------------------------
DROP TABLE IF EXISTS `data_object_access`;
CREATE TABLE `data_object_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `data_object_id` bigint(20) DEFAULT NULL COMMENT '数据对象id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `read_permission` tinyint(4) DEFAULT '0' COMMENT '读取权限，0：无权限，10：我的，20：团队，30：部门，40：全部',
  `delete_permission` tinyint(4) DEFAULT '0' COMMENT '删除权限，0：无权限，10：我的，20：团队，30：部门，40：全部',
  `edit_permission` tinyint(4) DEFAULT '0' COMMENT '编辑权限，0：无权限，10：我的，20：团队，30：部门，40：全部',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='数据对象的访问权限';

-- ----------------------------
-- Table structure for data_object_field
-- ----------------------------
DROP TABLE IF EXISTS `data_object_field`;
CREATE TABLE `data_object_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `field_id` bigint(20) DEFAULT NULL COMMENT '字段id',
  `data_object_id` bigint(20) DEFAULT NULL COMMENT '数据对象id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='数据对象关联字段表';

-- ----------------------------
-- Table structure for data_object_init
-- ----------------------------
DROP TABLE IF EXISTS `data_object_init`;
CREATE TABLE `data_object_init` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `data_object_id` bigint(20) DEFAULT NULL COMMENT '数据对象id',
  `operation` tinyint(2) DEFAULT NULL COMMENT '操作，0：读取，1：修改，2：删除',
  `permission` tinyint(4) DEFAULT NULL COMMENT '权限值，0：无权限，10：我的，20：团队，30：部门，40：全部',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `is_check` tinyint(2) DEFAULT NULL COMMENT '是否选中，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='数据对象初始化信息表';

-- ----------------------------
-- Table structure for declaration
-- ----------------------------
DROP TABLE IF EXISTS `declaration`;
CREATE TABLE `declaration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `reservation_id` bigint(20) DEFAULT NULL COMMENT '预约id',
  `number` varchar(128) DEFAULT NULL COMMENT '报单编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `pay_date` datetime DEFAULT NULL COMMENT '打款日期',
  `deal_amount` double DEFAULT NULL COMMENT '认购金额',
  `has_pay_evidence` tinyint(2) DEFAULT NULL COMMENT '是否已上传打款凭证；1：是，0：否',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `reason` varchar(256) DEFAULT NULL COMMENT '原因；驳回、取消时填写',
  `status` tinyint(4) DEFAULT NULL COMMENT '报单状态，  1：审核中  2：审核通过  3：驳回修改  4： 已取消  5：已作废',
  `user_id` bigint(20) DEFAULT NULL COMMENT '报单者id',
  `commit_date` datetime DEFAULT NULL COMMENT '最后提交时间',
  `operation_date` datetime DEFAULT NULL COMMENT '最后审核操作时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10060 DEFAULT CHARSET=utf8 COMMENT='报单';

-- ----------------------------
-- Table structure for declaration_attach
-- ----------------------------
DROP TABLE IF EXISTS `declaration_attach`;
CREATE TABLE `declaration_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `declaration_id` bigint(20) DEFAULT NULL COMMENT '报单id',
  `name` varchar(128) DEFAULT NULL COMMENT '附件名称',
  `url` varchar(256) DEFAULT NULL COMMENT 'url',
  `type` tinyint(4) DEFAULT NULL COMMENT '附件类型',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`declaration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='报单附件';

-- ----------------------------
-- Table structure for declaration_bank_rel
-- ----------------------------
DROP TABLE IF EXISTS `declaration_bank_rel`;
CREATE TABLE `declaration_bank_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `declaration_id` bigint(20) DEFAULT NULL COMMENT '报单id',
  `bank_id` bigint(20) DEFAULT NULL COMMENT '银行卡id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`declaration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='报单客户银行卡关系';

-- ----------------------------
-- Table structure for declaration_compliance
-- ----------------------------
DROP TABLE IF EXISTS `declaration_compliance`;
CREATE TABLE `declaration_compliance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `declaration_id` bigint(20) DEFAULT NULL COMMENT '报单id',
  `url` varchar(256) DEFAULT NULL COMMENT 'url',
  `name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型',
  `format_type` tinyint(4) DEFAULT NULL COMMENT '格式；1：图片，2：视频',
  `sequence` int(11) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`declaration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='报单合规文件';

-- ----------------------------
-- Table structure for declaration_credentials_rel
-- ----------------------------
DROP TABLE IF EXISTS `declaration_credentials_rel`;
CREATE TABLE `declaration_credentials_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `declaration_id` bigint(20) DEFAULT NULL COMMENT '报单id',
  `credentials_id` bigint(20) DEFAULT NULL COMMENT '证件id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`declaration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='报单客户证件关系表';

-- ----------------------------
-- Table structure for declaration_discard
-- ----------------------------
DROP TABLE IF EXISTS `declaration_discard`;
CREATE TABLE `declaration_discard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `declaration_id` bigint(20) NOT NULL COMMENT '报单id',
  `reason` varchar(256) DEFAULT NULL COMMENT '废弃原因',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`declaration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='报单废弃表';

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `code` varchar(64) DEFAULT NULL COMMENT '编码（最小八位数，最大支持八层，从00000001开始）',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_parent_id` (`parent_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `label` varchar(32) DEFAULT NULL COMMENT '文本',
  `value` varchar(32) DEFAULT NULL COMMENT '值',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100165 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8 COMMENT='业务字段';

-- ----------------------------
-- Table structure for field_config
-- ----------------------------
DROP TABLE IF EXISTS `field_config`;
CREATE TABLE `field_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `default_value` varchar(256) DEFAULT NULL COMMENT '默认值；如果是区间值，用逗号分隔如 数值：0,10000   日期：2017-10-10,,2099-10-10',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度；一般文本类型使用',
  `min_length` int(11) DEFAULT '0' COMMENT '最小长度；一般文本类型使用',
  `max_value` varchar(32) DEFAULT NULL COMMENT '最大值；一般数值和日期类型使用',
  `min_value` varchar(32) DEFAULT NULL COMMENT '最小值；一般数值和日期类型使用',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='业务对象字段配置';

-- ----------------------------
-- Table structure for field_group
-- ----------------------------
DROP TABLE IF EXISTS `field_group`;
CREATE TABLE `field_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `business_object_id` bigint(20) DEFAULT NULL COMMENT '业务对象id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `code` varchar(32) DEFAULT NULL COMMENT '编码(已经废弃，用id去区分唯一)',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_share` tinyint(4) DEFAULT '0' COMMENT '是否共用，0：否，1：是',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_parent_id` (`parent_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='业务对象字段分组';

-- ----------------------------
-- Table structure for field_group_rel
-- ----------------------------
DROP TABLE IF EXISTS `field_group_rel`;
CREATE TABLE `field_group_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `field_group_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段分组id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COMMENT='业务对象字段分组关联';

-- ----------------------------
-- Table structure for field_role
-- ----------------------------
DROP TABLE IF EXISTS `field_role`;
CREATE TABLE `field_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `role_id` bigint(20) DEFAULT '0' COMMENT '角色id（0：针对所有角色）',
  `is_role_readonly` tinyint(4) DEFAULT '1' COMMENT '是否角色只读，0：否，1：是',
  `is_role_access` tinyint(4) DEFAULT '1' COMMENT '是否角色访问，0：否，1：是',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象字段角色访问';

-- ----------------------------
-- Table structure for field_type
-- ----------------------------
DROP TABLE IF EXISTS `field_type`;
CREATE TABLE `field_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `demo_picture` varchar(256) DEFAULT NULL COMMENT '演示图片',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，1：文本，2：文本域，3：图片，4：日期，5：日期区间，6：下拉选项，7：单选，8：多选，9：数值，10：数值区间，11：地址',
  `is_search` tinyint(4) DEFAULT '0' COMMENT '是否可搜索，0：否，1：是',
  `is_share` tinyint(4) DEFAULT '0' COMMENT '是否共用，0：否，1：是',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='业务对象字段类型';

-- ----------------------------
-- Table structure for leads
-- ----------------------------
DROP TABLE IF EXISTS `leads`;
CREATE TABLE `leads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '线索类型，1：预约产品；2：注册；',
  `channel` tinyint(4) DEFAULT NULL COMMENT '渠道，1：网站；2：服务号',
  `content` varchar(128) DEFAULT NULL COMMENT '内容',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0：未处理；1：已联系；2：关闭',
  `process_user_id` bigint(20) DEFAULT NULL COMMENT '处理人id',
  `process_date` datetime DEFAULT NULL COMMENT '处理时间',
  `is_once_invalid` tinyint(4) DEFAULT '0' COMMENT '线索所属客户的状态，是否曾经被设置过无效，0：否，1：是，默认0',
  `is_alloted_cs` tinyint(4) DEFAULT NULL COMMENT '是否已被分配给客服，0：否，1：是',
  `is_alloted_fp` tinyint(4) DEFAULT NULL COMMENT '是否已被分配给理财师，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='销售线索';

-- ----------------------------
-- Table structure for leads_visit_rel
-- ----------------------------
DROP TABLE IF EXISTS `leads_visit_rel`;
CREATE TABLE `leads_visit_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `leads_id` bigint(20) DEFAULT NULL COMMENT '线索id',
  `user_visit_id` bigint(20) DEFAULT NULL COMMENT '回访id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='线索回访关系表';

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `login_date` datetime DEFAULT NULL COMMENT '登录日期',
  `login_ip` varchar(32) DEFAULT NULL COMMENT '登录ip',
  `login_address` varchar(128) DEFAULT NULL COMMENT '登录地址',
  `result_code` int(11) DEFAULT NULL COMMENT '结果码',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `login_type` tinyint(2) DEFAULT '0' COMMENT '登录类型，0：浏览器，1：APP',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_user_account_id` (`user_account_id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Table structure for msg_feed
-- ----------------------------
DROP TABLE IF EXISTS `msg_feed`;
CREATE TABLE `msg_feed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板ID',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '唯一码',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `template_code` varchar(64) DEFAULT NULL COMMENT '模板code',
  `params` varchar(1024) DEFAULT NULL COMMENT '参数',
  `type` tinyint(2) DEFAULT NULL COMMENT ' 1、客户  2、交易 ',
  `opt_time` datetime DEFAULT NULL COMMENT '真实时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`template_id`),
  KEY `user_id_index` (`user_id`),
  KEY `customer_index` (`customer_id`),
  KEY `template_id_index` (`template_id`),
  KEY `opt_time_index` (`opt_time`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COMMENT='动态';

-- ----------------------------
-- Table structure for msg_message
-- ----------------------------
DROP TABLE IF EXISTS `msg_message`;
CREATE TABLE `msg_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `feed_user_id` bigint(20) DEFAULT NULL COMMENT '查看消息的用户',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '唯一码',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `read_status` tinyint(2) DEFAULT '1' COMMENT '1未读 2已读',
  `template_code` varchar(64) DEFAULT NULL COMMENT '模板code',
  `params` varchar(1024) DEFAULT NULL COMMENT '参数',
  `first_type` tinyint(2) DEFAULT NULL COMMENT '一级消息 1、代办 ，2、消息',
  `two_type` tinyint(2) DEFAULT NULL COMMENT '二级类型  1、客户 ，2、产品 ，3、待回访，4、待跟进，5、待审核，6、待确认，7、交易',
  `opt_time` datetime DEFAULT NULL COMMENT '真实发生时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`template_id`),
  KEY `user_id_index` (`feed_user_id`),
  KEY `template_id_index` (`template_id`),
  KEY `opt_time_index` (`opt_time`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Table structure for msg_template
-- ----------------------------
DROP TABLE IF EXISTS `msg_template`;
CREATE TABLE `msg_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `feed_content` varchar(512) DEFAULT NULL COMMENT '动态内容',
  `message_content` varchar(512) DEFAULT NULL COMMENT '消息的内容',
  `app_content` varchar(512) DEFAULT NULL COMMENT 'app内容',
  `need_push` tinyint(2) DEFAULT NULL COMMENT '1 不需要 2需要',
  `push_content` varchar(128) DEFAULT NULL COMMENT 'push内容',
  `index_content` varchar(128) DEFAULT NULL COMMENT '首页内容',
  `app_action` varchar(128) DEFAULT NULL COMMENT 'app动作',
  `pc_action` varchar(128) DEFAULT NULL COMMENT 'pc跳转动作',
  `code` varchar(32) DEFAULT NULL COMMENT '唯一编码',
  `params` varchar(1024) DEFAULT NULL COMMENT '验证参数',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `code_index` (`code`),
  KEY `tenant_id_index` (`feed_content`(255))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='动态模板';

-- ----------------------------
-- Table structure for msg_template_type
-- ----------------------------
DROP TABLE IF EXISTS `msg_template_type`;
CREATE TABLE `msg_template_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `name` varchar(32) DEFAULT NULL COMMENT '动态类型名称',
  `type` tinyint(2) DEFAULT NULL COMMENT '1、动态 2、消息',
  `firstType` tinyint(2) DEFAULT NULL COMMENT '对应消息：1、代办   2、消息\r\n  对应动态\r\n:1、客户   2、交易',
  `twoTpe` tinyint(2) DEFAULT NULL COMMENT '只有消息才有二级：1、客户 ，2、产品 ，3、待回访，4、待跟进，5、待审核，6、待确认，7、交易',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='模板类型表';

-- ----------------------------
-- Table structure for msg_template_type_ref
-- ----------------------------
DROP TABLE IF EXISTS `msg_template_type_ref`;
CREATE TABLE `msg_template_type_ref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`tenant_id`),
  KEY `template_id_index` (`template_id`),
  KEY `type_id_index` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='模板类型关联关系表';

-- ----------------------------
-- Table structure for number_config
-- ----------------------------
DROP TABLE IF EXISTS `number_config`;
CREATE TABLE `number_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `decimal_length` int(11) DEFAULT NULL COMMENT '小数点位数',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `max_value` bigint(20) DEFAULT NULL COMMENT '最大值',
  `min_value` bigint(20) DEFAULT NULL COMMENT '最小值',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='业务对象字段数字类配置';

-- ----------------------------
-- Table structure for object_field
-- ----------------------------
DROP TABLE IF EXISTS `object_field`;
CREATE TABLE `object_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `field_id` bigint(20) DEFAULT NULL COMMENT '字段id',
  `business_object_id` bigint(20) DEFAULT NULL COMMENT '业务对象id',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `field_type_id` bigint(20) DEFAULT NULL COMMENT '字段类型id',
  `is_fix` tinyint(4) DEFAULT NULL COMMENT '是否固定显示位置，0：否，1：是',
  `display_type` tinyint(4) DEFAULT NULL COMMENT '显示方式，0：隐藏，1：显示，2：强制显示',
  `is_mandatory` tinyint(4) DEFAULT '0' COMMENT '是否必选，0：否，1： 是',
  `is_basic` tinyint(4) DEFAULT '0' COMMENT '是否基本属性，0：否，1： 是',
  `is_share` tinyint(4) DEFAULT '0' COMMENT '是否共用，0：否，1：是',
  `is_system` tinyint(4) DEFAULT '1' COMMENT '是否系统标准字段，0：否，1：是',
  `is_search` tinyint(4) DEFAULT '0' COMMENT '是否可搜索，0：否，1：是',
  `is_readonly` tinyint(4) DEFAULT '0' COMMENT '是否只读，0：否，1：是',
  `is_init` tinyint(4) DEFAULT '0' COMMENT '是否初始化，0：否，1：是',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `can_edit_mandatory` tinyint(4) DEFAULT NULL COMMENT '是否能够修改 必填项',
  `can_edit_enabled` tinyint(4) DEFAULT NULL COMMENT '是否可修改 启用 项',
  `access` tinyint(4) DEFAULT NULL COMMENT '权限，0：全部可见，1：部分可见',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='业务对象字段';

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '操作者用户账号id',
  `operate_type` tinyint(2) DEFAULT NULL COMMENT '操作类型（0：新建，1：编辑，2：删除，3：锁定，4：解锁）',
  `object_type` tinyint(2) DEFAULT NULL COMMENT '对象类型',
  `object_name` varchar(256) DEFAULT NULL COMMENT '对象名字',
  `object_id` bigint(20) DEFAULT NULL COMMENT '对象主键',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `description` varchar(512) DEFAULT NULL COMMENT '操作描述',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_user_account_id` (`user_account_id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_object_type` (`object_type`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `type_id` bigint(32) DEFAULT NULL COMMENT '产品类型编码',
  `name` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `issued_channel` varchar(32) DEFAULT NULL COMMENT '发行通道',
  `invest_domain` varchar(32) DEFAULT NULL COMMENT '投资标的',
  `time_limit` int(10) DEFAULT NULL COMMENT '投资期限',
  `mechanism` varchar(200) DEFAULT NULL COMMENT '管理机构',
  `buy_start_point` double DEFAULT NULL COMMENT '认购起点',
  `incremental_amount` double DEFAULT NULL COMMENT '递增金额',
  `buy_person_limit` int(11) DEFAULT NULL COMMENT '投资人数上限',
  `level` varchar(32) DEFAULT NULL COMMENT '产品等级',
  `risk_level` varchar(32) DEFAULT NULL COMMENT '风险等级',
  `receiver_id` bigint(20) DEFAULT NULL COMMENT '产品对接人',
  `assistant_id` bigint(20) DEFAULT NULL COMMENT '产品助理',
  `highlight` varchar(1000) DEFAULT NULL COMMENT '简要亮点',
  `on_line_time` datetime DEFAULT NULL COMMENT '上线时间',
  `issued_status` int(11) DEFAULT NULL COMMENT '产品发行状态 0:未上线  1:上线准备中  2:预售  3:募集中  4:募集结束  5:存续封闭中 6:清算退出',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核状态  0: 未提交  1:已撤销  2:审核中  3:已驳回  4:已通过',
  `wx_content` varchar(1000) DEFAULT NULL COMMENT '微信版内容',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_name` (`name`),
  KEY `i_receiver_id` (`receiver_id`),
  KEY `i_assistant_id` (`assistant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='产品基本信息';

-- ----------------------------
-- Table structure for product_attach
-- ----------------------------
DROP TABLE IF EXISTS `product_attach`;
CREATE TABLE `product_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `source_name` varchar(250) DEFAULT NULL COMMENT '文件名称',
  `url` varchar(250) DEFAULT NULL COMMENT 'url',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `sort` double DEFAULT NULL COMMENT '排序',
  `type` varchar(100) DEFAULT NULL COMMENT '附件类型',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Table structure for product_commission
-- ----------------------------
DROP TABLE IF EXISTS `product_commission`;
CREATE TABLE `product_commission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `commission_rule_id` bigint(20) DEFAULT NULL COMMENT '佣金规则id',
  `sale_max` double DEFAULT NULL COMMENT '销售最大值',
  `sale_min` double DEFAULT NULL COMMENT '销售最小值',
  `commission_type` varchar(32) DEFAULT NULL COMMENT '佣金类型',
  `front_commission` double DEFAULT NULL COMMENT '前端佣金',
  `back_commission` double DEFAULT NULL COMMENT '后端佣金',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `commission_rule_id` (`commission_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_commission_rule
-- ----------------------------
DROP TABLE IF EXISTS `product_commission_rule`;
CREATE TABLE `product_commission_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `rule_name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `product_data_dictionary`;
CREATE TABLE `product_data_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `value` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `sort` double DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Table structure for product_examine
-- ----------------------------
DROP TABLE IF EXISTS `product_examine`;
CREATE TABLE `product_examine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `apply_user_id` bigint(20) DEFAULT NULL COMMENT '流程发起人id',
  `issued_status` int(11) DEFAULT NULL COMMENT '发行状态',
  `req_issued_status` int(11) DEFAULT NULL COMMENT '请求审核的 状态',
  `approve_id` bigint(20) DEFAULT NULL COMMENT '审核人',
  `approve_date` datetime DEFAULT NULL COMMENT '审核时间',
  `reason` varchar(512) DEFAULT NULL COMMENT '原因',
  `status` int(11) DEFAULT NULL COMMENT '审核状态， 0：未提交  1：审核中  2：已通过  3：已驳回  4： 已撤销',
  `business_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='产品审核';

-- ----------------------------
-- Table structure for product_field_value
-- ----------------------------
DROP TABLE IF EXISTS `product_field_value`;
CREATE TABLE `product_field_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `reference_table_id` bigint(20) DEFAULT NULL COMMENT '引用表id',
  `value` longtext COMMENT '字段值',
  `slot` int(11) DEFAULT '0' COMMENT '位置，一个字段有多个值时使用，按数字从小到大排列，例如日期区间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='业务对象字段值';

-- ----------------------------
-- Table structure for product_income
-- ----------------------------
DROP TABLE IF EXISTS `product_income`;
CREATE TABLE `product_income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `income_rule_id` bigint(20) DEFAULT NULL COMMENT '收益规则id',
  `buy_max` double DEFAULT NULL COMMENT '认购最大值',
  `buy_min` double DEFAULT NULL COMMENT '认购最小值',
  `buy_time_limit` bigint(20) DEFAULT NULL COMMENT '认购期限',
  `income_type` varchar(32) DEFAULT NULL COMMENT '收益类型',
  `fix_income_rate` double DEFAULT NULL COMMENT '收益率',
  `float_income_rate` double DEFAULT NULL COMMENT '浮动收益',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_income_id` (`income_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_income_rule
-- ----------------------------
DROP TABLE IF EXISTS `product_income_rule`;
CREATE TABLE `product_income_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `rule_name` varchar(32) DEFAULT NULL COMMENT '规则名称',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_nav
-- ----------------------------
DROP TABLE IF EXISTS `product_nav`;
CREATE TABLE `product_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `unit_nav` double DEFAULT NULL COMMENT '单位净值',
  `total_nav` double DEFAULT NULL COMMENT '累计净值',
  `up_down_rate` double DEFAULT NULL COMMENT '涨跌幅',
  `nav_date` date DEFAULT NULL COMMENT '净值日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`),
  KEY `i_nav_date` (`nav_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品净值';

-- ----------------------------
-- Table structure for product_notice
-- ----------------------------
DROP TABLE IF EXISTS `product_notice`;
CREATE TABLE `product_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `notice_type_id` bigint(20) DEFAULT NULL COMMENT '公告类型',
  `status` int(11) DEFAULT NULL COMMENT '审核状态 1未提交  2审核中  3已通过  4已驳回  5 已撤销',
  `send_time` datetime DEFAULT NULL COMMENT '定时发送时间',
  `is_send` tinyint(3) DEFAULT '0' COMMENT '是否发送  1发送 0未发送',
  `is_timing_send` tinyint(3) DEFAULT NULL COMMENT '是否定时发送（0：不是，1：是）',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `reason` varchar(1000) DEFAULT NULL COMMENT '原因',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`),
  KEY `i_notice_type_id` (`notice_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品公告';

-- ----------------------------
-- Table structure for product_notice_attach
-- ----------------------------
DROP TABLE IF EXISTS `product_notice_attach`;
CREATE TABLE `product_notice_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `notice_id` bigint(20) DEFAULT NULL COMMENT '公告id',
  `source_name` varchar(250) DEFAULT NULL COMMENT '文件名称',
  `url` varchar(250) DEFAULT NULL COMMENT 'url',
  `sort` double DEFAULT NULL COMMENT '排序',
  `type` varchar(32) DEFAULT NULL COMMENT '附件类型',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_notice_id` (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品公告附件';

-- ----------------------------
-- Table structure for product_notice_examine
-- ----------------------------
DROP TABLE IF EXISTS `product_notice_examine`;
CREATE TABLE `product_notice_examine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `notice_id` bigint(20) DEFAULT NULL COMMENT '公告id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `notice_type` varchar(32) DEFAULT NULL COMMENT '公告类型',
  `status` int(11) DEFAULT NULL COMMENT '审核状态 1未提交  2审核中  3已通过  4已驳回  5 已撤销',
  `reason` varchar(1000) DEFAULT NULL COMMENT '原因',
  `create_user` varchar(32) DEFAULT NULL COMMENT '申请人',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '申请人Id',
  `create_date` datetime DEFAULT NULL COMMENT '申请时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `update_user` varchar(32) DEFAULT NULL COMMENT '审核人',
  `update_date` datetime DEFAULT NULL COMMENT '审核时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `notice_type_id` bigint(20) DEFAULT NULL COMMENT '公告类型ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品公告审核表';

-- ----------------------------
-- Table structure for product_notice_type
-- ----------------------------
DROP TABLE IF EXISTS `product_notice_type`;
CREATE TABLE `product_notice_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(64) DEFAULT NULL COMMENT '类型名称',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `code` varchar(32) DEFAULT NULL COMMENT '产品公告CODE',
  `is_permit_delete` tinyint(2) DEFAULT '1' COMMENT '1 允许删除，0不允许删除',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品公告类型';

-- ----------------------------
-- Table structure for product_sale
-- ----------------------------
DROP TABLE IF EXISTS `product_sale`;
CREATE TABLE `product_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `sale_start_date` date DEFAULT NULL COMMENT '拟销售日期开始日期',
  `sale_end_date` date DEFAULT NULL COMMENT '拟销售日期结束日期',
  `is_scale` tinyint(2) DEFAULT NULL COMMENT '是否有规模',
  `product_scale` double DEFAULT NULL COMMENT '产品规模',
  `currency_code` varchar(32) DEFAULT NULL COMMENT '投资币种',
  `pay_account` varchar(200) DEFAULT NULL COMMENT '打款账号',
  `account_name` varchar(200) DEFAULT NULL COMMENT '开户名',
  `raise_bank` varchar(200) DEFAULT NULL COMMENT '募集银行',
  `pay_remark` varchar(1000) DEFAULT NULL COMMENT '打款备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='产品销售信息';

-- ----------------------------
-- Table structure for product_supplier
-- ----------------------------
DROP TABLE IF EXISTS `product_supplier`;
CREATE TABLE `product_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_supplier_id` (`supplier_id`),
  KEY `i_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_supplier_quotation
-- ----------------------------
DROP TABLE IF EXISTS `product_supplier_quotation`;
CREATE TABLE `product_supplier_quotation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `product_supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商报价id',
  `sale_max` double DEFAULT NULL COMMENT '销售金额最大',
  `sale_min` double DEFAULT NULL COMMENT '销售金额最小',
  `commission_type` varchar(32) DEFAULT NULL COMMENT '佣金类型',
  `front_commission` double DEFAULT NULL COMMENT '前端佣金',
  `back_commission` double DEFAULT NULL COMMENT '后端佣金',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_product_supplier_id` (`product_supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='产品供应商报价';

-- ----------------------------
-- Table structure for proudct_focus
-- ----------------------------
DROP TABLE IF EXISTS `proudct_focus`;
CREATE TABLE `proudct_focus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL COMMENT '租户ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `focus_date` datetime DEFAULT NULL COMMENT '关注时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tenant_product_user` (`tenant_id`,`product_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='产品用户关注表';

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `number` varchar(32) DEFAULT NULL COMMENT '预约编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `estimate_pay_date` datetime DEFAULT NULL COMMENT '预计打款日期',
  `reservation_amount` double DEFAULT NULL COMMENT '预约金额',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `reason` varchar(256) DEFAULT NULL COMMENT '原因；驳回、取消时填写',
  `status` tinyint(4) DEFAULT NULL COMMENT '预约状态， 0：未提交  1：审核中  2：已通过  3：已驳回  4： 已取消',
  `user_id` bigint(20) DEFAULT NULL COMMENT '预约者id',
  `commit_date` datetime DEFAULT NULL COMMENT '最后提交时间',
  `operation_date` datetime DEFAULT NULL COMMENT '最后审核操作时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10129 DEFAULT CHARSET=utf8 COMMENT='工作流业务关联表';

-- ----------------------------
-- Table structure for reservation_discard
-- ----------------------------
DROP TABLE IF EXISTS `reservation_discard`;
CREATE TABLE `reservation_discard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `reservation_id` bigint(20) NOT NULL COMMENT '预约id',
  `reason` varchar(256) DEFAULT NULL COMMENT '废弃原因',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='预约废弃表';

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `url` varchar(256) DEFAULT NULL COMMENT '链接',
  `is_menu` tinyint(2) DEFAULT '1' COMMENT '是否菜单，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `is_deplay` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_name` (`name`),
  KEY `i_parent_id` (`parent_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_share` tinyint(2) DEFAULT '0' COMMENT '是否共用，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `is_system` tinyint(2) DEFAULT '0' COMMENT '是否系统预置，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_parent_id` (`parent_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_resource_id` (`resource_id`),
  KEY `i_role_id` (`role_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1751 DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Table structure for role_resource_init
-- ----------------------------
DROP TABLE IF EXISTS `role_resource_init`;
CREATE TABLE `role_resource_init` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色资源初始化';

-- ----------------------------
-- Table structure for role_system
-- ----------------------------
DROP TABLE IF EXISTS `role_system`;
CREATE TABLE `role_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_role_id` (`role_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色系统表';

-- ----------------------------
-- Table structure for select_config
-- ----------------------------
DROP TABLE IF EXISTS `select_config`;
CREATE TABLE `select_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `value` int(11) DEFAULT NULL COMMENT '选项值',
  `label` varchar(256) DEFAULT NULL COMMENT '选项文本',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `is_system` tinyint(2) DEFAULT NULL COMMENT '是否系统预置',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='业务对象字段选项类配置';

-- ----------------------------
-- Table structure for select_config_reference
-- ----------------------------
DROP TABLE IF EXISTS `select_config_reference`;
CREATE TABLE `select_config_reference` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `reference_table` varchar(32) DEFAULT NULL COMMENT '引用表',
  `reference_table_id` bigint(20) DEFAULT NULL COMMENT '引用表id',
  `select_config_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段选项类配置id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象字段选项类配置引用表';

-- ----------------------------
-- Table structure for sms_account
-- ----------------------------
DROP TABLE IF EXISTS `sms_account`;
CREATE TABLE `sms_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `access_key_id` varchar(128) NOT NULL,
  `access_key_secret` varchar(128) NOT NULL,
  `sign` varchar(16) NOT NULL COMMENT '短信签名',
  `is_enable` tinyint(2) DEFAULT '1' COMMENT '是否可用，1：是，0：否',
  `create_date` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sms_account_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='短信账号';

-- ----------------------------
-- Table structure for sms_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sms_captcha`;
CREATE TABLE `sms_captcha` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `template_code` varchar(32) DEFAULT '0' COMMENT '模版CODE',
  `code` varchar(16) DEFAULT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效',
  `mobile` blob COMMENT '手机号码',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='短信验证码';

-- ----------------------------
-- Table structure for sms_conf
-- ----------------------------
DROP TABLE IF EXISTS `sms_conf`;
CREATE TABLE `sms_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `use_defalut_channel` tinyint(4) DEFAULT NULL COMMENT '如果未设置短信账号(sms_account无数据)，是否使用默认通道；1：是，0：否',
  `is_filter_dimission` tinyint(4) DEFAULT NULL COMMENT '是否过滤离职员工，只针对内部员工；1：是，0：否',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信配置';

-- ----------------------------
-- Table structure for sms_extend
-- ----------------------------
DROP TABLE IF EXISTS `sms_extend`;
CREATE TABLE `sms_extend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `template_code` varchar(32) DEFAULT '0' COMMENT '模版CODE',
  `roles` varchar(32) DEFAULT NULL COMMENT '角色id，多个逗号分隔',
  `users` varchar(64) DEFAULT NULL COMMENT '用户id，多个逗号分隔',
  `mobile` varchar(256) DEFAULT NULL COMMENT '需要扩展的手机号码，多个逗号分隔',
  `type` tinyint(2) DEFAULT NULL COMMENT '扩展类型，1：追加；2：过滤',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信扩展';

-- ----------------------------
-- Table structure for sms_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_history`;
CREATE TABLE `sms_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `response_id` bigint(20) DEFAULT '0' COMMENT '短信响应id',
  `mobile` blob COMMENT '手机号码',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='短信发送历史';

-- ----------------------------
-- Table structure for sms_response
-- ----------------------------
DROP TABLE IF EXISTS `sms_response`;
CREATE TABLE `sms_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `template_code` varchar(32) DEFAULT '0' COMMENT '模版CODE',
  `template_param` varchar(64) DEFAULT NULL COMMENT '模版参数',
  `seq_id` varchar(32) DEFAULT NULL COMMENT '流水号',
  `biz_id` varchar(32) DEFAULT NULL COMMENT '业务id，发送回执id',
  `code` varchar(32) DEFAULT NULL COMMENT '状态码',
  `message` varchar(64) DEFAULT NULL COMMENT '状态码描述',
  `smsType` tinyint(4) DEFAULT NULL COMMENT '短信类型；1：验证码，2：通知，3：群发推广',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='短信发送返回结果';

-- ----------------------------
-- Table structure for sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sms_template`;
CREATE TABLE `sms_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL COMMENT '模版编码',
  `third_party_code` varchar(16) DEFAULT NULL COMMENT '对应三方平台编码',
  `name` varchar(32) DEFAULT NULL COMMENT '模版名称',
  `message` varchar(256) DEFAULT NULL COMMENT '模版内容',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `is_enable` tinyint(2) DEFAULT NULL COMMENT '是否启用',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `birth` date DEFAULT NULL COMMENT '生日',
  `sex` tinyint(2) DEFAULT '0' COMMENT '性别，0：未知；1：男；2：女',
  `is_dimission` tinyint(2) DEFAULT '0' COMMENT '是否离职，0：否；1：是',
  `job_number` varchar(32) DEFAULT NULL COMMENT '工号',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_email` (`email`),
  KEY `i_job_number` (`job_number`),
  KEY `i_real_name` (`real_name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职员表';

-- ----------------------------
-- Table structure for staff_department
-- ----------------------------
DROP TABLE IF EXISTS `staff_department`;
CREATE TABLE `staff_department` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '职员id',
  `department_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职员部门表';

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(3) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Table structure for tenant_channel
-- ----------------------------
DROP TABLE IF EXISTS `tenant_channel`;
CREATE TABLE `tenant_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '短信通道id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='如果租户在这个表有数据，则使用此记录指定的通道，否则使用默认通道';

-- ----------------------------
-- Table structure for type_property
-- ----------------------------
DROP TABLE IF EXISTS `type_property`;
CREATE TABLE `type_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `field_type_id` bigint(20) DEFAULT NULL COMMENT '字段类型id',
  `clazz` varchar(512) DEFAULT NULL COMMENT '属性值class\r\n            \r\n            文本类：[{"type":"text","key":"maxLength","value":"256","name":"最大长度","description":"最大长度不能超过256个字符","sequence":"1","isEnabled":"1"},{"type":"text","key":"minLength","value":"1","name":"最小长度","description":"最小长度不能小于1个字符","sequence":"2","isEnabled":"1"},{"type":"text","key":"description","value":"","name":"帮助文本","description":"最大长度不能超过256个字符","sequence":"3","isEnabled":"1"},{"type":"text","key":"defaultValue","value":"256","name":"默认值","description":"最大长度不能超过256个字符","sequence":"4","isEnabled":"1"}]\r\n            \r\n            文本域类：[{"type":"text","key":"maxLength","value":"65535","name":"最大长度","description":"最大长度不能超过65535个字符","sequence":"1","isEnabled":"1"},{"type":"text","key":"minLength","value":"1","name":"最小长度","description":"最小长度不能小于1个字符","sequence":"2","isEnabled":"1"},{"type":"text","key":"description","value":"","name":"帮助文本","description":"最大长度不能超过256个字符","sequence":"3","isEnabled":"1"}]\r\n            \r\n            单选类：[{"type":"text","key":"maxLength","value":"256","name',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象字段类型属性';

-- ----------------------------
-- Table structure for ubsresource
-- ----------------------------
DROP TABLE IF EXISTS `ubsresource`;
CREATE TABLE `ubsresource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `system_code` varchar(32) NOT NULL COMMENT '系统编码',
  `parent_id` bigint(20) DEFAULT '-1' COMMENT '父id，-1：表示无父类',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `url` varchar(256) DEFAULT NULL COMMENT '链接',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，0：无效；1：有效',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 ',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `resource_type` varchar(32) DEFAULT NULL COMMENT '资源类型，1：外部资源；2：内部资源',
  `menue` tinyint(2) DEFAULT '1' COMMENT '1：菜单 2：功能',
  `is_delete` tinyint(2) DEFAULT '0',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_i_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Table structure for update_log
-- ----------------------------
DROP TABLE IF EXISTS `update_log`;
CREATE TABLE `update_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `model` varchar(32) DEFAULT NULL COMMENT '修改模块',
  `object_id` bigint(20) DEFAULT NULL COMMENT '修改对象id',
  `update_item` varchar(64) DEFAULT NULL COMMENT '修改项',
  `update_before_content` varchar(512) DEFAULT NULL COMMENT '修改前内容',
  `update_after_content` varchar(512) DEFAULT NULL COMMENT '修改后内容',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `create_date` datetime DEFAULT NULL COMMENT '操作时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改id',
  `client` varchar(32) DEFAULT NULL COMMENT '修改客户端',
  `clolumn_name` varchar(32) DEFAULT NULL COMMENT '字段名',
  `is_delete` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_object_id_index` (`model`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='修改日志表';

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(1000) DEFAULT NULL COMMENT '密码',
  `is_lock` tinyint(2) DEFAULT NULL COMMENT '是否锁定，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `is_system` tinyint(2) DEFAULT '0' COMMENT '是否系统(0:否，1:是)',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ui_email` (`email`),
  UNIQUE KEY `ui_mobile` (`mobile`),
  UNIQUE KEY `ui_username` (`username`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Table structure for user_customer
-- ----------------------------
DROP TABLE IF EXISTS `user_customer`;
CREATE TABLE `user_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `distribution_date` datetime DEFAULT NULL COMMENT '分配日期',
  `distribution_user_id` bigint(20) DEFAULT NULL COMMENT '分配人',
  `is_delete` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `AK_customer_key` (`customer_id`),
  KEY `user_customer_index` (`customer_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3240 DEFAULT CHARSET=utf8 COMMENT='客户归属表';

-- ----------------------------
-- Table structure for user_customer_focus
-- ----------------------------
DROP TABLE IF EXISTS `user_customer_focus`;
CREATE TABLE `user_customer_focus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `focus_date` datetime DEFAULT NULL COMMENT '关注时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `user_customer_index` (`customer_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='用户客户关注表';

-- ----------------------------
-- Table structure for user_custom_field
-- ----------------------------
DROP TABLE IF EXISTS `user_custom_field`;
CREATE TABLE `user_custom_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `object_field_id` bigint(20) DEFAULT NULL COMMENT '业务对象字段id',
  `business_object_id` bigint(20) DEFAULT NULL COMMENT '业务对象id',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_user_id` (`user_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户自定义显示字段';

-- ----------------------------
-- Table structure for user_department
-- ----------------------------
DROP TABLE IF EXISTS `user_department`;
CREATE TABLE `user_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `department_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_department_id` (`department_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`),
  KEY `FK_user_account_id` (`user_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='用户部门表';

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `birth` date DEFAULT NULL COMMENT '生日',
  `sex` tinyint(2) DEFAULT '0' COMMENT '性别，0：未知；1：男；2：女',
  `register_source` varchar(32) DEFAULT NULL COMMENT '注册来源',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_user_account_id` (`user_account_id`) USING BTREE,
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_real_name` (`real_name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户详情表';

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Table structure for user_staff
-- ----------------------------
DROP TABLE IF EXISTS `user_staff`;
CREATE TABLE `user_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `is_dimission` tinyint(2) DEFAULT '0' COMMENT '是否离职，0：否；1：是',
  `job_number` varchar(32) DEFAULT NULL COMMENT '工号',
  `leader_id` bigint(20) DEFAULT NULL COMMENT '汇报上级id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_job_number` (`job_number`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户职员表';

-- ----------------------------
-- Table structure for user_system
-- ----------------------------
DROP TABLE IF EXISTS `user_system`;
CREATE TABLE `user_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `user_account_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户系统表';

-- ----------------------------
-- Table structure for user_visit
-- ----------------------------
DROP TABLE IF EXISTS `user_visit`;
CREATE TABLE `user_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '回访人id',
  `sub_date` datetime DEFAULT NULL COMMENT '提交回访时间',
  `matter` varchar(128) DEFAULT NULL COMMENT '回访事由',
  `visit_date` datetime DEFAULT NULL COMMENT '回访时间',
  `type` tinyint(2) DEFAULT NULL COMMENT '回访方式(1：电话，2：短信，3：微信/QQ，4：上门拜访，5：其他)',
  `status` tinyint(2) DEFAULT NULL COMMENT '回访状态（1：成功，0：失败）',
  `content` varchar(256) DEFAULT NULL COMMENT '回访内容',
  `next_time` datetime DEFAULT NULL COMMENT '下次回访时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `next_visit_id` bigint(20) DEFAULT NULL COMMENT '下次回访id',
  `send_status` tinyint(2) DEFAULT '0' COMMENT ' 发送消息的状态（0：没有发送，1：已经发送，2 ：不需要发送）',
  PRIMARY KEY (`id`),
  KEY `tenant_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='客户回访';

-- ----------------------------
-- Table structure for workflow_business_rel
-- ----------------------------
DROP TABLE IF EXISTS `workflow_business_rel`;
CREATE TABLE `workflow_business_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `object_id` bigint(20) DEFAULT NULL COMMENT '对象id',
  `business_no` varchar(64) DEFAULT NULL COMMENT '业务流水号',
  `type` varchar(32) DEFAULT NULL COMMENT '类型，1：预约，2：报单',
  `is_complete` tinyint(4) DEFAULT NULL COMMENT '是否已完成，1：是，0：否',
  `init_param` varchar(256) DEFAULT NULL COMMENT '初始参数',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COMMENT='工作流业务关联表';







DELETE FROM app_login;
DELETE FROM browser_login;
DELETE FROM business_object;
DELETE FROM cc_customer_user_rel;
DELETE FROM cc_login;
DELETE FROM cc_login_detail;
DELETE FROM cc_question;
DELETE FROM cc_question_answer;
DELETE FROM cc_question_option;
DELETE FROM cc_question_score;
DELETE FROM cc_question_type;
DELETE FROM cc_risk_rating;
DELETE FROM cc_ticket;
DELETE FROM cc_user_account;
DELETE FROM cc_user_detail;
DELETE FROM cloud_file;
DELETE FROM customer;
DELETE FROM customer_anniversaries;
DELETE FROM customer_attach;
DELETE FROM customer_back_examine;
DELETE FROM customer_bank;
DELETE FROM customer_bank_rel;
DELETE FROM customer_credentials;
DELETE FROM customer_credentials_rel;
DELETE FROM customer_detail;
DELETE FROM customer_follow_up;
DELETE FROM customer_invest_type;
DELETE FROM customer_tag;
DELETE FROM customer_transfer;
DELETE FROM data_access;
DELETE FROM data_object;
DELETE FROM data_object_access;
DELETE FROM data_object_field;
DELETE FROM data_object_init;
DELETE FROM declaration;
DELETE FROM declaration_attach;
DELETE FROM declaration_bank_rel;
DELETE FROM declaration_compliance;
DELETE FROM declaration_credentials_rel;
DELETE FROM declaration_discard;
DELETE FROM department;
DELETE FROM dictionary;
DELETE FROM field;
DELETE FROM field_config;
DELETE FROM field_group;
DELETE FROM field_group_rel;
DELETE FROM field_role;
DELETE FROM field_type;
DELETE FROM leads;
DELETE FROM leads_visit_rel;
DELETE FROM login_log;
DELETE FROM msg_feed;
DELETE FROM msg_message;
DELETE FROM msg_template;
DELETE FROM msg_template_type;
DELETE FROM msg_template_type_ref;
DELETE FROM number_config;
DELETE FROM object_field;
DELETE FROM operation_log;
DELETE FROM product;
DELETE FROM product_attach;
DELETE FROM product_commission;
DELETE FROM product_commission_rule;
DELETE FROM product_data_dictionary;
DELETE FROM product_examine;
DELETE FROM product_field_value;
DELETE FROM product_income;
DELETE FROM product_income_rule;
DELETE FROM product_nav;
DELETE FROM product_notice;
DELETE FROM product_notice_attach;
DELETE FROM product_notice_examine;
DELETE FROM product_notice_type;
DELETE FROM product_sale;
DELETE FROM product_supplier;
DELETE FROM product_supplier_quotation;
DELETE FROM proudct_focus;
DELETE FROM reservation;
DELETE FROM reservation_discard;
DELETE FROM resource;
DELETE FROM role;
DELETE FROM role_resource;
DELETE FROM role_resource_init;
DELETE FROM role_system;
DELETE FROM select_config;
DELETE FROM select_config_reference;
DELETE FROM sms_account;
DELETE FROM sms_captcha;
DELETE FROM sms_conf;
DELETE FROM sms_extend;
DELETE FROM sms_history;
DELETE FROM sms_response;
DELETE FROM sms_template;
DELETE FROM staff;
DELETE FROM staff_department;
DELETE FROM supplier;
DELETE FROM tag;
DELETE FROM tenant_channel;
DELETE FROM type_property;
DELETE FROM ubsresource;
DELETE FROM update_log;
DELETE FROM user_account;
DELETE FROM user_custom_field;
DELETE FROM user_customer;
DELETE FROM user_customer_focus;
DELETE FROM user_department;
DELETE FROM user_detail;
DELETE FROM user_role;
DELETE FROM user_staff;
DELETE FROM user_system;
DELETE FROM user_visit;
DELETE FROM workflow_business_rel;




ALTER TABLE app_login auto_increment=1;
ALTER TABLE browser_login auto_increment=1;
ALTER TABLE business_object auto_increment=1;
ALTER TABLE cc_customer_user_rel auto_increment=1;
ALTER TABLE cc_login auto_increment=1;
ALTER TABLE cc_login_detail auto_increment=1;
ALTER TABLE cc_question auto_increment=1;
ALTER TABLE cc_question_answer auto_increment=1;
ALTER TABLE cc_question_option auto_increment=1;
ALTER TABLE cc_question_score auto_increment=1;
ALTER TABLE cc_question_type auto_increment=1;
ALTER TABLE cc_risk_rating auto_increment=1;
ALTER TABLE cc_ticket auto_increment=1;
ALTER TABLE cc_user_account auto_increment=1;
ALTER TABLE cc_user_detail auto_increment=1;
ALTER TABLE cloud_file auto_increment=1;
ALTER TABLE customer auto_increment=1;
ALTER TABLE customer_anniversaries auto_increment=1;
ALTER TABLE customer_attach auto_increment=1;
ALTER TABLE customer_back_examine auto_increment=1;
ALTER TABLE customer_bank auto_increment=1;
ALTER TABLE customer_bank_rel auto_increment=1;
ALTER TABLE customer_credentials auto_increment=1;
ALTER TABLE customer_credentials_rel auto_increment=1;
ALTER TABLE customer_detail auto_increment=1;
ALTER TABLE customer_follow_up auto_increment=1;
ALTER TABLE customer_invest_type auto_increment=1;
ALTER TABLE customer_tag auto_increment=1;
ALTER TABLE customer_transfer auto_increment=1;
ALTER TABLE data_access auto_increment=1;
ALTER TABLE data_object auto_increment=1;
ALTER TABLE data_object_access auto_increment=1;
ALTER TABLE data_object_field auto_increment=1;
ALTER TABLE data_object_init auto_increment=1;
ALTER TABLE declaration auto_increment=1;
ALTER TABLE declaration_attach auto_increment=1;
ALTER TABLE declaration_bank_rel auto_increment=1;
ALTER TABLE declaration_compliance auto_increment=1;
ALTER TABLE declaration_credentials_rel auto_increment=1;
ALTER TABLE declaration_discard auto_increment=1;
ALTER TABLE department auto_increment=1;
ALTER TABLE dictionary auto_increment=1;
ALTER TABLE field auto_increment=1;
ALTER TABLE field_config auto_increment=1;
ALTER TABLE field_group auto_increment=1;
ALTER TABLE field_group_rel auto_increment=1;
ALTER TABLE field_role auto_increment=1;
ALTER TABLE field_type auto_increment=1;
ALTER TABLE leads auto_increment=1;
ALTER TABLE leads_visit_rel auto_increment=1;
ALTER TABLE login_log auto_increment=1;
ALTER TABLE msg_feed auto_increment=1;
ALTER TABLE msg_message auto_increment=1;
ALTER TABLE msg_template auto_increment=1;
ALTER TABLE msg_template_type auto_increment=1;
ALTER TABLE msg_template_type_ref auto_increment=1;
ALTER TABLE number_config auto_increment=1;
ALTER TABLE object_field auto_increment=1;
ALTER TABLE operation_log auto_increment=1;
ALTER TABLE product auto_increment=1;
ALTER TABLE product_attach auto_increment=1;
ALTER TABLE product_commission auto_increment=1;
ALTER TABLE product_commission_rule auto_increment=1;
ALTER TABLE product_data_dictionary auto_increment=1;
ALTER TABLE product_examine auto_increment=1;
ALTER TABLE product_field_value auto_increment=1;
ALTER TABLE product_income auto_increment=1;
ALTER TABLE product_income_rule auto_increment=1;
ALTER TABLE product_nav auto_increment=1;
ALTER TABLE product_notice auto_increment=1;
ALTER TABLE product_notice_attach auto_increment=1;
ALTER TABLE product_notice_examine auto_increment=1;
ALTER TABLE product_notice_type auto_increment=1;
ALTER TABLE product_sale auto_increment=1;
ALTER TABLE product_supplier auto_increment=1;
ALTER TABLE product_supplier_quotation auto_increment=1;
ALTER TABLE proudct_focus auto_increment=1;
ALTER TABLE reservation auto_increment=1;
ALTER TABLE reservation_discard auto_increment=1;
ALTER TABLE resource auto_increment=1;
ALTER TABLE role auto_increment=1;
ALTER TABLE role_resource auto_increment=1;
ALTER TABLE role_resource_init auto_increment=1;
ALTER TABLE role_system auto_increment=1;
ALTER TABLE select_config auto_increment=1;
ALTER TABLE select_config_reference auto_increment=1;
ALTER TABLE sms_account auto_increment=1;
ALTER TABLE sms_captcha auto_increment=1;
ALTER TABLE sms_conf auto_increment=1;
ALTER TABLE sms_extend auto_increment=1;
ALTER TABLE sms_history auto_increment=1;
ALTER TABLE sms_response auto_increment=1;
ALTER TABLE sms_template auto_increment=1;
ALTER TABLE staff auto_increment=1;
ALTER TABLE staff_department auto_increment=1;
ALTER TABLE supplier auto_increment=1;
ALTER TABLE tag auto_increment=1;
ALTER TABLE tenant_channel auto_increment=1;
ALTER TABLE type_property auto_increment=1;
ALTER TABLE ubsresource auto_increment=1;
ALTER TABLE update_log auto_increment=1;
ALTER TABLE user_account auto_increment=1;
ALTER TABLE user_custom_field auto_increment=1;
ALTER TABLE user_customer auto_increment=1;
ALTER TABLE user_customer_focus auto_increment=1;
ALTER TABLE user_department auto_increment=1;
ALTER TABLE user_detail auto_increment=1;
ALTER TABLE user_role auto_increment=1;
ALTER TABLE user_staff auto_increment=1;
ALTER TABLE user_system auto_increment=1;
ALTER TABLE user_visit auto_increment=1;
ALTER TABLE workflow_business_rel auto_increment=1;

ALTER TABLE `customer` auto_increment=10000;
ALTER TABLE `role` auto_increment=1000;
ALTER TABLE `field` auto_increment=10000;

