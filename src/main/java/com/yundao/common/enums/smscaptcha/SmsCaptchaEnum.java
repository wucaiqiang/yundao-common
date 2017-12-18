package com.yundao.common.enums.smscaptcha;

/**
 * Created by gjl on 2017/6/26.
 */
public enum SmsCaptchaEnum {
	/**
	 * 注册
	 */
    REGISTER("register"),
    /**
     * 找回密码
     */
    RETRIEVE("retrieve");

    SmsCaptchaEnum(String type) {
        this.type = type;
    }

    private String type;
	public String getType() {
	
		return type;
	}

	public void setType(String type) {
	
		this.type = type;
	}

}
