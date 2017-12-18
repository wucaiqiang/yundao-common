
package com.yundao.common.service.login.impl;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.mapper.base.ContractModelMapper;
import com.yundao.common.mapper.base.TicketModelMapper;
import com.yundao.common.mapper.base.UserAccountModelMapper;
import com.yundao.common.model.base.ContractModel;
import com.yundao.common.model.base.ContractModelExample;
import com.yundao.common.model.base.TicketModelExample;
import com.yundao.common.model.base.TicketModelExample.Criteria;
import com.yundao.common.model.base.UserAccountModelExample;
import com.yundao.common.service.keypair.RsaService;
import com.yundao.common.util.DateUtil;
import com.yundao.core.code.Result;
import com.yundao.core.code.config.CoreCode;
import com.yundao.core.dto.login.TicketModel;
import com.yundao.core.dto.login.UserAccountModel;
import com.yundao.core.dto.login.UserLoginReqDto;
import com.yundao.core.dto.login.UserLoginResDto;
import com.yundao.core.enums.AppTypeEnum;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.service.login.AbstractLoginService;
import com.yundao.core.threadlocal.ThreadLocalContextHolder;
import com.yundao.core.threadlocal.filter.RequestCommonParams;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.ConfigUtils;
import com.yundao.core.utils.ThreadUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * Function: Reason: Date: 2017年9月14日 下午8:01:20
 *
 * @author wucq
 */
@Service
public class LoginServiceImpl extends AbstractLoginService {

    private static Log log = LogFactory.getLog(LoginServiceImpl.class);

    @Autowired
    UserAccountModelMapper userAccountModelMapper;
    @Autowired
    private TicketModelMapper ticketModelMapper;

    @Autowired
    private ContractModelMapper contractModelMapper;

    @Autowired
    private RsaService rsaService;

    public Result<UserLoginResDto> doLogin(UserLoginReqDto loginReqDto, Object object) throws Exception {
        // 检查密码是否连续5次错误
        com.yundao.common.model.base.UserAccountModel userAccountModel = null;
        if (!BooleanUtils.isBlank(loginReqDto.getUserName())) {
            userAccountModel = selectUserByMobileOrUsername(loginReqDto.getUserName());
            if (userAccountModel != null && userAccountModel.getPwdErrCount() != null && userAccountModel.getPwdErrCount() >= 5) {
                return Result.newFailureResult(CodeConstant.CODE_1000037);
            }
        }

        //判断租户合同是否过期
        this.checkIsExpire(object);
        Result<UserLoginResDto> result = null;
        try {
            result = super.doLogin(loginReqDto, object);
        } catch (BaseException e) {
            // 重置错误次数
            updateUserPwdCountByMobileOrUsername(userAccountModel, e);
            throw e;
        }
        // 重置错误次数
        updateUserPwdCountByMobileOrUsername(userAccountModel, result);
        return result;
    }

    private void checkIsExpire(Object tenantIdObj) throws BaseException {
        if (null == tenantIdObj) {
            log.info("入参租户id为空");
            return;
        }
        ContractModelExample example = new ContractModelExample();
        example.createCriteria().andTenantIdEqualTo((Long) tenantIdObj);
        ContractModel contract = contractModelMapper.selectOne(example);
        boolean expire = DateUtil.isExpire(contract.getExpireDate());
        if (expire) {
            throw new BaseException(CodeConstant.CODE_1000063);
        }
    }


    protected com.yundao.common.model.base.UserAccountModel selectUserByMobileOrUsername(String userName) throws Exception {
        // 查手机
        UserAccountModelExample userAccountExample = new UserAccountModelExample();
        userAccountExample.createCriteria().andMobileEqualTo(userName);
        com.yundao.common.model.base.UserAccountModel userAccount = userAccountModelMapper
                .selectOne(userAccountExample);
        // 为空查用户名
        if (userAccount == null) {
            userAccountExample = new UserAccountModelExample();
            userAccountExample.createCriteria().andUsernameEqualTo(userName);
            userAccount = userAccountModelMapper.selectOne(userAccountExample);
        }
        if (userAccount == null) {
            return null;
        }
        return userAccount;
    }

