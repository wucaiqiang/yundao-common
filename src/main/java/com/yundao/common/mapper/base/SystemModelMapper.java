package com.yundao.common.mapper.base;

import com.yundao.common.model.base.SystemModel;
import com.yundao.common.model.base.SystemModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SystemModelMapper {
    int countByExample(SystemModelExample example);

    int deleteByExample(SystemModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemModel record);

    int insertSelective(SystemModel record);

    List<SystemModel> selectByExample(SystemModelExample example);

    SystemModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemModel record, @Param("example") SystemModelExample example);

    SystemModel selectOne(SystemModelExample example);

    int updateByExample(@Param("record") SystemModel record, @Param("example") SystemModelExample example);

    int updateByPrimaryKeySelective(SystemModel record);

    int updateByPrimaryKey(SystemModel record);
}