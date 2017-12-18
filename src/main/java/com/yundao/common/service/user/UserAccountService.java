package com.yundao.common.service.user;

import com.yundao.common.dto.login.UserPasswordCheckDto;
import com.yundao.common.dto.user.TenantAdminAddReqDto;
import com.yundao.common.dto.user.UserAccountDetailDto;
import com.yundao.common.dto.user.UserCheckPwdReqDto;
import com.yundao.common.model.base.UserAccountModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

public interface UserAccountService {

    public Result<Long> add(UserAccountModel accountModel) throws Exception;

    public Result<UserAccountDetailDto> checkByMobile(String mobile) throws BaseException;

    public Result<Boolean> doCheckUserPassword(UserPasswordCheckDto dto) throws Exception;

    public Result<Boolean> checkAccount(String userName, Long tenantId) throws Exception;
    public Result<UserAccountModel> selectByAccount(String userName) throws Exception;

    public Result<UserAccountModel> selectByMobileOrUserName(String mobileOrUserName) throws BaseException;

    public Result<UserAccountModel> selectByMobile(String mobile) throws BaseException;

    public Result<UserAccountModel> selectByUserName(String userName) throws Exception;

    public Result<UserAccountModel> selectById(Long id) throws Exception;

    /**
     * 添加租户系统管理员
     * addTenantSystemUser:
     *
     * @return
     * @throws Exception
     * @author: 欧阳利
     * @description:
     */
    public Result<Long> addTenantSystemAdmin(TenantAdminAddReqDto reqDto) throws Exception;

    /**
     * 校验密码
     */
    Result<Boolean> checkPwd(UserCheckPwdReqDto dto) throws BaseException;
}
