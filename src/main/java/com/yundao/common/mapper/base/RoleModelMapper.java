package com.yundao.common.mapper.base;

import com.yundao.common.model.base.RoleModel;
import com.yundao.common.model.base.RoleModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleModelMapper {
    int countByExample(RoleModelExample example);

    int deleteByExample(RoleModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(RoleModel record);

    int insertSelective(RoleModel record);

    List<RoleModel> selectByExample(RoleModelExample example);

    RoleModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") RoleModel record, @Param("example") RoleModelExample example);

    RoleModel selectOne(RoleModelExample example);

    int updateByExample(@Param("record") RoleModel record, @Param("example") RoleModelExample example);

    int updateByPrimaryKeySelective(RoleModel record);

    int updateByPrimaryKey(RoleModel record);
}