package com.yundao.common.mapper.base;

import com.yundao.common.model.base.TenantInitRoleModel;
import com.yundao.common.model.base.TenantInitRoleModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TenantInitRoleModelMapper {
    int countByExample(TenantInitRoleModelExample example);

    int deleteByExample(TenantInitRoleModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TenantInitRoleModel record);

    int insertSelective(TenantInitRoleModel record);

    List<TenantInitRoleModel> selectByExample(TenantInitRoleModelExample example);

    TenantInitRoleModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TenantInitRoleModel record, @Param("example") TenantInitRoleModelExample example);

    TenantInitRoleModel selectOne(TenantInitRoleModelExample example);

    int updateByExample(@Param("record") TenantInitRoleModel record, @Param("example") TenantInitRoleModelExample example);

    int updateByPrimaryKeySelective(TenantInitRoleModel record);

    int updateByPrimaryKey(TenantInitRoleModel record);
}