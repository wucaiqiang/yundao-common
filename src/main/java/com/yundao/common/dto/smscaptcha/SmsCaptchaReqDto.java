
package com.yundao.common.dto.smscaptcha;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class SmsCaptchaReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "注册：register,找回密码：retrieve")
    private String type;

    @ApiModelProperty(value = "手机号码")
    private String mobile;


    public String getType() {
	
		return type;
	}

	public void setType(String type) {
	
		this.type = type;
	}

	public String getMobile (){
        return mobile;
    }

    public void setMobile (String mobile){
        this.mobile = mobile;
    }

}
