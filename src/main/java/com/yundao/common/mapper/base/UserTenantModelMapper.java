package com.yundao.common.mapper.base;

import com.yundao.common.model.base.UserTenantModel;
import com.yundao.common.model.base.UserTenantModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserTenantModelMapper {
    int countByExample(UserTenantModelExample example);

    int deleteByExample(UserTenantModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserTenantModel record);

    int insertSelective(UserTenantModel record);

    List<UserTenantModel> selectByExample(UserTenantModelExample example);

    UserTenantModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserTenantModel record, @Param("example") UserTenantModelExample example);

    UserTenantModel selectOne(UserTenantModelExample example);

    int updateByExample(@Param("record") UserTenantModel record, @Param("example") UserTenantModelExample example);

    int updateByPrimaryKeySelective(UserTenantModel record);

    int updateByPrimaryKey(UserTenantModel record);
}