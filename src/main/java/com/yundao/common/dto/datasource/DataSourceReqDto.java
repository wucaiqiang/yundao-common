
package com.yundao.common.dto.datasource;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class DataSourceReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1003+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    @ApiModelProperty(value = "系统编码")
    private String systemCode;

    @ApiModelProperty(value = "名字")
    private String name;

    @ApiModelProperty(value = "驱动类名")
    private String driverClassName;

    @ApiModelProperty(value = "数据库链接（加密）")
    private String url;

    @ApiModelProperty(value = "用户名（加密）")
    private String username;

    @ApiModelProperty(value = "密码（加密）")
    private String password;


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

    public String getName (){
        return name;
    }

    public void setName (String name){
        this.name = name;
    }

    public String getDriverClassName (){
        return driverClassName;
    }

    public void setDriverClassName (String driverClassName){
        this.driverClassName = driverClassName;
    }

    public String getUrl (){
        return url;
    }

    public void setUrl (String url){
        this.url = url;
    }

    public String getUsername (){
        return username;
    }

    public void setUsername (String username){
        this.username = username;
    }

    public String getPassword (){
        return password;
    }

    public void setPassword (String password){
        this.password = password;
    }

}
