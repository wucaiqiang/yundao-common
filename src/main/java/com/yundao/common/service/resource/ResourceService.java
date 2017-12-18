package com.yundao.common.service.resource;

import java.util.List;
import com.yundao.common.mapper.base.ResourceModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.ResourceModel;
import com.yundao.common.model.base.RoleResourceModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface ResourceService{


    public Result<Integer> insert(ResourceModel resource) throws Exception;


    public Result<Integer> update(ResourceModel resource) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<ResourceModel> select(Long id) throws Exception;

    public Result<PaginationSupport<ResourceModel>> selectPage(ResourceModel resourceModel, BasePageDto pageDto) throws Exception;

    public Result<List<ResourceModel>> getsByRoleId(Long roleId) throws BaseException;

    List<ResourceModel> getByRoleResources(List<RoleResourceModel> roleResourceModels);
}
