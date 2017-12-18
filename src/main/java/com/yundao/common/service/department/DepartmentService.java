package com.yundao.common.service.department;

import com.yundao.common.dto.BasePageDto;
import com.yundao.common.enums.EnabledStatusEnum;
import com.yundao.common.model.base.DepartmentModel;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;

import java.util.List;

public interface DepartmentService{


    public Result<Integer> insert(DepartmentModel department) throws Exception;


    public Result<Integer> update(DepartmentModel department) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<DepartmentModel> select(Long id) throws Exception;

    public Result<PaginationSupport<DepartmentModel>> selectPage(DepartmentModel departmentModel, BasePageDto pageDto) throws Exception;

    Result<List<DepartmentModel>> getAll();

    Result<Integer> processEnabled(Long id, EnabledStatusEnum enabled);
}
