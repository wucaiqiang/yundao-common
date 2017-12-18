package com.yundao.common.dto.user;

import com.yundao.common.constant.CodeConstant;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

/**
 * 校验用户密码dto
 *
 * @author jan
 * @create 2017-11-27 14:36
 **/
public class UserCheckPwdReqDto {

    @ApiModelProperty(value = "用户id")
    @NotNull(message = "{" + CodeConstant.CODE_1000013 + "}")
    private Long id;

    @ApiModelProperty(value = "密码")
    @NotEmpty(message = "{" + CodeConstant.CODE_1000016 + "}")
    private String password;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
