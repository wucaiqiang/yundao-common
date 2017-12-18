package com.yundao.common.service.roleresource;

import java.util.List;
import com.yundao.common.mapper.base.RoleResourceModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.RoleModel;
import com.yundao.common.model.base.RoleResourceModel;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface RoleResourceService{


    public Result<Integer> insert(RoleResourceModel roleResource) throws Exception;


    public Result<Integer> update(RoleResourceModel roleResource) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<RoleResourceModel> select(Long id) throws Exception;

    public Result<PaginationSupport<RoleResourceModel>> selectPage(RoleResourceModel roleResourceModel, BasePageDto pageDto) throws Exception;

    List<RoleResourceModel> getByRoles(List<RoleModel> roleModels);

    Result<Integer> updateRoleResource(String resourceIds, Long roleId);
}
