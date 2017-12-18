package com.yundao.common.dto.sms;


import com.yundao.core.utils.JsonUtils;

import java.io.Serializable;
import java.util.Map;

/**
 * 短信模版dto
 *
 * @author jan
 * @create 2017-06-18 PM7:29
 **/
public class SmsTemplateDto implements Serializable{

    
	 /**
	 * serialVersionUID:
	 */
	private static final long serialVersionUID = 1L;

	/**
     * 模版编码
     */
    private String code;
    /**
     * 模板类型
     */
    private String smsType;

    /**
     * 模版参数
     */
    private Map<String, String> params;

    /**
     * 模板参数，不需要赋值
     */
    private String templateParma;
    /**
     * 手机号码，多个逗号分开
     */
    private String mobiles;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Map<String, String> getParams() {
        return params;
    }

    public void setParams(Map<String, String> params) {
        this.params = params;
    }

    public String getTemplateParma() {
        if (params != null)
            this.templateParma = JsonUtils.objectToJson(this.params);
        return templateParma;
    }

	public String getMobiles() {
	
		return mobiles;
	}

	public void setMobiles(String mobiles) {
	
		this.mobiles = mobiles;
	}

	public String getSmsType() {
	
		return smsType;
	}

	public void setSmsType(String smsType) {
	
		this.smsType = smsType;
	}
    
}
