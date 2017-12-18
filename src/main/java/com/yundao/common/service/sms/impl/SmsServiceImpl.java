
package com.yundao.common.service.sms.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.constant.url.BaseUrlConstant;
import com.yundao.common.dto.sms.SmsTemplateDto;
import com.yundao.common.service.sms.SmsService;
import com.yundao.common.util.HttpUtils;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.json.jackson.type.BaseTypeReference;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.service.AbstractService;
import com.yundao.core.utils.JsonUtils;

/**
 * Function: Reason: Date: 2017年9月13日 下午4:57:51
 * 
 * @author wucq
 * @version
 */
@Service
public class SmsServiceImpl extends AbstractService implements SmsService {
	private Log log = LogFactory.getLog(SmsServiceImpl.class);

	@Override
	public Result<Integer> doSend(SmsTemplateDto dto) throws BaseException {

		Map<String, Object> params = new HashMap<>(4);
		params.put("templateCode", dto.getCode());
		params.put("mobiles", dto.getMobiles());
		params.put("templateParam", dto.getTemplateParma());
		params.put("smsType", dto.getSmsType());
		try {
			Result<Integer> result = HttpUtils.post(BaseUrlConstant.SEND_SMS, params,
					new BaseTypeReference<Result<Integer>>() {
					});
			log.info("sms doSend result:%s", JsonUtils.objectToJson(result));
			return result;
		} catch (Exception e) {
			log.error("doSend 异常：%s", e.toString());
			throw new BaseException(CodeConstant.CODE_1000034);
		}
	}
}
