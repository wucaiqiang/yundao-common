package com.yundao.common.service.tenantinitdepartment;

import java.util.List;
import com.yundao.common.mapper.base.TenantInitDepartmentModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.DepartmentModel;
import com.yundao.common.model.base.TenantInitDepartmentModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface TenantInitDepartmentService{


    public Result<Integer> insert(TenantInitDepartmentModel tenantInitDepartment) throws Exception;


    public Result<Integer> update(TenantInitDepartmentModel tenantInitDepartment) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<TenantInitDepartmentModel> select(Long id) throws Exception;

    public Result<PaginationSupport<TenantInitDepartmentModel>> selectPage(TenantInitDepartmentModel tenantInitDepartmentModel, BasePageDto pageDto) throws Exception;

    Result<List<DepartmentModel>> getTenantDepartment(Long tenantId, String systemCode);

    Result<TenantInitDepartmentModel> uploadTenantRole(Long tenantId, String departmentIds, String systemCode) throws BaseException;
}
