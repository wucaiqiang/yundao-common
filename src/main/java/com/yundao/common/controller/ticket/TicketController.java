package com.yundao.common.controller.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yundao.common.model.base.UserAccountModel;
import com.yundao.common.service.ticket.TicketService;
import com.yundao.core.code.Result;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/ticket/")
@ResponseBody
@Api("登录凭证表")
public class TicketController{

	@Autowired
    private TicketService ticketService;

    @RequestMapping(value = "validate", method=RequestMethod.POST)
    @ApiOperation(value="校验ticket是否有效")
    public Result<Boolean> doValidate(@RequestParam String ticket) throws Exception{
        return ticketService.doValidate(ticket);
    }
    
    @RequestMapping(value = "get_user_account", method=RequestMethod.POST)
    @ApiOperation(value="根据ticket获取用户信息")
    public Result<UserAccountModel> getUserAccount(@RequestParam String ticket) throws Exception{
        return ticketService.selectUserAccountByTicket(ticket);
    }
    
    @RequestMapping(value = "refresh", method=RequestMethod.POST)
    @ApiOperation(value="校验ticket是否有效")
    public Result<String> refresh(@RequestParam String ticket) throws Exception{
        return ticketService.doRefresh(ticket);
    }
}
