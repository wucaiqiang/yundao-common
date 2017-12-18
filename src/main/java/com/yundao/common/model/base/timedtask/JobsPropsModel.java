package com.yundao.common.model.base.timedtask;

import java.io.Serializable;

import com.yundao.core.base.model.BaseModel;
import com.yundao.core.validator.length.Length;

/**
 * 任务类属性值
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public class JobsPropsModel extends BaseModel implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 任务主键
     */
    private Long jobsId;

    /**
     * 属性名
     */
    @Length(min = 1, max = 64, message = "{" + 8015 + "}")
    private String propName;

    /**
     * 属性值
     */
    @Length(min = 1, max = 512, message = "{" + 8016 + "}")
    private String propValue;

    /**
     * 状态，0：无效，1：有效
     */
    private int status;

    
    public Long getJobsId() {
		return jobsId;
	}

	public void setJobsId(Long jobsId) {
		this.jobsId = jobsId;
	}

	public String getPropName() {
        return propName;
    }

    public void setPropName(String propName) {
        this.propName = propName;
    }

    public String getPropValue() {
        return propValue;
    }

    public void setPropValue(String propValue) {
        this.propValue = propValue;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
