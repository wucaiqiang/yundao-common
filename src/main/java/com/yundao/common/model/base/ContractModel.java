package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;
import java.util.Date;

public class ContractModel extends BaseModel implements Serializable {
    /**
	 * 系统编码
	 */
    private String systemCode;

    /**
	 * 名字
	 */
    private String name;

    /**
	 * 流水号
	 */
    private String serialNumber;

    /**
	 * 开始日期
	 */
    private Date beginDate;

    /**
	 * 到期日期
	 */
    private Date expireDate;

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

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }
}