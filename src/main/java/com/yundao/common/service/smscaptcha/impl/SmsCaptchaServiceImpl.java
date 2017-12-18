package com.yundao.common.service.smscaptcha.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.login.RetrievePasswordDto;
import com.yundao.common.dto.sms.SmsTemplateDto;
import com.yundao.common.enums.smscaptcha.SmsCaptchaEnum;
import com.yundao.common.mapper.base.SmsCaptchaModelMapper;
import com.yundao.common.mapper.base.UserAccountModelMapper;
import com.yundao.common.mapper.smscaptcha.SmsCaptchaMapper;
import com.yundao.common.model.base.SmsCaptchaModel;
import com.yundao.common.model.base.SmsCaptchaModelExample;
import com.yundao.common.model.base.SmsCaptchaModelExample.Criteria;
import com.yundao.common.model.base.UserAccountModel;
import com.yundao.common.service.sms.SmsService;
import com.yundao.common.service.smscaptcha.SmsCaptchaService;
import com.yundao.common.service.user.UserAccountService;
import com.yundao.common.service.user.UserService;
import com.yundao.common.util.DateUtil;
import com.yundao.core.code.Result;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.enums.SmsTypeEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.service.AbstractService;
import com.yundao.core.utils.CaptchaUtils;
import com.yundao.core.utils.ConfigUtils;

@Service
public class SmsCaptchaServiceImpl extends AbstractService implements SmsCaptchaService {
	private Log logger = LogFactory.getLog(SmsCaptchaServiceImpl.class);
	@Autowired
	private SmsCaptchaModelMapper smsCaptchaModelMapper;

	@Autowired
	private SmsCaptchaMapper smsCaptchaMapper;
	@Autowired
	private SmsService smsService;
	@Autowired
	private UserAccountService userAccountService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserAccountModelMapper userAccountModelMapper;
	/**
	 * 验证码有效时间
	 */
	private final int VALID_MINUTE = 15;

	@Override
	public Result<Boolean> doSend(String type, String mobile) throws BaseException {
		if (StringUtils.isBlank(mobile)) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}

		userAccountService.checkByMobile(mobile);// 校验手机号码

		if (StringUtils.isBlank(type)) {
			throw new BaseException(CodeConstant.CODE_1000024);
		}
		String templateCode = "";
		if (SmsCaptchaEnum.REGISTER.getType().equals(type)) {
			// 注册
			templateCode = ConfigUtils.getValue("register.template.code");
		} else if (SmsCaptchaEnum.RETRIEVE.getType().equals(type)) {
			// 找回密码
			templateCode = ConfigUtils.getValue("retrieve.template.code");
		} else {
			throw new BaseException(CodeConstant.CODE_1000027);
		}
		if (StringUtils.isBlank(templateCode)) {
			throw new BaseException(CodeConstant.CODE_1000029);
		}

		String captcha = String.valueOf(CaptchaUtils.getCaptcha());

		Result<Integer> insertResult = this.insert(templateCode, mobile, captcha);// 入库
		if (!insertResult.getSuccess() || insertResult.getResult() == 0) {
			throw new BaseException(CodeConstant.CODE_1000034);
		}

