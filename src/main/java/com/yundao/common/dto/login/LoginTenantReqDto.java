package com.yundao.common.dto.login;

import com.yundao.core.dto.login.UserLoginReqDto;
import io.swagger.annotations.ApiModelProperty;

/**
 * 登录dto
 *
 * @author jan
 * @create 2017-11-27 14:00
 **/
public class LoginTenantReqDto extends UserLoginReqDto {

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    public Long getTenantId() {
        return tenantId;
    }

    public void setTenantId(Long tenantId) {
        this.tenantId = tenantId;
    }
}
