
package com.yundao.common.service.user.impl;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.constant.url.TenantUrlConstant;
import com.yundao.common.dto.login.UserPasswordCheckDto;
import com.yundao.common.dto.user.TenantAdminAddReqDto;
import com.yundao.common.dto.user.UserAccountDetailDto;
import com.yundao.common.dto.user.UserCheckPwdReqDto;
import com.yundao.common.mapper.base.TenantModelMapper;
import com.yundao.common.mapper.base.UserAccountModelMapper;
import com.yundao.common.mapper.base.UserTenantModelMapper;
import com.yundao.common.model.base.*;
import com.yundao.common.model.base.UserTenantModelExample.Criteria;
import com.yundao.common.service.keypair.RsaService;
import com.yundao.common.service.user.UserAccountService;
import com.yundao.common.util.ArgsUtils;
import com.yundao.common.util.TenantHttpUtils;
import com.yundao.core.code.Result;
import com.yundao.core.code.config.CoreCode;
import com.yundao.core.constant.HeaderConstant;
import com.yundao.core.dto.HeaderUser;
import com.yundao.core.exception.BaseException;
import com.yundao.core.json.jackson.type.BaseTypeReference;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.service.AbstractService;
import com.yundao.core.service.login.AbstractLoginService;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.ThreadUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Function: Reason: Date: 2017年7月17日 下午5:15:37
 *
 * @author wucq
 */
@Service
public class UserAccountServiceImpl extends AbstractService implements UserAccountService {

	private static Log log = LogFactory.getLog(UserAccountServiceImpl.class);

	@Autowired
	UserAccountModelMapper userAccountModelMapper;
	@Autowired
	UserTenantModelMapper userTenantModelMapper;
	@Autowired
	TenantModelMapper tenantModelMapper;
	@Autowired
	private RsaService rsaService;
	@Autowired
	private AbstractLoginService LoginService;

	@Override
	public Result<UserAccountModel> selectByAccount(String userName) throws Exception {

		Result<UserAccountModel> accountResult = this.selectByMobileOrUserName(userName);

		if (accountResult == null || accountResult.getResult() == null) {
			throw new BaseException(CodeConstant.CODE_1000019);
		}
		UserAccountModel userAccountModel = accountResult.getResult();

		return Result.newSuccessResult(userAccountModel);

	}

	@Override
	public Result<Boolean> checkAccount(String userName, Long tenantId) throws Exception {

		Result<UserAccountModel> accountResult = this.selectByMobileOrUserName(userName);

		if (accountResult == null || accountResult.getResult() == null) {
			throw new BaseException(CodeConstant.CODE_1000019);
		}
		UserAccountModel userAccountModel = accountResult.getResult();

		UserTenantModelExample example = new UserTenantModelExample();
		example.createCriteria().andUserIdEqualTo(userAccountModel.getId()).andTenantIdEqualTo(tenantId);
		UserTenantModel model = userTenantModelMapper.selectOne(example);
		if (model == null) {
			throw new BaseException(CodeConstant.CODE_1000019);
		}

		return Result.newSuccessResult(true);

	}

	@Override
	public Result<Boolean> doCheckUserPassword(UserPasswordCheckDto dto) throws Exception {
		Result<UserAccountModel> userAccountResult = selectByMobileOrUserName(dto.getUserName());

		if (!userAccountResult.getSuccess() || userAccountResult.getResult() == null) {

			throw new BaseException(CoreCode.CORE_1250001);
		}

		UserAccountModel userAccount = userAccountResult.getResult();

		if (userAccount != null && userAccount.getPwdErrCount() != null && userAccount.getPwdErrCount() >= 5) {
			LoginService.doLoginOut();// 踢出登录
			return Result.newFailureResult(CodeConstant.CODE_1000037);
		}

		// 校验用户名和密码是否正常
		String password = userAccount.getPassword();
		String orginPassword = rsaService.processDecryptTranPassword(dto.getPassword());
		String md5Password = rsaService.processEncryptDBPassword(orginPassword);
		if (!password.equals(md5Password)) {
			// 累计登录错误次数
			if (userAccount.getPwdErrCount() == null) {
				userAccount.setPwdErrCount(0);
			}
			// 异步调用链接
			ThreadUtils.execute(() -> {
				UserAccountModel record = new UserAccountModel();
				record.setId(userAccount.getId());
				record.setPwdErrCount(userAccount.getPwdErrCount() + 1);
				record.setUpdateDate(new Date());
				record.setUpdateUserId(this.getHeaderUserId());
				userAccountModelMapper.updateByPrimaryKeySelective(record);
			});

			throw new BaseException(CoreCode.CORE_1250002);
		}

		if (userAccount.getPwdErrCount() != null && userAccount.getPwdErrCount() > 0) {
			UserAccountModel record = new UserAccountModel();
			record.setId(userAccount.getId());
			record.setPwdErrCount(0);
			record.setUpdateDate(new Date());
			record.setUpdateUserId(this.getHeaderUserId());
			userAccountModelMapper.updateByPrimaryKeySelective(record);
		}

		return Result.newSuccessResult(true);

	}

