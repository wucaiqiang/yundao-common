
package com.yundao.common.service.tencent.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.validation.constraints.Null;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qcloud.QcloudApiModuleCenter;
import com.qcloud.Module.Vod;
import com.yundao.common.constant.TencentConstant;
import com.yundao.common.dto.tencent.EventMessageContentDateDto;
import com.yundao.common.dto.tencent.EventMessageContentDto;
import com.yundao.common.dto.tencent.EventMessageDto;
import com.yundao.common.dto.tencent.EventProcessTaskDto;
import com.yundao.common.dto.tencent.EventStateChangedDateDto;
import com.yundao.common.dto.tencent.EventUploadFileDateDto;
import com.yundao.common.dto.tencent.VideoEventDto;
import com.yundao.common.dto.videotenant.FileHandleDto;
import com.yundao.common.dto.videotenant.VideoMessageDto;
import com.yundao.common.enums.video.VideoHandleTypeEnum;
import com.yundao.common.enums.video.VideoStatusEnum;
import com.yundao.common.model.base.VideoTenantModel;
import com.yundao.common.service.tencent.TencentService;
import com.yundao.common.service.videotenant.VideoTenantService;
import com.yundao.core.code.Result;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.service.AbstractService;
import com.yundao.core.utils.ConfigUtils;
import com.yundao.core.utils.JsonUtils;

/**
 * Function: Reason: Date: 2017年11月3日 下午3:15:54
 * 
 * @author wucq
 * @version
 */
@Service
public class TencentServiceImpl extends AbstractService implements TencentService {
	private Log logger = LogFactory.getLog(TencentServiceImpl.class);

	private QcloudApiModuleCenter moduleCenter = null;
	@Autowired
	private VideoTenantService videoTenantService;

	public TencentServiceImpl() {
		String SecretId = ConfigUtils.getValue("SecretId");
		String SecretKey = ConfigUtils.getValue("SecretKey");

		TreeMap<String, Object> vodConfig = new TreeMap<String, Object>();
		vodConfig.put(TencentConstant.KEY_SECRET_ID, SecretId);
		vodConfig.put(TencentConstant.KEY_SECRET_KEY, SecretKey);
		vodConfig.put(TencentConstant.KEY_REQUEST_METHOD, "GET");
		moduleCenter = new QcloudApiModuleCenter(new Vod(), vodConfig);
	}

	@Override
	public void clearPullEvent() throws Exception {

		String response = moduleCenter.call(TencentConstant.MODULE_GET_PULL_EVENT, null);
		VideoEventDto result = JsonUtils.jsonToObject(response, VideoEventDto.class);
		logger.info("租户ID:" + this.getHeaderTenantId() + ",调用腾讯云获取事件通知信息为：" + JsonUtils.objectToJson(result));

		if (result != null) {
			List<EventMessageDto> eventMessageDtos = result.getEventList();
			if (eventMessageDtos != null && !eventMessageDtos.isEmpty()) {
				List<String> msgHandles = new ArrayList<>();
				for (EventMessageDto messageDto : eventMessageDtos) {
					msgHandles.add(messageDto.getMsgHandle());// 待确认的消息ID
					// 确认消息已消费
					this.confirmEvent(msgHandles);
				}
			}

		}
	}

