package com.yundao.common.mapper.base;

import com.yundao.common.model.base.VideoTenantModel;
import com.yundao.common.model.base.VideoTenantModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VideoTenantModelMapper {
    int countByExample(VideoTenantModelExample example);

    int deleteByExample(VideoTenantModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(VideoTenantModel record);

    int insertSelective(VideoTenantModel record);

    List<VideoTenantModel> selectByExample(VideoTenantModelExample example);

    VideoTenantModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") VideoTenantModel record, @Param("example") VideoTenantModelExample example);

    VideoTenantModel selectOne(VideoTenantModelExample example);

    int updateByExample(@Param("record") VideoTenantModel record, @Param("example") VideoTenantModelExample example);

    int updateByPrimaryKeySelective(VideoTenantModel record);

    int updateByPrimaryKey(VideoTenantModel record);
}