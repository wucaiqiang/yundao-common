
package com.yundao.common.dto.tencent;

import java.io.Serializable;
import java.util.List;

import io.swagger.models.auth.In;

/**
 * Function: Reason: Date: 2017年11月3日 下午3:32:59
 * 
 * @author wucq
 * @version
 */
public class EventProcessTaskDto implements Serializable {

	/**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 错误码。 0: 成功, 其他值: 失败,其中30009为原文件异常失败；30010为系统失败或未知
	 */
	private Integer errCode;
	private String message;
	/**
	 * 任务状态，有PROCESSING，SUCCESS，FAIL三种
	 */
	private String status;
	/**
	 * 任务类型，固定为Transcode
	 */
	private String taskType;


	public Integer getErrCode() {
	
		return errCode;
	}

	public void setErrCode(Integer errCode) {
	
		this.errCode = errCode;
	}

	public String getMessage() {

		return message;
	}

	public void setMessage(String message) {

		this.message = message;
	}

	public String getStatus() {

		return status;
	}

	public void setStatus(String status) {

		this.status = status;
	}

	public String getTaskType() {

		return taskType;
	}

	public void setTaskType(String taskType) {

		this.taskType = taskType;
	}

}
