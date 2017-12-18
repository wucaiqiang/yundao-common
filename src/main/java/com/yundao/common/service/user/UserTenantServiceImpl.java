

package com.yundao.common.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.mapper.base.UserTenantModelMapper;
import com.yundao.common.model.base.UserTenantModelExample;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * Function: 
 * Reason:	  
 * Date:     2017年9月14日 下午5:05:02 
 * @author   欧阳利
 * @version   
 */
@Service
public class UserTenantServiceImpl implements UserTenantService {

	@Autowired
	UserTenantModelMapper userTenantModelMapper;
	
	/**
	 * 删除用户和租户的关联
	 * deleteUserTenant:
	 * @author: 欧阳利
	 * @param userId
	 * @param tenantId
	 * @return
	 * @throws BaseException
	 * @description:
	 */
	@Override
	public Result<Integer> deleteUserTenant(Long userId, Long tenantId) throws BaseException {
		UserTenantModelExample example = new UserTenantModelExample();
		example.createCriteria().andUserIdEqualTo(userId).andTenantIdEqualTo(tenantId);
		int count = userTenantModelMapper.deleteByExample(example);
		return Result.newSuccessResult(count);

	}

}

