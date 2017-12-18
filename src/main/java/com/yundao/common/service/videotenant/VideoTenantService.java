package com.yundao.common.service.videotenant;

import java.util.List;
import com.yundao.common.mapper.base.VideoTenantModelMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.VideoTenantModel;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;

import java.util.Map;

public interface VideoTenantService{

	public Result<Boolean> doGetTranscodeMsg() throws Exception;
	
    public Result<Long> insert(VideoTenantModel videoTenant) throws Exception;


    public Result<Integer> update(VideoTenantModel videoTenant) throws Exception;
    public Result<Integer> updateStatus(List<String> refFileIds,Integer status) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<VideoTenantModel> select(Long id) throws Exception;
    public Result<List<VideoTenantModel>> selectByRefFileIds(List<String> refFileIds) throws Exception;

    public Result<PaginationSupport<VideoTenantModel>> selectPage(VideoTenantModel videoTenantModel, BasePageDto pageDto) throws Exception;

}
