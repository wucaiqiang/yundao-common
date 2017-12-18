package com.yundao.common.service.keypair;

import com.yundao.common.model.base.KeyPairModel;
import com.yundao.core.code.Result;


public interface KeyPairService{

    public Result<Integer> insert(Long tenantId,String area) throws Exception;
    
    public Result<Integer> updateById(Long id) throws Exception;

    public Result<Integer> delete(Long id) throws Exception;

    public Result<KeyPairModel> selectByTenantId(Long tenantId,String area) throws Exception;

}
