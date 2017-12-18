package com.yundao.common.enums;

/**
 * Created by gjl on 2017/6/26.
 */
public enum EnabledStatusEnum {
    ENABLED(1),
    CLEAR_ENABLED(0);

    EnabledStatusEnum(Integer status) {
        this.status = status;
    }

    private Integer status;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
