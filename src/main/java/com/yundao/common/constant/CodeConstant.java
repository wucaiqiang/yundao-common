package com.yundao.common.constant;

/**
 * Created by gjl on 2017/6/23.
 */
public interface CodeConstant {
	/**
	 * 不能移动到自己的子部门
	 */
	int CODE_1000000 = 1000000;
	/**
	 * 部门名称必须在{min}到{max}之间
	 */
	int CODE_1000001 = 1000001;
	/**
	 * 移动部门或源部门有误
	 */
	int CODE_1000002 = 1000002;
	/**
	 * 非法系统编码
	 */
	int CODE_1000003 = 1000003;
	/**
	 * 域名不存在
	 */
	int CODE_1000004 = 1000004;
	/**
	 * 租户的数据源已经存在
	 */
	int CODE_1000005 = 1000005;
	/**
	 * 编辑数据有误
	 */
	int CODE_1000006 = 1000006;
	/**
	 * 租户不存在
	 */
	int CODE_1000007 = 1000007;
	/**
	 * 租户ID不能为空
	 */
	int CODE_1000008 = 1000008;
	/**
	 * 密钥对作用范围不能为空
	 */
	int CODE_1000009 = 1000009;
	/**
	 * 该租户作用范围的密钥对已经存在
	 */
	int CODE_1000010 = 1000010;
	/**
	 * 凭证不存在或已过期
	 */
	int CODE_1000011 = 1000011;
	/**
	 * 凭证已过期
	 */
	int CODE_1000012 = 1000012;
	/**
	 * 帐号ID不能为空
	 */
	int CODE_1000013 = 1000013;
	/**
	 * 应用类型不能为空（pc或app）
	 */
	int CODE_1000014 = 1000014;
	/**
	 * 用户名不能为空
	 */
	int CODE_1000015 = 1000015;
	/**
	 * 密码不能为空
	 */
	int CODE_1000016 = 1000016;
	/**
	 * 手机号码不能为空
	 */
	int CODE_1000017 = 1000017;
	/**
	 * 手机号码已注册
	 */
	int CODE_1000018 = 1000018;
	/**
	 * 帐号不存在
	 */
	int CODE_1000019 = 1000019;
	/**
	 * 密码不正确
	 */
	int CODE_1000020 = 1000020;

	/**
	 * 帐号已存在
	 */
	int CODE_1000021 = 1000021;
	/**
	 * 原密码错误
	 */
	int CODE_1000022 = 1000022;

	/**
	 * 该用户不已经存在当前租户
	 */
	int CODE_1000023 = 1000023;
	/**
	 * 验证码类型不能为空
	 */
	int CODE_1000024 = 1000024;
	/**
	 * 验证码有误
	 */
	int CODE_1000025 = 1000025;
	/**
	 * 验证码已失效
	 */
	int CODE_1000026 = 1000026;
	/**
	 * 验证码类型有误
	 */
	int CODE_1000027 = 1000027;
	/**
	 * 验证码不能为空
	 */
	int CODE_1000028 = 1000028;
	/**
	 * 获取短信模板code失败
	 */
	int CODE_1000029 = 1000029;
	/**
	 * 手机号长度必须在{min}到{max}之间
	 */
	int CODE_1000030 = 1000030;
	/**
	 * 密码有误
	 */
	int CODE_1000031 = 1000031;
	/**
	 * 该帐号找不到任何归属的租户信息
	 */
	int CODE_1000032 = 1000032;
	/**
	 * 该帐号所属于租户已被禁用
	 */
	int CODE_1000033 = 1000033;
	/**
	 * 获取验证码失败
	 */
	int CODE_1000034 = 1000034;
	/**
	 * 新密码不能为空
	 */
	int CODE_1000035 = 1000035;
	/**
	 * 原密码不能为空
	 */
	int CODE_1000036 = 1000036;

	/**
	 * 您的连续5次密码错误, 请找回密码！
	 */
	int CODE_1000037 = 1000037;

	/**
	 * 新密码不可与当前密码一致
	 */
	int CODE_1000038 = 1000038;
	/**
	 * 密码不能为空
	 */
	int CODE_1000039 = 1000039;
	/**
	 * 无效域名
	 */
	int CODE_1000040 = 1000040;

	/**
	 * 租户数据库不存在
	 */
	int CODE_1000041 = 1000041;

	/**
	 * 租户数据库表已经存在, 请清空
	 */
	int CODE_1000042 = 1000042;

	/**
	 * 租户名称已存在
	 */
	int CODE_1000043 = 1000043;

	/**
	 * 租户域名已经存在
	 */
	int CODE_1000044 = 1000044;

	/**
	 * 租户域名不能为空
	 */
	int CODE_1000045 = 1000045;

	/**
	 * 租户名称不能为空
	 */
	int CODE_1000046 = 1000046;

	/**
	 * 租户编码不能为空
	 */
	int CODE_1000047 = 1000047;

	/**
	 * 真实姓名不能为空
	 */
	int CODE_1000048 = 1000048;

	/**
	 * 租户地址不能为空
	 */
	int CODE_1000049 = 1000049;

	/**
	 * 系统管理员手机号码不能为空
	 */
	int CODE_1000050 = 1000050;

	/**
	 * 系统管理员用户名不能为空
	 */
	int CODE_1000051 = 1000051;

	/**
	 * 系统管理员密码不能为空
	 */
	int CODE_1000052 = 1000052;

	/**
	 * 数据库连接url不能为空
	 */
	int CODE_1000053 = 1000053;

	/**
	 * 数据库连接用户名不能为空
	 */
	int CODE_1000054 = 1000054;

	/**
	 * 数据库连接密码不能为空
	 */
	int CODE_1000055 = 1000055;

	/**
	 * tenant后置服务有问题
	 */
	int CODE_1000056 = 1000056;

	/**
	 * sms访问id不能为空
	 */
	int CODE_1000057 = 1000057;
	/**
	 * sms访问key不能为空
	 */
	int CODE_1000058 = 1000058;
	/**
	 * sms访问签名不能为空
	 */
	int CODE_1000059 = 1000059;

	/**
	 * 工作流服务 服务异常
	 */
	int CODE_1000060 = 1000060;

	/**
	 * 是否使用默认sms配置不能为空
	 */
	int CODE_1000061 = 1000061;

	/**
	 * smsIsDefault只能为1或者0
	 */
	int CODE_1000062 = 1000062;

	/**
	 * 账号授权已到期，请联系管理员
	 */
	int CODE_1000063 = 1000063;
	 /**
     * 视频类型
     */
    int CODE_1000064 = 1000064;
	/**
	 * 文件ID不能为空
	 */
	int CODE_1000065 = 1000063;
	/**
	 * 视频类型
	 */
	int CODE_1000066 = 1000066;
	/**
	 * 帐号不能为空
	 */
	int CODE_1000067 = 1000067;
}
