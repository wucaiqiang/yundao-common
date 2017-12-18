
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
public class EventStateChangedDateDto implements Serializable {

	/**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = 1L;
	private String errCode;
	private String message;
	/**
	 * 文件ID
	 */
	private String fileId;
	/**
	 * 任务流包含的任务列表
	 */
	private List<EventProcessTaskDto> processTaskList;

	public String getErrCode() {

		return errCode;
	}

	public void setErrCode(String errCode) {

		this.errCode = errCode;
	}

	public String getMessage() {

		return message;
	}

	public void setMessage(String message) {

		this.message = message;
	}

	public String getFileId() {

		return fileId;
	}

	public void setFileId(String fileId) {

		this.fileId = fileId;
	}

	public List<EventProcessTaskDto> getProcessTaskList() {

		return processTaskList;
	}

	public void setProcessTaskList(List<EventProcessTaskDto> processTaskList) {

		this.processTaskList = processTaskList;
	}

}
