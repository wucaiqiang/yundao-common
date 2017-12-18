package com.yundao.common.constant.url;

import com.yundao.common.enums.UrlEnum;
import com.yundao.core.utils.ConfigUtils;

/**
 * 调用 基础服务的URL地址常量
 *
 * @author jan
 * @create 2017-06-21 PM8:13
 **/
public interface BaseUrlConstant {

    /**
     * HOST地址
     */
    String BASE_URL = ConfigUtils.getValue(UrlEnum.Base_URL.getKey());

    /**
     * 发送短信
     */
    String SEND_SMS = BASE_URL + "/sms/send";

    /**
     * 获取文件
     */
    String GET_CLOUD_FILE_BY_ID  =  BASE_URL + "/cloudfile/get";
}
