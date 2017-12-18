package com.yundao.common.dto.login;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.yundao.common.constant.CodeConstant;

import io.swagger.annotations.ApiModelProperty;

/**
 * 用户登录请求
 * 
 * @author 欧阳利
 * 2017年6月26日
 */
public class UserLoginReqDto implements Serializable{
	
	 /**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 用户名
	 */
	@ApiModelProperty(value = "用户名")
	@NotNull(message = "{" + CodeConstant.CODE_1000015 + "}")
    private String userName;
    
    /**
     * 用户密码
     */
	@ApiModelProperty(value = "密码")
	@NotNull(message = "{" + CodeConstant.CODE_1000016 + "}")
    private String password;
	
	@ApiModelProperty(value = "租户id")
	private Long tenantId;

	public Long getTenantId() {
	
		return tenantId;
	}

	public void setTenantId(Long tenantId) {
	
		this.tenantId = tenantId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

    
}
