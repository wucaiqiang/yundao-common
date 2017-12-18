package com.yundao.common.service.user.impl;

import java.util.Date;
import java.util.List;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.service.keypair.RsaService;
import com.yundao.common.service.login.LoginService;
import com.yundao.core.exception.BaseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.dto.login.UserLoginResDto;
import com.yundao.common.dto.user.CheckMobileResDto;
import com.yundao.common.mapper.base.UserAccountModelMapper;
import com.yundao.common.mapper.base.UserTenantModelMapper;
import com.yundao.common.model.base.UserAccountModel;
import com.yundao.common.model.base.UserAccountModelExample;
import com.yundao.common.model.base.UserAccountModelExample.Criteria;
import com.yundao.common.model.base.UserTenantModel;
import com.yundao.common.model.base.UserTenantModelExample;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.user.UserService;
import com.yundao.common.util.LoginUtils;
import com.yundao.core.code.Result;
import com.yundao.core.utils.BooleanUtils;

@Service
public class UserServiceImpl extends AbstractService implements UserService {

	@Autowired
	UserAccountModelMapper userAccountModelMapper;
	@Autowired
	UserTenantModelMapper userTenantModelMapper;

	@Autowired
	RsaService rsaService;

	public Result<CheckMobileResDto> checkMobile(String mobile, Long tenantId) {
		UserAccountModelExample example = new UserAccountModelExample();
		example.createCriteria().andMobileEqualTo(mobile);
		UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
		CheckMobileResDto dto = new CheckMobileResDto();

		if (userAccount != null) {
			dto.setCommonExist(true);
			dto.setTenantExist(false);
			UserTenantModelExample userTenantExample = new UserTenantModelExample();
			userTenantExample.createCriteria().andUserIdEqualTo(userAccount.getId());
			List<UserTenantModel> list = userTenantModelMapper.selectByExample(userTenantExample);
			if (!BooleanUtils.isEmpty(list)) {
				for (UserTenantModel model : list) {
					if (model.getTenantId().equals(tenantId)) {
						dto.setTenantExist(true);
					}
				}
			}
		} else {
			dto.setCommonExist(false);
			dto.setTenantExist(false);
		}
		return Result.newSuccessResult(dto);
	}

	/**
	 * 检查用户和手机号码是否正确
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public Result<Boolean> checkUserPassword(String userName, String password) throws Exception {
		UserAccountModelExample example = new UserAccountModelExample();
		String orginPassword = rsaService.processDecryptTranPassword(password);// 所传的密码
		String md5Password = rsaService.processEncryptDBPassword(orginPassword);
		Criteria criteria = example.createCriteria();
		criteria.andPasswordEqualTo(md5Password);
		if (LoginUtils.isMobile(userName)) {
			criteria.andMobileEqualTo(userName);
		} else if (LoginUtils.isEmail(userName)) {
			criteria.andEmailEqualTo(userName);
		} else if (LoginUtils.isUserName(userName)) {
			criteria.andUsernameEqualTo(userName);
		}
		UserAccountModel model = userAccountModelMapper.selectOne(example);
		return Result.newSuccessResult(model != null);
	}

	/**
	 * 返回多个
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public Result<UserLoginResDto> login(String userName, String password) {
		return null;
	}

	/**
	 * 添加用户
	 */
	public Result<Integer> addMobileUser(String mobile, String password, Long tenantId) {
		// 检查手机号码是否存在
		UserAccountModelExample example = new UserAccountModelExample();
		Criteria criteria = example.createCriteria();
		criteria.andMobileEqualTo(mobile);
		UserAccountModel model = userAccountModelMapper.selectOne(example);
		if (model != null) {
			return Result.newFailureResult(1, "用户已经存在,不需要输入密码!", null);
		}
		UserAccountModel record = addMobileUser(mobile, password);
		addUserTenant(record, tenantId);
		return Result.newSuccessResult(1);
	}

	private UserAccountModel addMobileUser(String mobile, String password) {
		UserAccountModel record = new UserAccountModel();
		record.setMobile(mobile);
		record.setPassword(password);
		record.setCreateDate(new Date());
		record.setIsDelete(0);
		userAccountModelMapper.insert(record);
		return record;
	}

	private void addUserTenant(UserAccountModel record, Long tenantId) {
		UserTenantModel model = new UserTenantModel();
		model.setTenantId(tenantId);
		model.setUserId(record.getId());
		model.setCreateDate(new Date());
		model.setIsDelete(0);
		userTenantModelMapper.insert(model);
	}

	/**
	 * 添加用户
	 * 
	 * @param mobile
	 * @param tenantId
	 * @return
	 */
	public Result<Integer> addMobileUser(String mobile, Long tenantId) {
		// 检查手机号码是否存在
		UserAccountModelExample example = new UserAccountModelExample();
		Criteria criteria = example.createCriteria();
		criteria.andMobileEqualTo(mobile);
		UserAccountModel model = userAccountModelMapper.selectOne(example);
		if (model == null) {
			return Result.newFailureResult(1, "用户不已经存在,请输入密码!", null);
		}
		addUserTenant(model, tenantId);
		return Result.newSuccessResult(1);
	}

	@Override
	public Result<Integer> updateUserPassword(String userName, String newPassword) throws Exception {
		String orginPassword = rsaService.processDecryptTranPassword(newPassword);// 所传的密码
		String md5Password = rsaService.processEncryptDBPassword(orginPassword);
		UserAccountModelExample queryExample = new UserAccountModelExample();
		queryExample.createCriteria().andUsernameEqualTo(userName).andPasswordEqualTo(md5Password);
		UserAccountModel userAccountModel = userAccountModelMapper.selectOne(queryExample);
		if (userAccountModel == null) {
			queryExample = new UserAccountModelExample();
			queryExample.createCriteria().andMobileEqualTo(userName).andPasswordEqualTo(md5Password);
			userAccountModel = userAccountModelMapper.selectOne(queryExample);
		}
		if (userAccountModel != null) {
			throw new BaseException(CodeConstant.CODE_1000038);
		}

		UserAccountModelExample example = new UserAccountModelExample();
		Criteria criteria = example.createCriteria();
		if (LoginUtils.isMobile(userName)) {
			criteria.andMobileEqualTo(userName);
		} else if (LoginUtils.isUserName(userName)) {
			criteria.andUsernameEqualTo(userName);
		}
		UserAccountModel record = new UserAccountModel();

		record.setPassword(md5Password);
		record.setUpdateDate(new Date());
		int count = userAccountModelMapper.updateByExampleSelective(record, example);
		return Result.newSuccessResult(count);
	}
}
