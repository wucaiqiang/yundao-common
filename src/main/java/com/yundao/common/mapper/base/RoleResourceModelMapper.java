package com.yundao.common.mapper.base;

import com.yundao.common.model.base.RoleResourceModel;
import com.yundao.common.model.base.RoleResourceModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleResourceModelMapper {
    int countByExample(RoleResourceModelExample example);

    int deleteByExample(RoleResourceModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(RoleResourceModel record);

    int insertSelective(RoleResourceModel record);

    List<RoleResourceModel> selectByExample(RoleResourceModelExample example);

    RoleResourceModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") RoleResourceModel record, @Param("example") RoleResourceModelExample example);

    RoleResourceModel selectOne(RoleResourceModelExample example);

    int updateByExample(@Param("record") RoleResourceModel record, @Param("example") RoleResourceModelExample example);

    int updateByPrimaryKeySelective(RoleResourceModel record);

    int updateByPrimaryKey(RoleResourceModel record);
}