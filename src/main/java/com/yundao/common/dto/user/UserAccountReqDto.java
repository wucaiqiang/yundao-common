package com.yundao.common.dto.user;

import com.yundao.core.base.model.BaseModel;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

public class UserAccountReqDto  implements Serializable {
    /**
	 * 手机号码
	 */
	 @ApiModelProperty(value = "手机号码")
    private String mobile;

    /**
	 * 邮箱
	 */
	 @ApiModelProperty(value = "邮箱")
    private String email;

    /**
	 * 用户名
	 */
	 @ApiModelProperty(value = "用户名")
    private String username;

    /**
	 * 密码
	 */
	 @ApiModelProperty(value = "密码")
    private String password;

    private static final long serialVersionUID = 1L;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}