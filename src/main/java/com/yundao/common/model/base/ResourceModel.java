package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;

public class ResourceModel extends BaseModel implements Serializable {
    /**
	 * 系统编码
	 */
    private String systemCode;

    /**
	 * code值，比如100000011000000000
	 */
    private String code;

    /**
	 * 父id
	 */
    private Long parentId;

    /**
	 * 名字
	 */
    private String name;

    /**
	 * 链接
	 */
    private String url;

    /**
	 * 是否共用，0：否，1：是
	 */
    private Integer isShare;

    /**
	 * 是否菜单，0：否，1：是
	 */
    private Integer isMenu;

    /**
	 * 是否显示
	 */
    private Integer isDeplay;

    /**
	 * 描述
	 */
    private String description;

    /**
	 * 排序，越小越靠前
	 */
    private Integer sequence;

    private static final long serialVersionUID = 1L;

    public String getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(String systemCode) {
        this.systemCode = systemCode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getIsShare() {
        return isShare;
    }

    public void setIsShare(Integer isShare) {
        this.isShare = isShare;
    }

    public Integer getIsMenu() {
        return isMenu;
    }

    public void setIsMenu(Integer isMenu) {
        this.isMenu = isMenu;
    }

    public Integer getIsDeplay() {
        return isDeplay;
    }

    public void setIsDeplay(Integer isDeplay) {
        this.isDeplay = isDeplay;
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