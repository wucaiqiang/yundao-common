
package com.yundao.common.dto.resource;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class ResourceReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1003+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    @ApiModelProperty(value = "系统编码")
    private String systemCode;

    @ApiModelProperty(value = "资源code")
    private String code;

    @ApiModelProperty(value = "父id")
    private Long parentId;

    @ApiModelProperty(value = "名字")
    private String name;

    @ApiModelProperty(value = "链接")
    private String url;

    @ApiModelProperty(value = "是否共用，0：否，1：是")
    private Integer isShare;

    @ApiModelProperty(value = "是否菜单，0：否，1：是")
    private Integer isMenu;

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

    public Long getParentId (){
        return parentId;
    }

    public void setParentId (Long parentId){
        this.parentId = parentId;
    }

    public String getName (){
        return name;
    }

    public void setName (String name){
        this.name = name;
    }

    public String getUrl (){
        return url;
    }

    public void setUrl (String url){
        this.url = url;
    }

    public Integer getIsShare (){
        return isShare;
    }

    public void setIsShare (Integer isShare){
        this.isShare = isShare;
    }

    public Integer getIsMenu (){
        return isMenu;
    }

    public void setIsMenu (Integer isMenu){
        this.isMenu = isMenu;
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
