
package com.yundao.common.dto.login;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * Function: Reason: Date: 2017年7月17日 上午10:08:35
 * 
 * @author gjl
 * @version
 */
public class UserPasswordCheckDto implements Serializable {

	/**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = 1L;
	@ApiModelProperty(value = "用户名")
	private String userName;
	@ApiModelProperty(value = "密码")
	private String password;

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

}
