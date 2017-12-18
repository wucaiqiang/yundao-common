package com.yundao.common.constant.url;

import com.yundao.common.enums.UrlEnum;
import com.yundao.core.utils.ConfigUtils;

/**
 * 调用 基础服务的URL地址常量
 *
 * @author jan
 * @create 2017-06-21 PM8:13
 **/
public interface TenantUrlConstant {

    /**
     * HOST地址
     */
    String BASE_URL = ConfigUtils.getValue(UrlEnum.TENANT_URL.getKey());

    /**
     * 添加租户的系统管理员
     */
    String ADD_TENANT_SYSTEM_ADMIN = BASE_URL + "/user/add/system/admin";
    
    
    /**
     * 调用租户接口完成租户数据库表创建，数据初始化，流程部署
     */
    String INIT_TENANT_SYSTEM_DB_AND_DATA = BASE_URL + "/user/init";
    String VIDEO_FILE_HANDLE = BASE_URL + "/video/file_handle";
    
    /**
     * 测试接口
     */
    String TEST =  BASE_URL + "/test";

}
