package com.yundao.common.model.base.timedtask;

import java.io.Serializable;
import java.util.Date;

import com.yundao.core.base.model.BaseModel;
import com.yundao.core.validator.length.Length;

/**
 * 任务
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public class JobsModel extends BaseModel  implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 编码
     */
    @Length(min = 1, max = 16, message = "{" + 8009 + "}")
    private String code;

    /**
     * 任务名称
     */
    @Length(min = 1, max = 64, message = "{" + 8010 + "}")
    private String name;

    /**
     * 工作组主键
     */
    private Long jobGroupId;

    /**
     * 触发器组主键
     */
    private Long triggerGroupId;

    /**
     * 任务类
     */
    @Length(min = 1, max = 256, message = "{" + 8017 + "}")
    private String jobClass;

    /**
     * 描述
     */
    @Length(min = 1, max = 128, message = "{" + 8011 + "}")
    private String description;

    /**
     * 状态，0：无效，1：有效
     */
    private int status;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



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

	public String getJobClass() {
        return jobClass;
    }

    public void setJobClass(String jobClass) {
        this.jobClass = jobClass;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