	@Override
	public Result<UserAccountDetailDto> checkByMobile(String mobile) throws BaseException {
		UserAccountModelExample example = new UserAccountModelExample();
		example.createCriteria().andMobileEqualTo(mobile);
		UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
		if (userAccount == null) {
			throw new BaseException(CodeConstant.CODE_1000019);
		}

		UserTenantModelExample userTenantModelExample = new UserTenantModelExample();
		Criteria criteria = userTenantModelExample.createCriteria();
		criteria.andUserIdEqualTo(userAccount.getId());
		List<UserTenantModel> userTenantModels = userTenantModelMapper.selectByExample(userTenantModelExample);
		if (userTenantModels == null || userTenantModels.isEmpty()) {
			throw new BaseException(CodeConstant.CODE_1000032);
		}
		int disabledNum = 0;
		int size = userTenantModels.size();
		List<TenantModel> tenantModels = new ArrayList<>();

		for (int i = 0; i < size; i++) {
			UserTenantModel userTenantModel = userTenantModels.get(i);
			TenantModel tenantModel = tenantModelMapper.selectByPrimaryKey(userTenantModel.getTenantId());
			tenantModels.add(tenantModel);
			if (tenantModel == null || tenantModel.getIsEnabled() == 0) {
				disabledNum++;
			}

		}
		if (disabledNum == size) {
			throw new BaseException(CodeConstant.CODE_1000033);
		}
		UserAccountDetailDto dto = new UserAccountDetailDto();
		BeanUtils.copyProperties(userAccount, dto);
		dto.setTenantModels(tenantModels);

		return Result.newSuccessResult(dto);

	}

	@Override
	public Result<UserAccountModel> selectByMobile(String mobile) throws BaseException {
		UserAccountModelExample example = new UserAccountModelExample();
		example.createCriteria().andMobileEqualTo(mobile);
		UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
		return Result.newSuccessResult(userAccount);

	}

	@Override
	public Result<UserAccountModel> selectByMobileOrUserName(String mobileOrUserName) throws BaseException {
		UserAccountModelExample example = new UserAccountModelExample();
		example.createCriteria().andMobileEqualTo(mobileOrUserName);
		UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
		if (userAccount == null) {
			example = new UserAccountModelExample();
			example.createCriteria().andUsernameEqualTo(mobileOrUserName);
			userAccount = userAccountModelMapper.selectOne(example);
		}
		return Result.newSuccessResult(userAccount);

	}

	@Override
	public Result<UserAccountModel> selectByUserName(String userName) throws Exception {
		UserAccountModelExample example = new UserAccountModelExample();
		example.createCriteria().andUsernameEqualTo(userName);
		UserAccountModel userAccount = userAccountModelMapper.selectOne(example);
		return Result.newSuccessResult(userAccount);
	}

	@Override
	public Result<UserAccountModel> selectById(Long id) throws Exception {
		UserAccountModel userAccountModel = userAccountModelMapper.selectByPrimaryKey(id);
		return Result.newSuccessResult(userAccountModel);

	}

	@Override
	public Result<Long> add(UserAccountModel accountModel) throws Exception {
		// 检查手机号码是否存在
		if (StringUtils.isBlank(accountModel.getMobile())) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}
		HeaderUser user = this.getHeaderUser();
		Result<UserAccountModel> userModelResult = this.selectByMobile(accountModel.getMobile());

		Long userId = null;
		if (userModelResult == null || userModelResult.getResult() == null) {
			if (StringUtils.isBlank(accountModel.getPassword())) {
				throw new BaseException(CodeConstant.CODE_1000016, "密码不能为空");
			}
			String decryptPassword = rsaService.processDecryptTranPassword(accountModel.getPassword());
			accountModel.setPassword(rsaService.processEncryptDBPassword(decryptPassword));
			accountModel.setCreateDate(new Date());
			accountModel.setCreateUserId(user.getUserId());
			userAccountModelMapper.insertSelective(accountModel);
			userId = accountModel.getId();
		} else {
			userId = userModelResult.getResult().getId();
		}

		Result<UserTenantModel> tenantReusult = this.selectTenantByAccountId(userId);

