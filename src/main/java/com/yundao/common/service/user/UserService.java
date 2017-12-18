package com.yundao.common.service.user;

import com.yundao.common.dto.login.UserLoginResDto;
import com.yundao.common.dto.user.CheckMobileResDto;
import com.yundao.core.code.Result;

public interface UserService {
	
	/**
	 * 检查手机号码的使用情况
	 * @param mobile
	 * @param tenantId
	 * @return
	 */
	public Result<CheckMobileResDto> checkMobile(String mobile,Long tenantId);
	
	/**
	 * 检查用户和手机号码是否正确
	 * @param userName
	 * @param password
	 * @return
	 */
	public Result<Boolean> checkUserPassword(String userName,String password) throws Exception;
	
	/**
	 * 返回多个
	 * @param userName
	 * @param password
	 * @return
	 */
	public Result<UserLoginResDto> login(String userName,String password);
	
	/**
	 * 添加用户
	 * @param mobile
	 * @param password
	 * @return
	 */
	public Result<Integer> addMobileUser(String mobile,String password,Long tenantId);
	
	
	/**
	 * 添加用户
	 * @param mobile
	 * @param tenantId
	 * @return
	 */
	public Result<Integer> addMobileUser(String mobile,Long tenantId);

	/**
	 * 修改密码
	 * @param userName
	 * @param newPassword
	 * @return
	 */
	Result<Integer> updateUserPassword(String userName, String newPassword) throws Exception;
}
