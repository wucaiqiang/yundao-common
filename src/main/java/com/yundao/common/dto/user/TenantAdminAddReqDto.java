

package com.yundao.common.dto.user;

import io.swagger.annotations.ApiModelProperty;

/**
 * Function: 
 * Reason:	  
 * Date:     2017年9月13日 上午10:48:38 
 * @author   欧阳利
 * @version   
 */
public class TenantAdminAddReqDto {
	@ApiModelProperty("手机号码")
    private String mobile;
    
	@ApiModelProperty("租户id")
    private Long tenantId;
    
	@ApiModelProperty("管理员姓名")
    private String realname;
	
	@ApiModelProperty("管理员姓名")
	private String password;

	public String getPassword() {
	
		return password;
	}

	public void setPassword(String password) {
	
		this.password = password;
	}

	public String getMobile() {
	
		return mobile;
	}

	public void setMobile(String mobile) {
	
		this.mobile = mobile;
	}

	public Long getTenantId() {
	
		return tenantId;
	}

	public void setTenantId(Long tenantId) {
	
		this.tenantId = tenantId;
	}

	public String getRealname() {
	
		return realname;
	}

	public void setRealname(String realname) {
	
		this.realname = realname;
	}
	
}