		if (tenantReusult != null && tenantReusult.getResult() == null) {
			UserTenantModel model = new UserTenantModel();
			model.setTenantId(user.getTenantId());
			model.setUserId(userId);
			model.setCreateDate(new Date());
			model.setIsDelete(0);
			userTenantModelMapper.insert(model);
		} else {
			throw new BaseException(CodeConstant.CODE_1000021, "该用户已经存在当前租户！");
		}
		return Result.newSuccessResult(userId);

	}

	public Result<UserTenantModel> selectTenantByAccountId(Long accountId, Long tenantId) throws Exception {
		UserTenantModelExample example = new UserTenantModelExample();
		Criteria criteria = example.createCriteria();
		criteria.andTenantIdEqualTo(tenantId);
		criteria.andUserIdEqualTo(accountId);
		UserTenantModel userTenantModel = userTenantModelMapper.selectOne(example);
		return Result.newSuccessResult(userTenantModel);
	}

	public Result<UserTenantModel> selectTenantByAccountId(Long accountId) throws Exception {
		HeaderUser user = this.getHeaderUser();
		UserTenantModelExample example = new UserTenantModelExample();
		Criteria criteria = example.createCriteria();
		criteria.andTenantIdEqualTo(user.getTenantId());
		criteria.andUserIdEqualTo(accountId);
		UserTenantModel userTenantModel = userTenantModelMapper.selectOne(example);
		return Result.newSuccessResult(userTenantModel);
	}

	/**
	 * 添加租户系统管理员 addTenantSystemUser:
	 *
	 * @return
	 * @throws Exception
	 * @author: 欧阳利
	 * @description:
	 */
	public Result<Long> addTenantSystemAdmin(TenantAdminAddReqDto reqDto) throws Exception {
		// 添加用户
		Result<UserAccountModel> userModelResult = this.selectByMobile(reqDto.getMobile());
		UserAccountModel accountModel = new UserAccountModel();
		BeanUtils.copyProperties(reqDto, accountModel);
		Long userId = null;
		if (userModelResult == null || userModelResult.getResult() == null) {
			if (BooleanUtils.isBlank(reqDto.getPassword())) {
				accountModel.setPassword("6fbae5df417d8e2e38ad7b08a50bc2a6"); // 123456
			} else {
				accountModel.setPassword(rsaService.processEncryptDBPassword(reqDto.getPassword())); // 123456
			}
			accountModel.setCreateDate(new Date());
			userAccountModelMapper.insertSelective(accountModel);
			userId = accountModel.getId();
		} else {
			userId = userModelResult.getResult().getId();
		}

		Result<UserTenantModel> tenantReusult = this.selectTenantByAccountId(userId, reqDto.getTenantId());

		if (tenantReusult != null && tenantReusult.getResult() == null) {
			UserTenantModel model = new UserTenantModel();
			model.setTenantId(reqDto.getTenantId());
			model.setUserId(userId);
			model.setCreateDate(new Date());
			model.setIsDelete(0);
			userTenantModelMapper.insert(model);
		} else {
			throw new BaseException(CodeConstant.CODE_1000021, "帐号已存在");
		}

		// 调用租户接口创建系统管理员用户
		Result<Long> tenandResult = callTenantAddAdminUser(reqDto, userId);
		if (!tenandResult.getSuccess()) {
			throw new BaseException(tenandResult.getCode(), tenandResult.getMessage());
		}
		return Result.newSuccessResult(userId);
	}

	@Override
	public Result<Boolean> checkPwd(UserCheckPwdReqDto dto) throws BaseException {
		UserAccountModel user = userAccountModelMapper.selectByPrimaryKey(dto.getId());
		if (null == user)
			throw new BaseException(CodeConstant.CODE_1000019);
		// 校验用户名和密码是否正常
		String md5Password;
		try {
			String orginPassword = rsaService.processDecryptTranPassword(dto.getPassword());
			md5Password = rsaService.processEncryptDBPassword(orginPassword);
		} catch (Exception ex) {
			log.error("校验密码 checkPwd方法 异常：%s", ex.toString());
			throw new BaseException(CodeConstant.CODE_1000020);
		}
		return Result.newSuccessResult(user.getPassword().equals(md5Password));
	}

	/**
	 * 添加租户系统管理员用户 callTenantAddAdminUser:
	 *
	 * @param reqDto
	 * @param userId
	 * @return
	 * @author: 欧阳利
	 * @description:
	 */
	private Result<Long> callTenantAddAdminUser(TenantAdminAddReqDto reqDto, Long userId) throws BaseException {
		Map<String, Object> map = ArgsUtils.toMap(reqDto);
		map.put("userId", userId.toString());
		Result<Long> result = TenantHttpUtils.post(TenantUrlConstant.ADD_TENANT_SYSTEM_ADMIN, map,
				new BaseTypeReference<Result<Long>>() {
				}, reqDto.getTenantId());
		return result;
	}

	/**
	 * 获取头部参数
	 *
	 * @return 头部参数
	 */
	public static Map<String, String> getHeaderParams(Long tenandId) {
		Map<String, String> result = new HashMap<>();
		result.put(HeaderConstant.HEADER_USER_ID, "-1");
		result.put(HeaderConstant.HEADER_TENANT_ID, tenandId.toString());
		result.put(HeaderConstant.HEADER_REAL_NAME, "admin");
		result.put(HeaderConstant.HEADER_APP_TYPE, "pc");
		return result;
	}

}
