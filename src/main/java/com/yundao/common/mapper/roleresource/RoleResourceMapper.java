package com.yundao.common.mapper.roleresource;

import com.yundao.common.model.base.RoleModel;
import com.yundao.common.model.base.RoleResourceModel;

import java.util.List;

public interface RoleResourceMapper{

    List<RoleResourceModel> getByRoles(List<RoleModel> roleModels);

    List<RoleResourceModel> getByRoleId(Long roleId);
}
