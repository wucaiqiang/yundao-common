package com.yundao.common.mapper.tenantinitrole;

import com.yundao.common.model.base.RoleModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TenantInitRoleMapper{

    List<RoleModel> getRoleModels(@Param("tenantId") Long tenantId, @Param("systemCode") String systemCode);
}
