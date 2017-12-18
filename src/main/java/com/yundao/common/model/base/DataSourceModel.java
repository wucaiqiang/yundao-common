package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;

public class DataSourceModel extends BaseModel implements Serializable {
    /**
	 * 系统编码
	 */
    private String systemCode;

    /**
	 * 名字
	 */
    private String name;

    /**
	 * 驱动类名
	 */
    private String driverClassName;

    /**
	 * 数据库链接（加密）
	 */
    private String url;

    /**
	 * 用户名（加密）
	 */
    private String username;

    /**
	 * 密码（加密）
	 */
    private String password;

    private static final long serialVersionUID = 1L;

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

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}