

package com.yundao.common.service.login;

import com.yundao.common.dto.login.UserLoginResDto;
import com.yundao.common.dto.login.UserLoginReqDto;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * Function: 
 * Reason:	  
 * Date:     2017年7月17日 下午4:23:21 
 * @author   wucq
 * @version   
 */
public interface LoginService {
  public Result<UserLoginResDto> doLogin(UserLoginReqDto loginReqDto)throws Exception;
  public Result<Boolean> doLoginOut()throws Exception;
}

