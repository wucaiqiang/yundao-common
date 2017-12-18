package com.yundao.common.service.system;

import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.SystemModel;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;

public interface SystemService{


    public Result<Integer> insert(SystemModel system) throws Exception;


    public Result<Integer> update(SystemModel system) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;
    /**
     * 校验系统编码合法性
     * @param systemCode
     * @return
     * @throws Exception
     */
    public Result<Boolean> checkLegal(String systemCode) throws Exception;
    public Result<SystemModel> select(Long id) throws Exception;

    public Result<PaginationSupport<SystemModel>> selectPage(SystemModel systemModel, BasePageDto pageDto) throws Exception;


}
