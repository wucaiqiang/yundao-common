package com.yundao.common.mapper.videotenant;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yundao.common.model.base.VideoTenantModel;

public interface VideoTenantMapper {

	public List<VideoTenantModel> selectByRefFileIds(@Param("refFileIds") List<String> refFileIds);
}
