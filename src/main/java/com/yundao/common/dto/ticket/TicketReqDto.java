
package com.yundao.common.dto.ticket;

import java.util.Date;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class TicketReqDto{
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "帐号id")
    private Long accountId;

    @ApiModelProperty(value = "pc:电脑端，app：手机端")
    private String appType;


    public Long getAccountId (){
        return accountId;
    }

    public void setAccountId (Long accountId){
        this.accountId = accountId;
    }

    public String getAppType (){
        return appType;
    }

    public void setAppType (String appType){
        this.appType = appType;
    }

}
