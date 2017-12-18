package com.yundao.common.mapper.smscaptcha;

import com.yundao.common.model.base.SmsCaptchaModel;
import com.yundao.core.exception.BaseException;

public interface SmsCaptchaMapper{
    int updateValid(SmsCaptchaModel model) throws BaseException;
}
