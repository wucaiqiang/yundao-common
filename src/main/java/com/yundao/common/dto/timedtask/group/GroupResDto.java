package com.yundao.common.dto.timedtask.group;

import java.io.Serializable;

/**
 * 组返回传输类
 *
  * @author 欧阳利
 * 2017年8月17日
 */
public class GroupResDto implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 任务组id
     */
    private Long jobGroupId;

    /**
     * 触发器组id
     */
    private Long triggerGroupId;

	public Long getJobGroupId() {
		return jobGroupId;
	}

	public void setJobGroupId(Long jobGroupId) {
		this.jobGroupId = jobGroupId;
	}

	public Long getTriggerGroupId() {
		return triggerGroupId;
	}

	public void setTriggerGroupId(Long triggerGroupId) {
		this.triggerGroupId = triggerGroupId;
	}

}
