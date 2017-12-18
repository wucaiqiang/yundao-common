
package com.yundao.common.dto.videotenant;

import java.util.Date;

import javax.validation.constraints.NotNull;

import com.yundao.common.constant.CodeConstant;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import io.swagger.annotations.ApiModelProperty;
import com.yundao.core.validator.number.Number;

public class VideoTenantReqDto {
	private static final long serialVersionUID = 1L;
	@ApiModelProperty(value = "新增不需要传")
	@Number(isBlank = false, message = "{" + CommonCode.COMMON_1079 + "}", groups = { Update.class })
	private Long id;

	@ApiModelProperty(value = "腾讯所对应的视频ID")
	@NotNull(message = "{" + CodeConstant.CODE_1000065 + "}")
	private String refFileId;

	@ApiModelProperty(value = "租户ID")
	private Integer tenantId;

	@ApiModelProperty(value = "视频类型，1：路演")
	@NotNull(message = "{" + CodeConstant.CODE_1000066 + "}")
	private Integer type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRefFileId() {
		return refFileId;
	}

	public void setRefFileId(String refFileId) {
		this.refFileId = refFileId;
	}

	public Integer getTenantId() {
		return tenantId;
	}

	public void setTenantId(Integer tenantId) {
		this.tenantId = tenantId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
