package com.yundao.common.dto.timedtask.job;

import java.io.Serializable;

import com.yundao.core.validator.length.Length;

import io.swagger.annotations.ApiModelProperty;

/**
 * 任务请求传输类
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public class JobReqDto implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编码
     */
    @Length(min = 1, max = 64, message = "{" + 8009 + "}")
    @ApiModelProperty("编码")
    private String code;

    /**
     * 任务名称
     */
    @Length(min = 1, max = 64, message = "{" + 8010 + "}")
    @ApiModelProperty("任务名称")
    private String name;

    /**
     * 触发规则
     */
    @Length(isBlank = true, min = 1, max = 64, message = "{" + 8018 + "}")
    @ApiModelProperty("触发规则")
    private String cronExpression;

    /**
     * 请求链接
     */
    @Length(min = 1, max = 512, message = "{" + 8023 + "}")
    @ApiModelProperty("请求链接")
    private String url;

    /**
     * 任务json参数
     */
    @Length(isBlank = true, min = 1, max = 512, message = "{" + 8023 + "}")
    @ApiModelProperty("任务json参数")
    private String json;

    /**
     * 开始时间
     */
    @ApiModelProperty("开始时间")
    private String startTime;

    /**
     * 结束时间
     */
    @ApiModelProperty("结束时间")
    private String endTime;

    /**
     * 重复次数
     */
    @ApiModelProperty("重复次数")
    private Integer repeatNumber;

    /**
     * 重复间隔
     */
    @ApiModelProperty("重复间隔")
    private Integer repeatInterval;

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
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
}
