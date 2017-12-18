/*
Navicat MySQL Data Transfer

Source Server         : yundao_dev
Source Server Version : 50634
Source Host           : rds996n72786ft1i3ee4o.mysql.rds.aliyuncs.com:3306
Source Database       : scm

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-09-16 17:18:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `name` varchar(128) DEFAULT NULL COMMENT '名字',
  `serial_number` varchar(32) DEFAULT NULL COMMENT '流水号',
  `begin_date` datetime DEFAULT NULL COMMENT '开始日期',
  `expire_date` datetime DEFAULT NULL COMMENT '到期日期',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`),
  CONSTRAINT `FK_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Table structure for data_source
-- ----------------------------
DROP TABLE IF EXISTS `data_source`;
CREATE TABLE `data_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `name` varchar(64) DEFAULT NULL COMMENT '名字',
  `driver_class_name` varchar(64) DEFAULT NULL COMMENT '驱动类名',
  `url` varchar(1024) DEFAULT NULL COMMENT '数据库链接（加密）',
  `username` varchar(512) DEFAULT NULL COMMENT '用户名（加密）',
  `password` varchar(512) DEFAULT NULL COMMENT '密码（加密）',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='数据源表';

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
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_parent_id` (`parent_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Table structure for domain_name
-- ----------------------------
DROP TABLE IF EXISTS `domain_name`;
CREATE TABLE `domain_name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `url` varchar(512) DEFAULT NULL COMMENT '域名链接',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态（1：正常，2：急需续费，3：急需赎回，4：正在转出，5：域名持有者信息修改中，6：未实名认证，7：审核失败，重新实名认证，8：审核中）',
  `register_date` datetime DEFAULT NULL COMMENT '注册日期',
  `expire_date` datetime DEFAULT NULL COMMENT '到期日期',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8 COMMENT='域名表';

-- ----------------------------
-- Table structure for key_pair
-- ----------------------------
DROP TABLE IF EXISTS `key_pair`;
CREATE TABLE `key_pair` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` bigint(20) NOT NULL COMMENT '-1：代表所有租户默认 ,>0 代表租户Id',
  `area` varchar(20) DEFAULT NULL COMMENT 'tran:传输，db:数据库数据，default:默认',
  `key_pair` blob COMMENT '密钥对值',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否可删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='密钥对表';

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_yd_groups
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_yd_groups`;
CREATE TABLE `qrtz_yd_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL COMMENT '编码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，0：无效，1：有效',
  `type` tinyint(2) DEFAULT '1' COMMENT '状态，0：触发器组，1：任务组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ui_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='任务组或触发器组';

-- ----------------------------
-- Table structure for qrtz_yd_jobs
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_yd_jobs`;
CREATE TABLE `qrtz_yd_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL COMMENT '编码',
  `name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group_id` int(11) NOT NULL COMMENT '工作组主键',
  `trigger_group_id` int(11) NOT NULL COMMENT '触发器组主键',
  `job_class` varchar(256) NOT NULL COMMENT '任务类',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，0：无效，1：有效',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ui_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Table structure for qrtz_yd_jobs_props
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_yd_jobs_props`;
CREATE TABLE `qrtz_yd_jobs_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jobs_id` int(11) NOT NULL COMMENT '任务主键',
  `prop_name` varchar(64) NOT NULL COMMENT '属性名',
  `prop_value` varchar(512) NOT NULL COMMENT '属性值',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，0：无效，1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ui_jobs_id_props_name` (`jobs_id`,`prop_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务属性';

-- ----------------------------
-- Table structure for qrtz_yd_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_yd_triggers`;
CREATE TABLE `qrtz_yd_triggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL COMMENT '编码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `cron_expression` varchar(64) DEFAULT NULL COMMENT '正则表达式',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeat_number` int(11) DEFAULT '-1' COMMENT '重复次数',
  `repeat_interval` int(11) DEFAULT '-1' COMMENT '重复间隔',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，0：无效，1：有效',
  `trigger_group_id` int(11) NOT NULL COMMENT '触发器组主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ui_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='触发器';

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `code` varchar(64) DEFAULT NULL COMMENT 'code值，比如100000011000000000',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `url` varchar(256) DEFAULT NULL COMMENT '链接',
  `is_share` tinyint(2) DEFAULT '1' COMMENT '是否共用，0：否，1：是',
  `is_menu` tinyint(2) DEFAULT '1' COMMENT '是否菜单，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `is_deplay` tinyint(2) DEFAULT '1' COMMENT '是否显示',
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
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_share` tinyint(2) DEFAULT '0' COMMENT '是否共用，0：否，1：是',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否可删除，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `is_system` tinyint(2) DEFAULT '0' COMMENT '是否系统预置，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_parent_id` (`parent_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

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
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_resource_id` (`resource_id`),
  KEY `i_role_id` (`role_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1751 DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Table structure for role_system
-- ----------------------------
DROP TABLE IF EXISTS `role_system`;
CREATE TABLE `role_system` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_role_id` (`role_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色系统表';

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
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='短信验证码';

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统表';

-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `name` varchar(64) DEFAULT NULL COMMENT '名字',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型',
  `address` varchar(512) DEFAULT NULL COMMENT '地址',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_name` (`name`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='租户表';

-- ----------------------------
-- Table structure for tenant_init_department
-- ----------------------------
DROP TABLE IF EXISTS `tenant_init_department`;
CREATE TABLE `tenant_init_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `tenant_type` tinyint(2) DEFAULT NULL COMMENT '租户类型',
  `department_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否可删除，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_tenant_type` (`tenant_type`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户初始化部门表';

-- ----------------------------
-- Table structure for tenant_init_role
-- ----------------------------
DROP TABLE IF EXISTS `tenant_init_role`;
CREATE TABLE `tenant_init_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `tenant_type` tinyint(2) DEFAULT NULL COMMENT '租户类型',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否可删除，0：否，1：是',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_tenant_type` (`tenant_type`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='租户初始化角色表';

-- ----------------------------
-- Table structure for tenant_resource
-- ----------------------------
DROP TABLE IF EXISTS `tenant_resource`;
CREATE TABLE `tenant_resource` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编码',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源id',
  `is_enabled` tinyint(2) DEFAULT '1' COMMENT '是否启用，0：否，1：是',
  `sequence` int(11) DEFAULT '1' COMMENT '排序，越小越靠前',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `i_tenant_id` (`tenant_id`),
  KEY `i_resource_id` (`resource_id`),
  KEY `i_create_user_id` (`create_user_id`),
  KEY `i_update_user_id` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户资源表';

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account_id` bigint(20) NOT NULL COMMENT '帐号id',
  `app_type` varchar(20) DEFAULT NULL COMMENT 'pc:电脑端，app：手机端',
  `ticket` varchar(526) DEFAULT NULL COMMENT '凭证码',
  `active_time` int(11) DEFAULT NULL COMMENT '存活时间，以秒为单位,-1代表永远不过期',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2022 DEFAULT CHARSET=utf8 COMMENT='登录凭证表';

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(18) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `is_system` tinyint(2) DEFAULT '0' COMMENT '是否系统用户（0：否，1：是）',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_tenant
-- ----------------------------
DROP TABLE IF EXISTS `user_tenant`;
CREATE TABLE `user_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `is_delete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;



ALTER TABLE contract auto_increment=1;
ALTER TABLE data_source auto_increment=1;
ALTER TABLE department auto_increment=1;
ALTER TABLE domain_name auto_increment=1;
ALTER TABLE key_pair auto_increment=1;
ALTER TABLE qrtz_blob_triggers auto_increment=1;
ALTER TABLE qrtz_calendars auto_increment=1;
ALTER TABLE qrtz_cron_triggers auto_increment=1;
ALTER TABLE qrtz_fired_triggers auto_increment=1;
ALTER TABLE qrtz_job_details auto_increment=1;
ALTER TABLE qrtz_locks auto_increment=1;
ALTER TABLE qrtz_paused_trigger_grps auto_increment=1;
ALTER TABLE qrtz_scheduler_state auto_increment=1;
ALTER TABLE qrtz_simple_triggers auto_increment=1;
ALTER TABLE qrtz_simprop_triggers auto_increment=1;
ALTER TABLE qrtz_triggers auto_increment=1;
ALTER TABLE qrtz_yd_groups auto_increment=1;
ALTER TABLE qrtz_yd_jobs auto_increment=1;
ALTER TABLE qrtz_yd_jobs_props auto_increment=1;
ALTER TABLE qrtz_yd_triggers auto_increment=1;
ALTER TABLE resource auto_increment=1;
ALTER TABLE role auto_increment=1;
ALTER TABLE role_resource auto_increment=1;
ALTER TABLE role_system auto_increment=1;
ALTER TABLE system auto_increment=1;
ALTER TABLE tenant auto_increment=1;
ALTER TABLE tenant_init_department auto_increment=1;
ALTER TABLE tenant_init_role auto_increment=1;
ALTER TABLE tenant_resource auto_increment=1;
ALTER TABLE ticket auto_increment=1;
ALTER TABLE user_account auto_increment=1;
ALTER TABLE user_tenant auto_increment=1;
ALTER TABLE sms_captcha auto_increment=1;