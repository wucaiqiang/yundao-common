
package com.yundao.common.dto.domainname;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class DomainNameReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1003+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    @ApiModelProperty(value = "系统编码")
    private String systemCode;

    @ApiModelProperty(value = "域名链接")
    private String url;

    @ApiModelProperty(value = "状态（1：正常，2：急需续费，3：急需赎回，4：正在转出，5：域名持有者信息修改中，6：未实名认证，7：审核失败，重新实名认证，8：审核中）")
    private Integer status;

    @ApiModelProperty(value = "注册日期")
    private Date registerDate;

    @ApiModelProperty(value = "到期日期")
    private Date expireDate;


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

    public String getUrl (){
        return url;
    }

    public void setUrl (String url){
        this.url = url;
    }

    public Integer getStatus (){
        return status;
    }

    public void setStatus (Integer status){
        this.status = status;
    }

    public Date getRegisterDate (){
        return registerDate;
    }

    public void setRegisterDate (Date registerDate){
        this.registerDate = registerDate;
    }

    public Date getExpireDate (){
        return expireDate;
    }

    public void setExpireDate (Date expireDate){
        this.expireDate = expireDate;
    }

}
