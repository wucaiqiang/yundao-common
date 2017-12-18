package com.yundao.common.mapper.base;

import com.yundao.common.model.base.TenantModel;
import com.yundao.common.model.base.TenantModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TenantModelMapper {
    int countByExample(TenantModelExample example);

    int deleteByExample(TenantModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TenantModel record);

    int insertSelective(TenantModel record);

    List<TenantModel> selectByExample(TenantModelExample example);

    TenantModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TenantModel record, @Param("example") TenantModelExample example);

    TenantModel selectOne(TenantModelExample example);

    int updateByExample(@Param("record") TenantModel record, @Param("example") TenantModelExample example);

    int updateByPrimaryKeySelective(TenantModel record);

    int updateByPrimaryKey(TenantModel record);
}