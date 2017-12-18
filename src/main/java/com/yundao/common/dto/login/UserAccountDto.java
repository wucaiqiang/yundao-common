package com.yundao.common.dto.login;


import com.yundao.core.dto.login.UserAccountModel;

/**
 * @author jan
 * @create 2017-09-19 PM2:50
 **/
public class UserAccountDto extends UserAccountModel {

    /**
     * 是否修改过密码，1：是，0：否，默认：0
     */
    private Integer onceEditPwd;

    public Integer getOnceEditPwd() {
        return onceEditPwd;
    }

    public void setOnceEditPwd(Integer onceEditPwd) {
        this.onceEditPwd = onceEditPwd;
    }
}