    /**
     * 记录成功和失败的次数
     * updateUserPwdCountByMobileOrUsername:
     *
     * @throws Exception
     * @author: 欧阳利
     * @description:
     */
    protected void updateUserPwdCountByMobileOrUsername(com.yundao.common.model.base.UserAccountModel userAccountModel, BaseException e) throws Exception {
        if (userAccountModel == null) {
            return;
        }

        if (CoreCode.CORE_1250002 != e.getCode()) {
            return;
        }
        if (userAccountModel.getPwdErrCount() == null) {
            userAccountModel.setPwdErrCount(0);
        }
        // 异步调用链接
        ThreadUtils.execute(() -> {
            com.yundao.common.model.base.UserAccountModel record = new com.yundao.common.model.base.UserAccountModel();
            record.setId(userAccountModel.getId());
            record.setPwdErrCount(userAccountModel.getPwdErrCount() + 1);
            record.setUpdateDate(new Date());
            record.setUpdateUserId(userAccountModel.getId());
            userAccountModelMapper.updateByPrimaryKeySelective(record);
        });


    }


    /**
     * 记录成功和失败的次数
     * updateUserPwdCountByMobileOrUsername:
     *
     * @param result
     * @throws Exception
     * @author: 欧阳利
     * @description:
     */
    protected void updateUserPwdCountByMobileOrUsername(com.yundao.common.model.base.UserAccountModel userAccountModel, Result<UserLoginResDto> result) throws Exception {
        if (userAccountModel == null) {
            return;
        }
        if (userAccountModel.getPwdErrCount() == null) {
            userAccountModel.setPwdErrCount(0);
        }
        if (result.getSuccess()) {
            if (userAccountModel.getPwdErrCount().equals(0)) {
                return;
            } else {
                com.yundao.common.model.base.UserAccountModel record = new com.yundao.common.model.base.UserAccountModel();
                record.setId(userAccountModel.getId());
                record.setPwdErrCount(0);
                record.setUpdateDate(new Date());
                record.setUpdateUserId(userAccountModel.getId());
                userAccountModelMapper.updateByPrimaryKeySelective(record);
                return;
            }
        }

        if (CoreCode.CORE_1250002 != result.getCode()) {
            return;
        }

        com.yundao.common.model.base.UserAccountModel record = new com.yundao.common.model.base.UserAccountModel();
        record.setId(userAccountModel.getId());
        record.setPwdErrCount(userAccountModel.getPwdErrCount() + 1);
        record.setUpdateDate(new Date());
        record.setUpdateUserId(userAccountModel.getId());
        userAccountModelMapper.updateByPrimaryKeySelective(record);

    }


    @Override
    protected UserAccountModel selectByMobileOrUsernmae(String userName) throws Exception {
        // 查手机
        UserAccountModelExample userAccountExample = new UserAccountModelExample();
        userAccountExample.createCriteria().andMobileEqualTo(userName);
        com.yundao.common.model.base.UserAccountModel userAccount = userAccountModelMapper
                .selectOne(userAccountExample);
        // 为空查用户名
        if (userAccount == null) {
            userAccountExample = new UserAccountModelExample();
            userAccountExample.createCriteria().andUsernameEqualTo(userName);
            userAccount = userAccountModelMapper.selectOne(userAccountExample);
        }
        if (userAccount == null) {
            return null;
        }
        UserAccountModel userAccountModel = new UserAccountModel();
        BeanUtils.copyProperties(userAccount, userAccountModel);
        return userAccountModel;

    }

