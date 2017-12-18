package com.yundao.common.service.ticket;

import com.yundao.common.model.base.UserAccountModel;
import com.yundao.core.code.Result;

public interface TicketService{
    public Result<Boolean> doValidate(String ticket) throws Exception;
    public Result<String> doRefresh(String ticket) throws Exception;
    public Result<UserAccountModel> selectUserAccountByTicket(String ticket)throws Exception;


}
