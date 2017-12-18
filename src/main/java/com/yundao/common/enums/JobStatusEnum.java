package com.yundao.common.enums;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * 任务状态枚举
 * 
 * @author wupengfei wupf86@126.com
 *
 */
public enum JobStatusEnum {

	/**
	 * 无效
	 */
	STATUS_0(0),

	/**
	 * 有效
	 */
	STATUS_1(1),

	/**
	 * 删除
	 */
	STATUS_2(2);

	private Integer value;
	private static Map<Integer, JobStatusEnum> enumMap = new HashMap<Integer, JobStatusEnum>();

	static {
		EnumSet<JobStatusEnum> set = EnumSet.allOf(JobStatusEnum.class);
		for (JobStatusEnum each : set) {
			enumMap.put(each.getValue(), each);
		}
	}

	private JobStatusEnum(Integer value) {
		this.value = value;
	}

	public Integer getValue() {
		return value;
	}

	/**
	 * 获取状态枚举
	 * 
	 * @param value
	 * @return
	 */
	public static JobStatusEnum getJobStatusEnum(Integer value) {
		return enumMap.get(value);
	}

	/**
	 * 是否是有效的状态
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isValidStatus(Integer value) {
		return value != null && value == STATUS_1.getValue().intValue();
	}
}