    @Override
    protected Boolean isExist(String userName, String oldPassword) throws Exception {

        UserAccountModelExample example = new UserAccountModelExample();
        example.createCriteria().andMobileEqualTo(userName).andPasswordEqualTo(oldPassword);
        com.yundao.common.model.base.UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
        if (userAccount != null) {
            return true;
        }
        example = new UserAccountModelExample();
        example.createCriteria().andUsernameEqualTo(userName).andPasswordEqualTo(oldPassword);
        userAccount = userAccountModelMapper.selectOne(example);
        if (userAccount != null) {
            return true;
        }
        return false;
    }

    @Override
    protected Integer updateUserPassword(String userName, String newPassword) throws Exception {

        UserAccountModelExample example = new UserAccountModelExample();
        example.createCriteria().andMobileEqualTo(userName);
        com.yundao.common.model.base.UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
        if (userAccount == null) {
            example = new UserAccountModelExample();
            example.createCriteria().andUsernameEqualTo(userName);
            userAccount = userAccountModelMapper.selectOne(example);
        }
        if (userAccount == null) {
            throw new BaseException(CodeConstant.CODE_1000019);
        }
        if (newPassword.equals(userAccount.getPassword()))
            throw new BaseException(CodeConstant.CODE_1000038);

        userAccount.setPassword(newPassword);
        userAccount.setUpdateDate(new Date());
        userAccount.setOnceEditPwd(NumberEnum.ONE.getValue());
        userAccount.setUpdateUserId(super.getHeaderUserId());
        int count = userAccountModelMapper.updateByPrimaryKeySelective(userAccount);
        return count;

    }

    @Override
    protected String processEncryptDBPassword(String password) throws Exception {

        return rsaService.processEncryptDBPassword(password);

    }

    @Override
    protected String processDecryptTranPassword(String password) throws Exception {

        return rsaService.processDecryptTranPassword(password);

    }

    @Override
    protected TicketModel insertTicket(Long userId, Object object, String ticket) throws Exception {
        RequestCommonParams requestParams = ThreadLocalContextHolder.getThreadLocalContext().getRequestCommonParams();
        if (StringUtils.isBlank(requestParams.getAppType())) {
            throw new BaseException(CodeConstant.CODE_1000014);
        }
        com.yundao.common.model.base.TicketModel ticketModel = new com.yundao.common.model.base.TicketModel();
        ticketModel.setAccountId(userId);
        ticketModel.setCreateDate(new Date());
        ticketModel.setCreateUserId(userId);
        ticketModel.setTicket(ticket);
        ticketModel.setAppType(requestParams.getAppType());
        if (AppTypeEnum.B_APP.getType().equals(requestParams.getAppType())) {
            ticketModel.setActiveTime(Integer.parseInt(ConfigUtils.getValue("app.active.time", "300")));
        } else {
            ticketModel.setActiveTime(Integer.parseInt(ConfigUtils.getValue("pc.active.time", "300")));
        }
        ticketModel.setExpireTime(
                org.apache.commons.lang.time.DateUtils.addSeconds(new Date(), ticketModel.getActiveTime()));
        ticketModelMapper.insertSelective(ticketModel);
        TicketModel ticketDto = new TicketModel();
        BeanUtils.copyProperties(ticketModel, ticketDto);
        return ticketDto;
    }

    @Override
    protected Integer deleteByTicket(Long userId, boolean clearAll) throws Exception {
        TicketModelExample example = new TicketModelExample();
        Criteria criteria = example.createCriteria();
        criteria.andAccountIdEqualTo(userId);
        if (!clearAll) {
            RequestCommonParams requestParams = ThreadLocalContextHolder.getThreadLocalContext().getRequestCommonParams();
            if (StringUtils.isBlank(requestParams.getAppType())) {
                throw new BaseException(CodeConstant.CODE_1000014);
            }
            criteria.andAppTypeEqualTo(requestParams.getAppType());
        }
        int count = ticketModelMapper.deleteByExample(example);
        return count;

    }

    @Override
    protected Map<String, Object> loginAfter(UserLoginResDto dto, Object object) throws Exception {
        return null;
    }

}
