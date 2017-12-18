

package com.yundao.common.service.user;

import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * Function: 
 * Reason:	  
 * Date:     2017年9月14日 下午5:04:06 
 * @author   欧阳利
 * @version   
 */
public interface UserTenantService {

	/**
	 * 产生用户和租户的关联
	 * deleteUserTenant:
	 * @author: 欧阳利
	 * @param userId
	 * @param tenantId
	 * @return
	 * @throws BaseException
	 * @description:
	 */
	public Result<Integer> deleteUserTenant(Long  userId, Long tenantId)throws BaseException;
}

