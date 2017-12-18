package com.yundao.common.controller.user;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
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
import com.yundao.common.dto.user.CheckMobileResDto;
import com.yundao.common.dto.user.TenantAdminAddReqDto;
import com.yundao.common.dto.user.UserAccountReqDto;
import com.yundao.common.model.base.UserAccountModel;
import com.yundao.common.service.keypair.RsaService;
import com.yundao.common.service.user.UserAccountService;
import com.yundao.common.service.user.UserService;
import com.yundao.common.service.user.UserTenantService;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.validator.spring.BindingResultHandler;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/tenant/user")
@ResponseBody
@Api("租户用户信息")
public class UserAccountController {
	
	@Autowired
	UserAccountService userAccountService;
	@Autowired
	RsaService rsa;
	@Autowired
	UserService userService;
	@Autowired
	UserTenantService userTenantService;
	
	
    
    /**
     * 添加租户系统管理员
     * addTenantSystemUser:
     * @author: 欧阳利
     * @return
     * @throws Exception
     * @description:
     */
    @ApiOperation(value = "添加租户系统管理员", notes = "添加租户系统管理员")
    @RequestMapping(value = "/add/system/admin", method = RequestMethod.POST)
    public Result<Long> addTenantSystemAdmin(@ModelAttribute TenantAdminAddReqDto reqDto)throws Exception {
		// 检查手机号码是否存在
		if (reqDto == null || StringUtils.isBlank(reqDto.getMobile())) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}
    	
    	return userAccountService.addTenantSystemAdmin(reqDto);
    }
	
	
	
	/**
	 *  查询手机号码使用情况
	 */
	@ApiOperation(value="查询手机号码使用情况")
	@RequestMapping(value = "/check_mobile_exist", method=RequestMethod.GET)
	public Result<CheckMobileResDto> checkMobile(@RequestParam String mobile,@RequestParam  Long tenantId){
		return userService.checkMobile(mobile, tenantId);
	}
	
    /**
     * 添加用户
     */
	@ApiOperation(value="添加用户")
	@RequestMapping(value = "/add", method=RequestMethod.POST)
	public Result<Long> add(@Validated @ModelAttribute UserAccountReqDto dto, BindingResult bindingResult)throws Exception{
		BindingResultHandler.handleByException(bindingResult);
		UserAccountModel model=new UserAccountModel();
		  BeanUtils.copyProperties(dto,model);
		return userAccountService.add(model);
	}
	
	@ApiOperation(value="加密")
	@RequestMapping(value = "/ttt", method=RequestMethod.POST)
	public Result<String> tttA(@Validated @ModelAttribute UserAccountReqDto dto, BindingResult bindingResult)throws Exception{
		return Result.newSuccessResult(rsa.encryptPassword("123456"));
	}

	/*@ApiOperation(value="修改密码")
	@RequestMapping(value = "/update_user_password", method=RequestMethod.POST)
	public Result<Integer> updateUserPassword(@RequestParam String userName,@RequestParam String oldPassword, @RequestParam String newPassword)throws Exception{
		return userService.updateUserPassword(userName,oldPassword,newPassword);
	}*/

	@ApiOperation(value="修改密码")
	@RequestMapping(value = "/retrieve_password", method=RequestMethod.POST)
	public Result<Integer> retrievePassword(@RequestParam String userName,@RequestParam String newPassword)throws Exception{
		return userService.updateUserPassword(userName,newPassword);
	}
	
	
	@ApiOperation(value="删除用户和租户的关联")
	@RequestMapping(value = "/delete/user_tenant", method=RequestMethod.POST)
	public Result<Integer> deleteUserTenant(@RequestParam Long  userId,@RequestParam Long tenantId)throws BaseException{
		return userTenantService.deleteUserTenant(userId, tenantId);
	}
}
