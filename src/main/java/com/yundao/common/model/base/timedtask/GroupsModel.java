package com.yundao.common.model.base.timedtask;

import java.io.Serializable;

import com.yundao.core.base.model.BaseModel;
import com.yundao.core.validator.length.Length;
import com.yundao.core.validator.number.Numbers;

/**
 * 任务组或触发器组
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public class GroupsModel extends BaseModel implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 编码
     */
    @Length(min = 1, max = 32, message = "{" + 8009 + "}")
    private String code;

    /**
     * 名称
     */
    @Length(min = 1, max = 64, message = "{" + 8010 + "}")
    private String name;

    /**
     * 描述
     */
    @Length(isBlank = true, min = 1, max = 128, message = "{" + 8011 + "}")
    private String description;

    /**
     * 状态，0：无效，1：有效
     */
    @Numbers(message = "{" + 8012 + "}")
    private Integer status;

    /**
     * 类型，0：触发器组，1：任务组
     */
    @Numbers(message = "{" + 8013 + "}")
    private Integer type;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

}
