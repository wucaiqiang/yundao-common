package com.yundao.common.service.contract;

import java.util.List;
import com.yundao.common.mapper.base.ContractModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.ContractModel;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface ContractService{


    public Result<Integer> insert(ContractModel contract) throws Exception;


    public Result<Integer> update(ContractModel contract) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<ContractModel> select(Long id) throws Exception;

    public Result<PaginationSupport<ContractModel>> selectPage(ContractModel contractModel, BasePageDto pageDto) throws Exception;

}
