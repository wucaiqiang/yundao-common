package com.yundao.common.mapper.base;

import com.yundao.common.model.base.TenantInitRoleModelD;
import com.yundao.common.model.base.TenantInitRoleModelDExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TenantInitRoleModelDMapper {
    int countByExample(TenantInitRoleModelDExample example);

    int deleteByExample(TenantInitRoleModelDExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TenantInitRoleModelD record);

    int insertSelective(TenantInitRoleModelD record);

    List<TenantInitRoleModelD> selectByExample(TenantInitRoleModelDExample example);

    TenantInitRoleModelD selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TenantInitRoleModelD record, @Param("example") TenantInitRoleModelDExample example);

    TenantInitRoleModelD selectOne(TenantInitRoleModelDExample example);

    int updateByExample(@Param("record") TenantInitRoleModelD record, @Param("example") TenantInitRoleModelDExample example);

    int updateByPrimaryKeySelective(TenantInitRoleModelD record);

    int updateByPrimaryKey(TenantInitRoleModelD record);
}