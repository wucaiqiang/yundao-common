package com.yundao.common.enums;

/**
 * URL枚举
 *
 * @author jan
 * @create 2017-06-21 PM8:09
 **/
public enum UrlEnum {
	  /**
     * 基础服务
     */
    Base_URL("base.url"),
    /**
     * 工作流服务 
     */
    WORKFLOW_URL("workflow.url"),
    /**
     * 租户服务 
     */
    TENANT_URL("tenant.url");

    private String key;

    private UrlEnum(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }
}
