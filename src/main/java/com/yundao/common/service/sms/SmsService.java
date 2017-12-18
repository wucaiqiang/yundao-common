

package com.yundao.common.service.sms;

import com.yundao.common.dto.sms.SmsTemplateDto;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * Function: 
 * Reason:	  
 * Date:     2017年9月13日 下午4:57:19 
 * @author   wucq
 * @version   
 */
public interface SmsService {
	public Result<Integer> doSend(SmsTemplateDto dto) throws BaseException;
}

