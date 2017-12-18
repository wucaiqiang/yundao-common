
package com.yundao.common.dto.roleresource;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class RoleResourceReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1079+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    @ApiModelProperty(value = "资源id")
    private Long resourceId;

    @ApiModelProperty(value = "角色id")
    private Long roleId;

    @ApiModelProperty(value = "排序，越小越靠前")
    private Integer sequence;


    public Long getId (){
        return id;
    }

    public void setId (Long id){
        this.id = id;
    }

    public Long getTenantId (){
        return tenantId;
    }

    public void setTenantId (Long tenantId){
        this.tenantId = tenantId;
    }

    public Long getResourceId (){
        return resourceId;
    }

    public void setResourceId (Long resourceId){
        this.resourceId = resourceId;
    }

    public Long getRoleId (){
        return roleId;
    }

    public void setRoleId (Long roleId){
        this.roleId = roleId;
    }

    public Integer getSequence (){
        return sequence;
    }

    public void setSequence (Integer sequence){
        this.sequence = sequence;
    }

}
