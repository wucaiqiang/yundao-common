package com.yundao.common.dto.user;

/**
 * 租户简单信息
 * 
 * @author 欧阳利
 * 2017年7月13日
 */
public class TenantSimpleDto {
    private Long id;
    
    private String name;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
}
