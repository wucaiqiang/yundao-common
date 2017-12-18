
package com.yundao.common.service.ticket.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.mapper.base.TicketModelMapper;
import com.yundao.common.model.base.TicketModelExample;
import com.yundao.common.model.base.TicketModelExample.Criteria;
import com.yundao.common.service.ticket.TicketService;
import com.yundao.common.service.user.UserAccountService;
import com.yundao.core.code.Result;
import com.yundao.core.dto.login.TicketModel;
import com.yundao.core.dto.login.UserAccountModel;
import com.yundao.core.exception.BaseException;
import com.yundao.core.service.ticket.AbstractTicketService;
import com.yundao.core.threadlocal.ThreadLocalContextHolder;
import com.yundao.core.threadlocal.filter.RequestCommonParams;
/**
 * Function: Reason: Date: 2017年9月15日 下午5:46:20
 * 
 * @author wucq
 * @version
 */
@Service
public class TicketServiceImpl  extends AbstractTicketService implements TicketService{
	@Autowired
	private TicketModelMapper ticketModelMapper;
	@Autowired
	private UserAccountService userAccountService;

	@Override
	protected TicketModel selectByTicket(String ticket) throws Exception {
		TicketModelExample example = new TicketModelExample();
		Criteria criteria = example.createCriteria();
		criteria.andTicketEqualTo(ticket);
		RequestCommonParams requestParams = ThreadLocalContextHolder.getThreadLocalContext().getRequestCommonParams();
		if (StringUtils.isBlank(requestParams.getAppType())) {
			throw new BaseException(CodeConstant.CODE_1000014);
		}
		criteria.andAppTypeEqualTo(requestParams.getAppType());
		
		com.yundao.common.model.base.TicketModel baseMode = ticketModelMapper.selectOne(example);
		if (baseMode == null) {
			throw new BaseException(CodeConstant.CODE_1000011);
		}
		TicketModel ticketModel = new TicketModel();
		BeanUtils.copyProperties(baseMode, ticketModel);
		return ticketModel;

	}

	@Override
	protected int updateByPrimaryKeySelective(TicketModel model) throws Exception{
		com.yundao.common.model.base.TicketModel baseMode = new com.yundao.common.model.base.TicketModel();
		BeanUtils.copyProperties(model, baseMode);
		int count = ticketModelMapper.updateByPrimaryKeySelective(baseMode);
		return count;
	}

	@Override
	protected UserAccountModel selectUserById(Long accountId) throws Exception{
		Result<com.yundao.common.model.base.UserAccountModel> result=userAccountService.selectById(accountId);
		if(result.getResult() ==null){
			return null;
		}
		UserAccountModel userAccountModel = new UserAccountModel();
		BeanUtils.copyProperties(result.getResult(), userAccountModel);
		return userAccountModel;

	}

	@Override
	public Result<com.yundao.common.model.base.UserAccountModel> selectUserAccountByTicket(String ticket)
			throws Exception {
		TicketModelExample example=new TicketModelExample();
		Criteria criteria=example.createCriteria();
		criteria.andTicketEqualTo(ticket);
		RequestCommonParams requestParams=ThreadLocalContextHolder.getThreadLocalContext().getRequestCommonParams();
    	if(StringUtils.isBlank(requestParams.getAppType())){
    		throw new BaseException(CodeConstant.CODE_1000014);
    	}
		criteria.andAppTypeEqualTo(requestParams.getAppType());
		com.yundao.common.model.base.TicketModel baseModel=ticketModelMapper.selectOne(example);
		if(baseModel ==null){
			throw new BaseException(CodeConstant.CODE_1000011);
		}
		com.yundao.common.model.base.UserAccountModel userAccountModel=userAccountService.selectById(baseModel.getAccountId()).getResult();
		
		return Result.newSuccessResult(userAccountModel);
		
	}
	@Override
	public Result<Boolean> doValidate(String ticket) throws Exception {
		return super.doValidate(ticket);
	}
	@Override
	public Result<String> doRefresh(String ticket) throws Exception {
		return super.doRefresh(ticket);
	}

}
