package com.yundao.common.mapper.base;

import com.yundao.common.model.base.TenantInitDepartmentModel;
import com.yundao.common.model.base.TenantInitDepartmentModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TenantInitDepartmentModelMapper {
    int countByExample(TenantInitDepartmentModelExample example);

    int deleteByExample(TenantInitDepartmentModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TenantInitDepartmentModel record);

    int insertSelective(TenantInitDepartmentModel record);

    List<TenantInitDepartmentModel> selectByExample(TenantInitDepartmentModelExample example);

    TenantInitDepartmentModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TenantInitDepartmentModel record, @Param("example") TenantInitDepartmentModelExample example);

    TenantInitDepartmentModel selectOne(TenantInitDepartmentModelExample example);

    int updateByExample(@Param("record") TenantInitDepartmentModel record, @Param("example") TenantInitDepartmentModelExample example);

    int updateByPrimaryKeySelective(TenantInitDepartmentModel record);

    int updateByPrimaryKey(TenantInitDepartmentModel record);
}