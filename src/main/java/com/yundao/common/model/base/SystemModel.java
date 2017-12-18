package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;

public class SystemModel extends BaseModel implements Serializable {
    /**
	 * 名字
	 */
    private String name;

    /**
	 * 编码
	 */
    private String code;

    /**
	 * 描述
	 */
    private String description;

    /**
	 * 排序，越小越靠前
	 */
    private Integer sequence;

    private static final long serialVersionUID = 1L;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }
}