package com.yundao.common.service.tenantinitrole;

import java.util.List;

import com.yundao.common.dto.tenantinitrole.TenantinitRoleDto;
import com.yundao.common.mapper.base.TenantInitRoleModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.TenantInitRoleModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface TenantInitRoleService{


    public Result<Integer> insert(TenantInitRoleModel tenantInitRole) throws Exception;


    public Result<Integer> update(TenantInitRoleModel tenantInitRole) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<TenantInitRoleModel> select(Long id) throws Exception;

    public Result<PaginationSupport<TenantInitRoleModel>> selectPage(TenantInitRoleModel tenantInitRoleModel, BasePageDto pageDto) throws Exception;

    Result<TenantinitRoleDto> getTenantRole(Long tenantId, String systemCode);

    Result<TenantInitRoleModel> uploadTenantRole(Long tenantId, String roleIds, String systemCode) throws BaseException;
}