	@Override
	public VideoMessageDto getPullEvent() throws Exception {

		Set<String> transcodeFileIds = new HashSet<>();
		Set<String> uploadFileIds = new HashSet<>();
		Map<String, String> stateChangedMap = new HashMap<>();

		String response = moduleCenter.call(TencentConstant.MODULE_GET_PULL_EVENT, null);

		VideoEventDto result = JsonUtils.jsonToObject(response, VideoEventDto.class);
		logger.info("调用腾讯云获取事件通知信息为：" + JsonUtils.objectToJson(result));

		if (result != null) {
			List<EventMessageDto> eventMessageDtos = result.getEventList();
			if (eventMessageDtos != null && !eventMessageDtos.isEmpty()) {
				List<String> msgHandles = new ArrayList<>();
				for (EventMessageDto messageDto : eventMessageDtos) {
					EventMessageContentDto messageContentDto = messageDto.getEventContent();
					if (messageContentDto != null) {
						if (StringUtils.isNotBlank(messageContentDto.getEventType())
								&& (messageContentDto.getEventType().equals("TranscodeComplete")
										|| messageContentDto.getEventType().equals("NewFileUpload")
										|| messageContentDto.getEventType().equals("ProcedureStateChanged"))) {
							// 目前只处理视频转码类型的事件通知消息
							Object data = messageContentDto.getData();
							if (data == null) {
								continue;
							}
							String json = JsonUtils.objectToJson(data);

							//
							if (messageContentDto.getEventType().equals("TranscodeComplete")) {
								// 视频转码完成
								EventMessageContentDateDto contentDateDto = JsonUtils.jsonToObject(json,
										EventMessageContentDateDto.class);
								transcodeFileIds.add(contentDateDto.getFileId());// 添加转码成功后的文件Id
								msgHandles.add(messageDto.getMsgHandle());// 待确认的消息ID
							} else if (messageContentDto.getEventType().equals("NewFileUpload")) {
								// 视频上传完成
								EventUploadFileDateDto fileDateDto = JsonUtils.jsonToObject(json,
										EventUploadFileDateDto.class);
								uploadFileIds.add(fileDateDto.getFileId());// 添加转码成功后的文件Id
								msgHandles.add(messageDto.getMsgHandle());// 待确认的消息ID
							} else if (messageContentDto.getEventType().equals("ProcedureStateChanged")) {
								// 视频状态变更
								EventStateChangedDateDto stateChangedDateDto = JsonUtils.jsonToObject(json,
										EventStateChangedDateDto.class);
								if (stateChangedDateDto != null && stateChangedDateDto.getProcessTaskList() != null
										&& !stateChangedDateDto.getProcessTaskList().isEmpty()) {
									List<EventProcessTaskDto> eventProcessTaskDtos = stateChangedDateDto
											.getProcessTaskList();
									for (EventProcessTaskDto taskDto : eventProcessTaskDtos) {
										if (taskDto.getErrCode() == null || taskDto.getErrCode() != 0
												|| !taskDto.getTaskType().equals("Transcode")
												|| taskDto.getStatus() == null
												|| !taskDto.getStatus().equals("SUCCESS")) {
											continue;
										}
										stateChangedMap.put(stateChangedDateDto.getFileId(), taskDto.getStatus());
										msgHandles.add(messageDto.getMsgHandle());// 待确认的消息ID
										break;
									}
								}
							}
						} else {
							msgHandles.add(messageDto.getMsgHandle());// 待确认的消息ID
						}

					}
				}
				// 确认消息已消费
				this.confirmEvent(msgHandles);
			}
		}

		logger.info("事件通知（上传完成）处理文件ID为：" + JsonUtils.objectToJson(uploadFileIds));
		logger.info("事件通知（转码完成）处理文件ID为：" + JsonUtils.objectToJson(transcodeFileIds));
		logger.info("事件通知（状态 变更）处理文件ID为：" + JsonUtils.objectToJson(stateChangedMap));

		List<String> refFileIds = new ArrayList<>();
		if (!transcodeFileIds.isEmpty()) {
			refFileIds.addAll(transcodeFileIds);

			// 修改视频转码的状态
			List<String> refIds = new ArrayList<>(transcodeFileIds);
			videoTenantService.updateStatus(refIds, VideoStatusEnum.NORMAL.getValue());

		}
		if (!uploadFileIds.isEmpty()) {
			refFileIds.addAll(uploadFileIds);
		}
		if (!stateChangedMap.isEmpty()) {
			refFileIds.addAll(stateChangedMap.keySet());
			// 修改视频转码的状态
			List<String> refIds = new ArrayList<>(stateChangedMap.keySet());
			videoTenantService.updateStatus(refIds, VideoStatusEnum.NORMAL.getValue());
		}
		if (!refFileIds.isEmpty()) {
			Result<List<VideoTenantModel>> viResult = videoTenantService.selectByRefFileIds(refFileIds);
			if (viResult.getResult() != null && !viResult.getResult().isEmpty()) {
				VideoMessageDto videoMessageDto = new VideoMessageDto();
				List<VideoTenantModel> videoTenantModels = viResult.getResult();
				for (VideoTenantModel model : videoTenantModels) {
					if (model.getTenantId() == null || StringUtils.isBlank(model.getRefFileId())) {
						continue;
					}
					String refFileId = model.getRefFileId();
					FileHandleDto fileHandleDto = new FileHandleDto();
					fileHandleDto.setFileId(refFileId);
					if (uploadFileIds.contains(refFileId)) {
						fileHandleDto.setHandleType(VideoHandleTypeEnum.UPLOAD.getValue());
					} else if (transcodeFileIds.contains(refFileId)) {
						fileHandleDto.setHandleType(VideoHandleTypeEnum.TRANSCODE.getValue());

					} else if (stateChangedMap.containsKey(refFileId)) {
						fileHandleDto.setHandleType(VideoHandleTypeEnum.TRANSCODE.getValue());
					} else {
						logger.info("腾讯云视频ID为：" + refFileId + ",数据有误，请核对！");
						continue;
					}

					Map<Long, List<FileHandleDto>> messageMap = videoMessageDto.getTenantVideoMap();
					if (messageMap.containsKey(model.getTenantId())) {
						List<FileHandleDto> fileHandleDtos = messageMap.get(model.getTenantId());
						fileHandleDtos.add(fileHandleDto);
					} else {
						List<FileHandleDto> fileHandleDtos = new ArrayList<>();
						fileHandleDtos.add(fileHandleDto);
						messageMap.put(model.getTenantId(), fileHandleDtos);
					}

				}

				logger.info("拉取腾讯视频，待处理的文件信息为：" + JsonUtils.objectToJson(videoMessageDto));

				return videoMessageDto;
			}
		}

		return null;

	}

	private Map<String, Object> confirmEvent(List<String> msgHandles) throws Exception {
		if (msgHandles == null || msgHandles.isEmpty()) {
			return null;
		}
		logger.info("消息确认msgHandles为：" + JsonUtils.objectToJson(msgHandles));
		TreeMap<String, Object> params = new TreeMap<String, Object>();
		if (msgHandles != null && !msgHandles.isEmpty()) {
			for (int i = 0; i < msgHandles.size(); i++) {
				String msgHandleKey = "msgHandle." + i;
				params.put(msgHandleKey, msgHandles.get(i));
			}
		}
		Map<String, Object> result = null;
		String response = moduleCenter.call(TencentConstant.MODULE_CONFIRM_EVENT, params);
		result = JsonUtils.jsonToObject(response, Map.class);
		return result;
	}

}
