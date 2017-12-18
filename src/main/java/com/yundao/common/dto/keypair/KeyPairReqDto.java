
package com.yundao.common.dto.keypair;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class KeyPairReqDto{
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1079+ "}", groups = {Update.class})
    private Long id;

    @ApiModelProperty(value = "-1：代表所有租户默认 ,>0 代表租户Id")
    private Long tenantId;

    @ApiModelProperty(value = "tran:传输，db:数据库数据，default:默认")
    private String area;

    @ApiModelProperty(value = "密钥对值")
    private String keyPair;


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

    public String getArea (){
        return area;
    }

    public void setArea (String area){
        this.area = area;
    }

    public String getKeyPair (){
        return keyPair;
    }

    public void setKeyPair (String keyPair){
        this.keyPair = keyPair;
    }

}
