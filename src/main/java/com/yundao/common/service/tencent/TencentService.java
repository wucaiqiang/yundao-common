
package com.yundao.common.service.tencent;

import com.yundao.common.dto.videotenant.VideoMessageDto;

/**
 * Function: Reason: Date: 2017年11月3日 下午3:11:26
 * 
 * @author wucq
 * @version
 */
public interface TencentService {
	/**
	 * 拉取转码成功后的通知消息信息
	 * getPullEvent:
	 * @author: wucq
	 * @return 文件ID集合
	 * @throws Exception
	 * @description:
	 */
	public VideoMessageDto getPullEvent() throws Exception;
	public void clearPullEvent() throws Exception;
}
