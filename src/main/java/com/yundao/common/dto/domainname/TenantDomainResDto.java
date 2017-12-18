package com.yundao.common.dto.domainname;

/**
 * 租户域名dto
 *
 * @author jan
 * @create 2017-07-21 AM10:56
 **/
public class TenantDomainResDto {

    /**
     * 租户id
     */
    private Long id;

    /**
     * 域名链接
     */
    private String url;


    /**
     * 租户名字
     */
    private String name;

    /**
     * 租户编码
     */
    private String code;

    /**
     * 租户类型
     */
    private Integer type;

    /**
     * 系统编码
     */
    private String systemCode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(String systemCode) {
        this.systemCode = systemCode;
    }

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
