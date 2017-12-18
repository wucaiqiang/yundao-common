package com.yundao.common.dto.tenantinitrole;

import com.yundao.common.model.base.ResourceModel;
import com.yundao.common.model.base.RoleModel;
import com.yundao.common.model.base.RoleResourceModel;

import java.util.List;

/**
 * Created by gjl on 2017/6/28.
 */
public class TenantinitRoleDto {
    public List<RoleModel> roleModelList;
    public List<RoleResourceModel> roleResourceModelList;
    public List<ResourceModel> resourceModelList;

    public TenantinitRoleDto(List<RoleModel> roleModelList, List<RoleResourceModel> roleResourceModelList, List<ResourceModel> resourceModelList) {
        this.roleModelList = roleModelList;
        this.roleResourceModelList = roleResourceModelList;
        this.resourceModelList = resourceModelList;
    }

    public TenantinitRoleDto() {
    }

    public List<RoleModel> getRoleModelList() {
        return roleModelList;
    }

    public void setRoleModelList(List<RoleModel> roleModelList) {
        this.roleModelList = roleModelList;
    }

    public List<RoleResourceModel> getRoleResourceModelList() {
        return roleResourceModelList;
    }

    public void setRoleResourceModelList(List<RoleResourceModel> roleResourceModelList) {
        this.roleResourceModelList = roleResourceModelList;
    }

    public List<ResourceModel> getResourceModelList() {
        return resourceModelList;
    }

    public void setResourceModelList(List<ResourceModel> resourceModelList) {
        this.resourceModelList = resourceModelList;
    }
}
