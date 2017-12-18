
package com.yundao.common.dto.tenant;

import javax.validation.constraints.NotNull;

import com.yundao.common.constant.CodeConstant;

import io.swagger.annotations.ApiModelProperty;

/**
 * 租户相关信息
 * date: 2017年10月11日 下午3:40:05
 * @author:欧阳利
 * @description:
 */
public class TenantInitReqDto{

    @ApiModelProperty(value = "租户名字")
    @NotNull(message = "{" + CodeConstant.CODE_1000046 + "}")
    private String name;

    @ApiModelProperty(value = "租户编码")
    @NotNull(message = "{" + CodeConstant.CODE_1000047 + "}")
    private String code;

    @ApiModelProperty(value = "租户地址")
    @NotNull(message = "{" + CodeConstant.CODE_1000049 + "}")
    private String address;
    
	@ApiModelProperty("系统管理员手机号码")
	@NotNull(message = "{" + CodeConstant.CODE_1000050 + "}")
    private String mobile;
	
//	@ApiModelProperty("系统管理员用户名")
//	@NotNull(message = "{" + CodeConstant.CODE_1000051 + "}")
//  private String username;
	
	@ApiModelProperty("管理员姓名")
	@NotNull(message = "{" + CodeConstant.CODE_1000048 + "}")
    private String realname;
	
	@ApiModelProperty("系统管理员密码(明文)")
	@NotNull(message = "{" + CodeConstant.CODE_1000052 + "}")
    private String password;
	
	@ApiModelProperty("数据库连接url(明文)")
	@NotNull(message = "{" + CodeConstant.CODE_1000053 + "}")
	private String dbUrl;
	
	@ApiModelProperty("数据库连接用户名(明文)")
	@NotNull(message = "{" + CodeConstant.CODE_1000054 + "}")
	private String dbUsername;
	
	@ApiModelProperty("数据库连接密码(明文)")
	@NotNull(message = "{" + CodeConstant.CODE_1000055 + "}")
	private String dbPassword;

	@ApiModelProperty("租户域名集合")
	@NotNull(message = "{" + CodeConstant.CODE_1000045 + "}")
	private String tenantDomainDtos;

	@ApiModelProperty("sms访问id")
	//@NotNull(message = "{" + CodeConstant.CODE_1000057 + "}")
	private String smsAccessKeyId;
	@ApiModelProperty("sms访问key")
	//@NotNull(message = "{" + CodeConstant.CODE_1000058 + "}")
	private String smsAccesskeySecret;
	@ApiModelProperty("sms访问签名")
	//@NotNull(message = "{" + CodeConstant.CODE_1000059 + "}")
	private String smsSign;
	
	@ApiModelProperty("sms是否使用默认配置(1:使用默认，0：使用自己的sms)")
	@NotNull(message = "{" + CodeConstant.CODE_1000061 + "}")
	private Integer smsIsDefault;
	
	public Integer getSmsIsDefault() {
	
		return smsIsDefault;
	}

	public void setSmsIsDefault(Integer smsIsDefault) {
	
		this.smsIsDefault = smsIsDefault;
	}

	public String getSmsAccessKeyId() {
	
		return smsAccessKeyId;
	}

	public void setSmsAccessKeyId(String smsAccessKeyId) {
	
		this.smsAccessKeyId = smsAccessKeyId;
	}

	public String getSmsAccesskeySecret() {
	
		return smsAccesskeySecret;
	}

	public void setSmsAccesskeySecret(String smsAccesskeySecret) {
	
		this.smsAccesskeySecret = smsAccesskeySecret;
	}

	public String getSmsSign() {
	
		return smsSign;
	}

	public void setSmsSign(String smsSign) {
	
		this.smsSign = smsSign;
	}

	public String getRealname() {
	
		return realname;
	}

	public void setRealname(String realname) {
	
		this.realname = realname;
	}

	public String getTenantDomainDtos() {
	
		return tenantDomainDtos;
	}

	public void setTenantDomainDtos(String tenantDomainDtos) {
	
		this.tenantDomainDtos = tenantDomainDtos;
	}

	public String getDbUrl() {
	
		return dbUrl;
	}

	public void setDbUrl(String dbUrl) {
	
		this.dbUrl = dbUrl;
	}

	public String getDbUsername() {
	
		return dbUsername;
	}

	public void setDbUsername(String dbUsername) {
	
		this.dbUsername = dbUsername;
	}

	public String getDbPassword() {
	
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
	
		this.dbPassword = dbPassword;
	}

	public String getMobile() {
	
		return mobile;
	}
	public void setMobile(String mobile) {
	
		this.mobile = mobile;
	}

	public String getPassword() {
	
		return password;
	}
	public void setPassword(String password) {
	
		this.password = password;
	}
	public String getName() {
	
		return name;
	}

	public void setName(String name) {
	
		this.name = name;
	}

	public String getCode() {
	
		return code;
	}

	public void setCode(String code) {
	
		this.code = code;
	}

	public String getAddress() {
	
		return address;
	}

	public void setAddress(String address) {
	
		this.address = address;
	}

    

 

}
