package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;

public class VideoTenantModel extends BaseModel implements Serializable {
    /**
	 * 腾讯所对应的视频ID
	 */
    private String refFileId;

    /**
	 * 视频类型，1：路演
	 */
    private Integer type;

    /**
	 * 状态 0:压缩中 1：压缩完成
	 */
    private Integer status;

    private static final long serialVersionUID = 1L;

    public String getRefFileId() {
        return refFileId;
    }

    public void setRefFileId(String refFileId) {
        this.refFileId = refFileId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}