
package com.yundao.common.dto.tenant;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class TenantReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1003+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    @ApiModelProperty(value = "名字")
    private String name;

    @ApiModelProperty(value = "编码")
    private String code;

    @ApiModelProperty(value = "类型")
    private Integer type;

    @ApiModelProperty(value = "地址")
    private String address;

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

    public String getName (){
        return name;
    }

    public void setName (String name){
        this.name = name;
    }

    public String getCode (){
        return code;
    }

    public void setCode (String code){
        this.code = code;
    }

    public Integer getType (){
        return type;
    }

    public void setType (Integer type){
        this.type = type;
    }

    public String getAddress (){
        return address;
    }

    public void setAddress (String address){
        this.address = address;
    }

    public Integer getSequence (){
        return sequence;
    }

    public void setSequence (Integer sequence){
        this.sequence = sequence;
    }

}
