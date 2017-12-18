package com.yundao.common.model.base.timedtask;

import java.io.Serializable;
import java.util.Date;

import com.yundao.core.base.model.BaseModel;
import com.yundao.core.validator.length.Length;

/**
 * 触发器
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public class TriggersModel extends BaseModel implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 编码
     */
    @Length(min = 1, max = 32, message = "{" +8009 + "}")
    private String code;

    /**
     * 名称
     */
    @Length(min = 1, max = 64, message = "{" + 8010 + "}")
    private String name;

    /**
     * 正则表达式
     */
    @Length(isBlank = true, min = 1, max = 64, message = "{" + 8014 + "}")
    private String cronExpression;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 重复次数
     */
    private Integer repeatNumber;

    /**
     * 重复间隔
     */
    private Integer repeatInterval;

    /**
     * 描述
     */
    @Length(isBlank = true, min = 1, max = 128, message = "{" + 8011 + "}")
    private String description;

    /**
     * 状态，0：无效，1：有效
     */
    private int status;

    /**
     * 触发器组主键
     */
    private Long triggerGroupId;

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

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
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

    public Integer getRepeatNumber() {
        return repeatNumber;
    }

    public void setRepeatNumber(Integer repeatNumber) {
        this.repeatNumber = repeatNumber;
    }

    public Integer getRepeatInterval() {
        return repeatInterval;
    }

    public void setRepeatInterval(Integer repeatInterval) {
        this.repeatInterval = repeatInterval;
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

	public Long getTriggerGroupId() {
		return triggerGroupId;
	}

	public void setTriggerGroupId(Long triggerGroupId) {
		this.triggerGroupId = triggerGroupId;
	}


}
