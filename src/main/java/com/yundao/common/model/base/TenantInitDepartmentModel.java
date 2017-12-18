package com.yundao.common.model.base;

import com.yundao.core.base.model.BaseModel;
import java.io.Serializable;

public class TenantInitDepartmentModel extends BaseModel implements Serializable {
    /**
	 * 系统编码
	 */
    private String systemCode;

    /**
	 * 租户类型
	 */
    private Integer tenantType;

    /**
	 * 部门id
	 */
    private Long departmentId;

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

    public Integer getTenantType() {
        return tenantType;
    }

    public void setTenantType(Integer tenantType) {
        this.tenantType = tenantType;
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
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