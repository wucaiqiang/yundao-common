
package com.yundao.common.controller.login;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.login.LoginTenantReqDto;
import com.yundao.common.dto.login.RetrievePasswordDto;
import com.yundao.common.dto.login.UserPasswordCheckDto;
import com.yundao.common.dto.user.UserAccountDetailDto;
import com.yundao.common.dto.user.UserCheckPwdReqDto;
import com.yundao.common.enums.smscaptcha.SmsCaptchaEnum;
import com.yundao.common.model.base.UserAccountModel;
import com.yundao.common.service.smscaptcha.SmsCaptchaService;
import com.yundao.common.service.user.UserAccountService;
import com.yundao.core.code.Result;
import com.yundao.core.dto.login.UserLoginResDto;
import com.yundao.core.dto.login.UserUpdatePasswordResDto;
import com.yundao.core.exception.BaseException;
import com.yundao.core.service.login.AbstractLoginService;
import com.yundao.core.validator.spring.BindingResultHandler;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * Function: Reason: Date: 2017年7月17日 上午10:03:10
 *
 * @author wucq
 */
@RestController
@ResponseBody
@Api("登录相关")
public class LoginController {

    @Autowired
    private AbstractLoginService LoginService;

    @Autowired
    private SmsCaptchaService smsCaptchaService;

    @Autowired
    private UserAccountService userAccountService;

    /**
     * 登录
     *
     * @return
     */
    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    @ApiOperation(value = "登录", notes = "登录")
    public Result<UserLoginResDto> login(@ModelAttribute LoginTenantReqDto userLoginReqDto) throws Exception {
        return LoginService.doLogin(userLoginReqDto, userLoginReqDto.getTenantId());
    }

    /**
     * 退出
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/user/logout", method = RequestMethod.POST)
    @ApiOperation(value = "退出", notes = "退出")
    public Result<Boolean> logout() throws Exception {
        return LoginService.doLoginOut();
    }

    @RequestMapping(value = "/user/check_password", method = RequestMethod.POST)
    @ApiOperation(value = "修改登录用户的密码", notes = "修改登陆用户的密码")
    public Result<Boolean> checkUserPassword(@ModelAttribute UserPasswordCheckDto reqDto) throws Exception {
        // 获取当前用户的手机号
        if (StringUtils.isBlank(reqDto.getUserName())) {
            throw new BaseException(CodeConstant.CODE_1000015);
        }
        if (StringUtils.isBlank(reqDto.getPassword())) {
            throw new BaseException(CodeConstant.CODE_1000039);
        }
        return userAccountService.doCheckUserPassword(reqDto);
    }

    @RequestMapping(value = "/user/update_password", method = RequestMethod.POST)
    @ApiOperation(value = "修改登录用户的密码", notes = "修改登陆用户的密码")
    public Result<Integer> updateUserPassword(@ModelAttribute UserUpdatePasswordResDto reqDto) throws Exception {
        // 获取当前用户的手机号
        if (StringUtils.isBlank(reqDto.getUserName())) {
            throw new BaseException(CodeConstant.CODE_1000015);
        }
        if (StringUtils.isBlank(reqDto.getNewPassword())) {
            throw new BaseException(CodeConstant.CODE_1000035);
        }
        if (StringUtils.isBlank(reqDto.getOldPassword())) {
            throw new BaseException(CodeConstant.CODE_1000036);
        }
        return LoginService.updatePwdByUser(reqDto);
    }

    /**
     * 校验手机号码是否存在
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/user/check_mobile_exist", method = RequestMethod.POST)
    @ApiOperation(value = "检查手机号码是否存在", notes = "检查手机号码是否存在")
    public Result<UserAccountDetailDto> checkMobile(@RequestParam String mobile) throws Exception {
        Result<UserAccountDetailDto> result = userAccountService.checkByMobile(mobile);
        return result;
    }

    /**
     * 查询手机号码使用情况
     */
    @ApiOperation(value = "检查登录帐号")
    @RequestMapping(value = "/user/check_account", method = RequestMethod.GET)
    public Result<Boolean> checkAccount(@RequestParam String userName, @RequestParam Long tenantId) throws Exception {
        return userAccountService.checkAccount(userName, tenantId);
    }
    /**
     * 查询手机号码使用情况
     */
    @ApiOperation(value = "检查登录帐号")
    @RequestMapping(value = "/user/get_by_account", method = RequestMethod.GET)
    public Result<UserAccountModel> getByAccount(@RequestParam String account) throws Exception {
        return userAccountService.selectByAccount(account);
    }
    @RequestMapping(value = "/user/send_retrieve_captcha", method = RequestMethod.POST)
    @ApiOperation(value = "发送找回密码验证码", notes = "发送找回密码验证码")
    public Result<Boolean> sendRetrieveCaptcha(@RequestParam String mobile) throws Exception {
        return smsCaptchaService.doSend(SmsCaptchaEnum.RETRIEVE.getType(), mobile);
    }

    @RequestMapping(value = "/user/retrieve_password", method = RequestMethod.POST)
    @ApiOperation(value = "找回密码", notes = "找回密码")
    public Result<Boolean> retrievePassword(@ModelAttribute @Validated RetrievePasswordDto passwordDto,
                                            BindingResult bindingResult) throws Exception {
        BindingResultHandler.handleByException(bindingResult);
        return smsCaptchaService.processRetrievePassword(SmsCaptchaEnum.RETRIEVE.getType(), passwordDto);
    }

    @ApiOperation(value = "校验密码")
    @RequestMapping(value = "/user/check_pwd", method = RequestMethod.GET)
    public Result<Boolean> checkPwd(@Validated @ModelAttribute UserCheckPwdReqDto dto, BindingResult bindingResult) throws
            BaseException {
        BindingResultHandler.handleByException(bindingResult);
        return userAccountService.checkPwd(dto);
    }
}
