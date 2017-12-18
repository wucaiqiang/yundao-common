
package com.yundao.common.dto.contract;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class ContractReqDto{
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

    @ApiModelProperty(value = "流水号")
    private String serialNumber;

    @ApiModelProperty(value = "开始日期")
    private Date beginDate;

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

    public String getName (){
        return name;
    }

    public void setName (String name){
        this.name = name;
    }

    public String getSerialNumber (){
        return serialNumber;
    }

    public void setSerialNumber (String serialNumber){
        this.serialNumber = serialNumber;
    }

    public Date getBeginDate (){
        return beginDate;
    }

    public void setBeginDate (Date beginDate){
        this.beginDate = beginDate;
    }

    public Date getExpireDate (){
        return expireDate;
    }

    public void setExpireDate (Date expireDate){
        this.expireDate = expireDate;
    }

}
