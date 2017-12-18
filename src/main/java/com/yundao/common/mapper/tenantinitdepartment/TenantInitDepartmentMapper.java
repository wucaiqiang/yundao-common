package com.yundao.common.mapper.tenantinitdepartment;

import com.yundao.common.model.base.DepartmentModel;
import com.yundao.core.code.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TenantInitDepartmentMapper{

    List<DepartmentModel> getTenantDepartment(@Param("tenantId") Long tenantId, @Param("systemCode") String systemCode);
}
