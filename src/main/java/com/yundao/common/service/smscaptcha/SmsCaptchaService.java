package com.yundao.common.service.smscaptcha;

import com.yundao.common.dto.login.RetrievePasswordDto;
import com.yundao.common.model.base.SmsCaptchaModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

public interface SmsCaptchaService{

    public Result<Integer> insert(String templateCode,String mobile, String captcha) throws BaseException;
    public Result<SmsCaptchaModel> selectCodeByMobile(String mobile,String templateCode) throws BaseException;
    public Result<Boolean> doVerify(String templateCode, String captcha, String mobile) throws BaseException;
    public Result<Boolean> doSend(String type,String mobile) throws BaseException;
    public Result<Boolean> processRetrievePassword(String type,RetrievePasswordDto dto) throws Exception;

}
