package com.yundao.common.constant.url;

import com.yundao.common.enums.UrlEnum;
import com.yundao.core.utils.ConfigUtils;

/**
 * 调用 基础服务的URL地址常量
 *
 * @author jan
 * @create 2017-06-21 PM8:13
 **/
public interface WorkFlowUrlConstant {

    /**
     * HOST地址
     */
    String BASE_URL = ConfigUtils.getValue(UrlEnum.WORKFLOW_URL.getKey());

    
    /**
     * 测试接口
     */
    String TEST =  BASE_URL + "/test";

}
