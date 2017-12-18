package com.yundao.common.mapper.resource;

import com.yundao.common.model.base.ResourceModel;
import com.yundao.common.model.base.RoleResourceModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper{

    int updateSubset(@Param("oldCode") String oldCode, @Param("newCode")String newCode);

    List<ResourceModel> getByRoleResources(List<RoleResourceModel> roleResourceModels);
}
