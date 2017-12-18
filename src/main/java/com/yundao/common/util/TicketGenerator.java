
package com.yundao.common.util;

import org.apache.commons.lang3.StringUtils;

import com.yundao.core.utils.UUIDUtils;

/**
 * Function: Reason: Date: 2017年7月15日 下午7:45:27
 * 
 * @author wucq
 * @version
 */
public class TicketGenerator {
	
	private static volatile int sequence = 1;
	public static String generateTicket(String prefix,String suffix) {
		synchronized (TicketGenerator.class) {
			StringBuilder buider = new StringBuilder();
			if (StringUtils.isBlank(prefix)) {
				buider.append("TGT-");
			}else{
				buider.append(prefix+"-");
			}
			buider.append((sequence++) + "-");
			if (sequence > 1000) {
				sequence = 1;
			}
			String uuid=UUIDUtils.getUUID();
			buider.append(uuid);
			buider.append("-"+suffix);
			if(StringUtils.isBlank(suffix)){
				buider.append("cas.yundao.com");
			}
			return buider.toString();
		}
	}
}
