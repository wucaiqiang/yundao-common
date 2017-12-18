package com.yundao.common.service.videotenant.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.url.TenantUrlConstant;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.dto.videotenant.FileHandleDto;
import com.yundao.common.dto.videotenant.VideoMessageDto;
import com.yundao.common.enums.video.VideoStatusEnum;
import com.yundao.common.mapper.base.VideoTenantModelMapper;
import com.yundao.common.mapper.videotenant.VideoTenantMapper;
import com.yundao.common.model.base.VideoTenantModel;
import com.yundao.common.model.base.VideoTenantModelExample;
import com.yundao.common.service.tencent.TencentService;
import com.yundao.common.service.videotenant.VideoTenantService;
import com.yundao.common.util.TenantHttpUtils;
import com.yundao.core.code.Result;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.exception.BaseException;
import com.yundao.core.json.jackson.type.BaseTypeReference;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.service.AbstractService;
import com.yundao.core.utils.JsonUtils;
import com.yundao.core.utils.Limit;

@Service
public class VideoTenantServiceImpl extends AbstractService implements VideoTenantService {

	private Log logger = LogFactory.getLog(VideoTenantServiceImpl.class);

	@Autowired
	private VideoTenantModelMapper videoTenantModelMapper;

	@Autowired
	private VideoTenantMapper videoTenantMapper;
	@Autowired
	private TencentService tencentService;

	@Override
	public Result<Boolean> doGetTranscodeMsg() throws Exception {

		VideoMessageDto videoMessageDto = tencentService.getPullEvent();

		if (videoMessageDto != null && !videoMessageDto.getTenantVideoMap().isEmpty()) {
			Map<Long, List<FileHandleDto>> tenantVideoMap = videoMessageDto.getTenantVideoMap();
			tenantVideoMap.forEach((k, v) -> {
				// 调用租户接口进行文件处理
				this.doSendVideoHandleMessage(k, v);
			});
		}
		return Result.newSuccessResult();

	}

	private Result<Boolean> doSendVideoHandleMessage(Long tenantId, List<FileHandleDto> fileHandleDtos) {
		try {
			Map<String, Object> methodParams = new HashMap<>();
			methodParams.put("fileHandleDtos", JsonUtils.objectToJson(fileHandleDtos));
			Result<Boolean> result = TenantHttpUtils.post(TenantUrlConstant.VIDEO_FILE_HANDLE, methodParams,
					new BaseTypeReference<Result<Boolean>>() {
					}, tenantId);
			return result;
		} catch (BaseException e) {
			logger.error("调用租户ID为：" + tenantId + "的接口，进行视频处理出现异常，异常信息为：", e);
		}
		return Result.newFailureResult();
	}

	public Result<Long> insert(VideoTenantModel videoTenant) throws Exception {
		VideoTenantModelExample example = new VideoTenantModelExample();
		example.createCriteria().andRefFileIdEqualTo(videoTenant.getRefFileId());
		VideoTenantModel model = videoTenantModelMapper.selectOne(example);
		if (model == null) {
			videoTenant.setCreateDate(new Date());
			videoTenant.setCreateUserId(this.getHeaderUserId());
			videoTenant.setId(null);
			videoTenant.setTenantId(this.getHeaderTenantId());
			videoTenant.setStatus(VideoStatusEnum.TRANSCODING.getValue());
			int count = videoTenantModelMapper.insertSelective(videoTenant);
		}

		return Result.newSuccessResult(videoTenant.getId());
	}

	@Override
	public Result<Integer> updateStatus(List<String> refFileIds, Integer status) throws Exception {
		if (refFileIds == null || refFileIds.isEmpty() || status == null) {
			return null;
		}
		VideoTenantModelExample example = new VideoTenantModelExample();
		example.createCriteria().andRefFileIdIn(refFileIds);
		VideoTenantModel record = new VideoTenantModel();
		record.setStatus(VideoStatusEnum.NORMAL.getValue());
		int count = videoTenantModelMapper.updateByExampleSelective(record, example);
		return Result.newSuccessResult(count);

	}

	public Result<Integer> update(VideoTenantModel videoTenant) throws Exception {
		videoTenant.setUpdateDate(new Date());
		int count = videoTenantModelMapper.updateByPrimaryKeySelective(videoTenant);
		return Result.newSuccessResult(count);
	}

	public Result<Integer> delete(Long id) throws Exception {
		VideoTenantModel videoTenant = new VideoTenantModel();
		videoTenant.setId(id);
		videoTenant.setIsDelete(CommonConstant.ONE);
		int count = videoTenantModelMapper.updateByPrimaryKeySelective(videoTenant);
		return Result.newSuccessResult(count);
	}

	@Override
	public Result<List<VideoTenantModel>> selectByRefFileIds(List<String> refFileIds) throws Exception {
		if (refFileIds == null || refFileIds.isEmpty()) {
			return Result.newSuccessResult(null);
		}
		List<VideoTenantModel> videoTenantModels = videoTenantMapper.selectByRefFileIds(refFileIds);

		return Result.newSuccessResult(videoTenantModels);

	}

	public Result<VideoTenantModel> select(Long id) throws Exception {
		VideoTenantModel model = videoTenantModelMapper.selectByPrimaryKey(id);
		return Result.newSuccessResult(model);
	}

	public Result<PaginationSupport<VideoTenantModel>> selectPage(VideoTenantModel videoTenantModel,
			BasePageDto pageDto) throws Exception {
		VideoTenantModelExample videoTenantModelExample = new VideoTenantModelExample()
				.setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		String orderByClause = "create_date desc";
		VideoTenantModelExample.Criteria criteria = videoTenantModelExample.createCriteria();
		if (StringUtils.isNotBlank(pageDto.getOrderColumn())) {
			StringBuilder orderBuider = new StringBuilder();
			orderBuider.append(pageDto.getOrderColumn()).append(" ");
			if (StringUtils.isNotBlank(pageDto.getSort())) {
				orderBuider.append(pageDto.getSort());
			} else {
				orderBuider.append("desc");
			}
			orderByClause = orderBuider.toString();
		}
		videoTenantModelExample.setOrderByClause(orderByClause);
		List<VideoTenantModel> list = videoTenantModelMapper.selectByExample(videoTenantModelExample);
		int totalCount = videoTenantModelMapper.countByExample(videoTenantModelExample);
		PaginationSupport<VideoTenantModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
	}

}
