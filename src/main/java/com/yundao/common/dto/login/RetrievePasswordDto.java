package com.yundao.common.dto.login;

import javax.validation.constraints.NotNull;

import com.yundao.common.constant.CodeConstant;
import com.yundao.core.validator.length.Length;

import io.swagger.annotations.ApiModelProperty;


public class RetrievePasswordDto {
    /**
	 * 手机号码
	 */
    @ApiModelProperty("手机号码")
    @Length(min = 6, max = 11, message = "{" + CodeConstant.CODE_1000030 + "}")
    private String mobile;

    /**
	 * 验证码
	 */
    @ApiModelProperty("验证码")
    @Length(min = 6, max = 6, message = "{" + CodeConstant.CODE_1000025 + "}")
    private String captcha;

    /**
	 * 密码
	 */
    @ApiModelProperty("密码")
    @NotNull(message = "{" + CodeConstant.CODE_1000031 + "}")
    private String password;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}