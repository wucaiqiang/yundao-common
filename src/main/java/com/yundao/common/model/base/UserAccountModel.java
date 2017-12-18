package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;

public class UserAccountModel extends BaseModel implements Serializable {
    /**
	 * 手机号码
	 */
    private String mobile;

    /**
	 * 邮箱
	 */
    private String email;

    /**
	 * 用户名
	 */
    private String username;

    /**
	 * 密码
	 */
    private String password;

    /**
	 * 是否修改过密码，1：是，0：否，默认：0
	 */
    private Integer onceEditPwd;

    /**
	 * 输入密码错误次数，默认：0
	 */
    private Integer pwdErrCount;

    /**
	 * 是否系统用户（0：否，1：是）
	 */
    private Integer isSystem;

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

    public Integer getOnceEditPwd() {
        return onceEditPwd;
    }

    public void setOnceEditPwd(Integer onceEditPwd) {
        this.onceEditPwd = onceEditPwd;
    }

    public Integer getPwdErrCount() {
        return pwdErrCount;
    }

    public void setPwdErrCount(Integer pwdErrCount) {
        this.pwdErrCount = pwdErrCount;
    }

    public Integer getIsSystem() {
        return isSystem;
    }

    public void setIsSystem(Integer isSystem) {
        this.isSystem = isSystem;
    }
}