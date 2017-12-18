
package com.yundao.common.dto.videotenant;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Function: Reason: Date: 2017年11月16日 下午3:13:02
 * 
 * @author wucq
 * @version
 */
public class VideoMessageDto implements Serializable {

	/**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * key:租户ID，value：待处理的文件
	 */
	private Map<Long, List<FileHandleDto>> tenantVideoMap;

	public Map<Long, List<FileHandleDto>> getTenantVideoMap() {
		if (tenantVideoMap == null) {
			this.tenantVideoMap = new HashMap<>();
		}
		return tenantVideoMap;
	}

	public void setTenantVideoMap(Map<Long, List<FileHandleDto>> tenantVideoMap) {

		this.tenantVideoMap = tenantVideoMap;
	}

}
