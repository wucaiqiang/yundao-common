

package com.yundao.common.dto.tenant;

import java.util.Date;

import io.swagger.annotations.ApiModelProperty;

/**
 * Function: 
 * Reason:	  
 * Date:     2017年10月11日 下午5:42:39 
 * @author   欧阳利
 * @version   
 */
public class TenantDomainDto {
	@ApiModelProperty("域名链接")
    private String url;
	
	@ApiModelProperty("域名注册日期")
	private Date registerDate;
	
	@ApiModelProperty("域名到期时间")
	private Date expireDate;
	
	@ApiModelProperty("域名类型")
	private String type;

	public String getUrl() {
	
		return url;
	}

	public void setUrl(String url) {
	
		this.url = url;
	}

	public Date getRegisterDate() {
	
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
	
		this.registerDate = registerDate;
	}

	public Date getExpireDate() {
	
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
	
		this.expireDate = expireDate;
	}

	public String getType() {
	
		return type;
	}

	public void setType(String type) {
	
		this.type = type;
	}


	
}

