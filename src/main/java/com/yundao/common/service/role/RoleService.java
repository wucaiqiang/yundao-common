package com.yundao.common.service.role;

import java.util.List;
import com.yundao.common.mapper.base.RoleModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.RoleModel;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface RoleService{


    public Result<Integer> insert(RoleModel role) throws Exception;


    public Result<Integer> update(RoleModel role) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<RoleModel> select(Long id) throws Exception;

    public Result<PaginationSupport<RoleModel>> selectPage(RoleModel roleModel, BasePageDto pageDto) throws Exception;

}