		SmsTemplateDto dto = new SmsTemplateDto();
		dto.setCode(templateCode);
		dto.setSmsType(String.valueOf(SmsTypeEnum.CAPTCHA.getValue()));
		Map<String, String> smsParams = new HashMap<>();
		smsParams.put("code", captcha);
		dto.setParams(smsParams);
		dto.setMobiles(mobile);
		Result<Integer> sendResult = smsService.doSend(dto);// 发送短信
		if (!sendResult.getSuccess()) {
			throw new BaseException(sendResult.getCode(), sendResult.getMessage());
		}
		return Result.newSuccessResult(true);

	}

	@Override
	public Result<Boolean> processRetrievePassword(String type, RetrievePasswordDto dto) throws Exception {
		if (StringUtils.isBlank(dto.getMobile())) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}
		Result<UserAccountModel> userAccountResult = userAccountService.selectByMobile(dto.getMobile());
		if (userAccountResult == null || userAccountResult.getResult() == null) {
			throw new BaseException(CodeConstant.CODE_1000019);
		}

		if (StringUtils.isBlank(type)) {
			throw new BaseException(CodeConstant.CODE_1000024);
		}
		String templateCode = "";
		if (SmsCaptchaEnum.REGISTER.getType().equals(type)) {
			// 注册
			templateCode = ConfigUtils.getValue("register.template.code");
		} else if (SmsCaptchaEnum.RETRIEVE.getType().equals(type)) {
			// 找回密码
			templateCode = ConfigUtils.getValue("retrieve.template.code");
		} else {
			throw new BaseException(CodeConstant.CODE_1000027);
		}
		if (StringUtils.isBlank(templateCode)) {
			throw new BaseException(CodeConstant.CODE_1000029);
		}
		Result<Boolean> check = this.doVerify(templateCode, dto.getCaptcha(), dto.getMobile());
		if (check == null || !check.getSuccess()) {
			throw new BaseException(CodeConstant.CODE_1000025);
		}

		userService.updateUserPassword(dto.getMobile(), dto.getPassword());

		// 解除锁定
		UserAccountModel record = new UserAccountModel();
        record.setId(userAccountResult.getResult().getId());
        record.setPwdErrCount(0);
        record.setUpdateDate(new Date());
		record.setOnceEditPwd(NumberEnum.ONE.getValue());
        record.setUpdateUserId(this.getHeaderUserId());
        userAccountModelMapper.updateByPrimaryKeySelective(record);
		
		return Result.newSuccessResult(true);

	}

	public Result<Integer> insert(String templateCode, String mobile, String captcha) throws BaseException {
		if (StringUtils.isBlank(mobile)) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}
		if (StringUtils.isBlank(templateCode)) {
			throw new BaseException(CodeConstant.CODE_1000029);
		}
		if (StringUtils.isBlank(captcha)) {
			throw new BaseException(CodeConstant.CODE_1000028);
		}
		SmsCaptchaModel updateMode = new SmsCaptchaModel();
		updateMode.setIsValid(NumberEnum.ZERO.getValue());
		SmsCaptchaModelExample updateExample = new SmsCaptchaModelExample();
		updateExample.createCriteria().andMobileEqualTo(mobile).andTemplateCodeEqualTo(templateCode);
		smsCaptchaModelMapper.updateByExampleSelective(updateMode, updateExample);// 修改当前手机号码认证码状态为无效

		SmsCaptchaModel smsCaptcha = new SmsCaptchaModel();
		super.initialModel(smsCaptcha);
		smsCaptcha.setCode(captcha);
		smsCaptcha.setMobile(mobile);
		smsCaptcha.setTemplateCode(templateCode);
		smsCaptcha.setExpireTime(DateUtil.addMinute(VALID_MINUTE));
		smsCaptcha.setIsValid(NumberEnum.ONE.getValue());

		int count = smsCaptchaModelMapper.insertSelective(smsCaptcha);
		return Result.newSuccessResult(count);
	}

	@Override
	public Result<SmsCaptchaModel> selectCodeByMobile(String mobile, String templateCode) throws BaseException {
		if (StringUtils.isBlank(mobile)) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}
		if (StringUtils.isBlank(templateCode)) {
			throw new BaseException(CodeConstant.CODE_1000029);
		}
		SmsCaptchaModelExample example = new SmsCaptchaModelExample();
		Criteria criteria = example.createCriteria();
		criteria.andMobileEqualTo(mobile);
		criteria.andTemplateCodeEqualTo(templateCode);
		criteria.andIsValidEqualTo(NumberEnum.ONE.getValue());

		example.setOrderByClause("create_date desc");
		SmsCaptchaModel model = smsCaptchaModelMapper.selectOne(example);
		return Result.newSuccessResult(model);
	}

	@Override
	public Result<Boolean> doVerify(String templateCode, String captcha, String mobile) throws BaseException {
		if (StringUtils.isBlank(mobile)) {
			throw new BaseException(CodeConstant.CODE_1000017);
		}
		if (StringUtils.isBlank(captcha)) {
			throw new BaseException(CodeConstant.CODE_1000028);
		}
		if (StringUtils.isBlank(templateCode)) {
			throw new BaseException(CodeConstant.CODE_1000029);
		}
		String logPrefix = "短信验证码||校验||";
		logger.info("%s||参数 templateCode %s,captcha %s,mobile %s", logPrefix, templateCode, captcha, mobile);

		Result<SmsCaptchaModel> dtoResult = this.selectCodeByMobile(mobile, templateCode);
		if (dtoResult == null || dtoResult.getResult() == null) {
			throw new BaseException(CodeConstant.CODE_1000025);
		}
		SmsCaptchaModel model = dtoResult.getResult();

		Date now = new Date();
		if (model.getIsValid().equals(NumberEnum.ZERO.getValue())) {
			throw new BaseException(CodeConstant.CODE_1000026);
		} else if (now.compareTo(model.getExpireTime()) >= 0) {
			throw new BaseException(CodeConstant.CODE_1000026);
		} else if (!model.getCode().equals(captcha)) {
			throw new BaseException(CodeConstant.CODE_1000025);
		}
		// 将验证码设置失效
		super.updateModel(model);
		model.setIsValid(NumberEnum.ZERO.getValue());
		smsCaptchaMapper.updateValid(model);
		logger.info("%s完成", logPrefix);
		return Result.newSuccessResult();
	}

}
