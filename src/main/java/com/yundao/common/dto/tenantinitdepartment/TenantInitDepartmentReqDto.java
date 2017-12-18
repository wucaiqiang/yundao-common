
package com.yundao.common.dto.tenantinitdepartment;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class TenantInitDepartmentReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1079+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    @ApiModelProperty(value = "系统编码")
    private String systemCode;

    @ApiModelProperty(value = "租户类型")
    private Integer tenantType;

    @ApiModelProperty(value = "部门id")
    private Long departmentId;

    @ApiModelProperty(value = "描述")
    private String description;

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

    public String getSystemCode (){
        return systemCode;
    }

    public void setSystemCode (String systemCode){
        this.systemCode = systemCode;
    }

    public Integer getTenantType (){
        return tenantType;
    }

    public void setTenantType (Integer tenantType){
        this.tenantType = tenantType;
    }

    public Long getDepartmentId (){
        return departmentId;
    }

    public void setDepartmentId (Long departmentId){
        this.departmentId = departmentId;
    }

    public String getDescription (){
        return description;
    }

    public void setDescription (String description){
        this.description = description;
    }

    public Integer getSequence (){
        return sequence;
    }

    public void setSequence (Integer sequence){
        this.sequence = sequence;
    }

}
