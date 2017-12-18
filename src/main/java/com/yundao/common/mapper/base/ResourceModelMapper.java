package com.yundao.common.mapper.base;

import com.yundao.common.model.base.ResourceModel;
import com.yundao.common.model.base.ResourceModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ResourceModelMapper {
    int countByExample(ResourceModelExample example);

    int deleteByExample(ResourceModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ResourceModel record);

    int insertSelective(ResourceModel record);

    List<ResourceModel> selectByExample(ResourceModelExample example);

    ResourceModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ResourceModel record, @Param("example") ResourceModelExample example);

    ResourceModel selectOne(ResourceModelExample example);

    int updateByExample(@Param("record") ResourceModel record, @Param("example") ResourceModelExample example);

    int updateByPrimaryKeySelective(ResourceModel record);

    int updateByPrimaryKey(ResourceModel record);
}