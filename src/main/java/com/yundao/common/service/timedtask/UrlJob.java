package com.yundao.common.service.timedtask;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.PersistJobDataAfterExecution;

import com.yundao.common.model.base.TenantModel;
import com.yundao.common.service.SpringContextHolder;
import com.yundao.common.service.tenant.TenantService;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.constant.HeaderConstant;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.threadlocal.filter.RequestCommonParams;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.HttpUtils;
import com.yundao.core.utils.JsonUtils;
import com.yundao.core.utils.MapUtils;
import com.yundao.core.utils.ThreadUtils;

/**
 * 执行链接
 *
 * @author 欧阳利
 * 2017年8月17日
 */
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class UrlJob implements Job{

    
    private static Log log = LogFactory.getLog(UrlJob.class);
    
    @SuppressWarnings("unchecked")
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        JobDataMap dataMap = context.getMergedJobDataMap();
        String url = dataMap.getString("url");

        // 方法参数
        Map<String, String> methodParams = null;
        int index = url.indexOf(CommonConstant.QUESTION);
        if (index != -1) {
            methodParams = MapUtils.toMap(url.substring(index + 1));
            url = url.substring(0, index);
        }
        
        TenantService tenantService = SpringContextHolder.getBean(TenantService.class);

        // 构建请求参数对象
        final RequestCommonParams requestParams = RequestCommonParams.newDefault(methodParams);

        // 头部参数
        String headerParamsJson = dataMap.getString("headerParams");
        if (BooleanUtils.isNotBlank(headerParamsJson)) {
            Map<String, String> headerParams = JsonUtils.jsonToObject(headerParamsJson, Map.class);
            requestParams.setHeaderParams(headerParams);
        }
        // 调用方法
        final String invokeUrl = url;
        final String method = dataMap.getString("method");
        
        // 异步调用链接
        log.info("调试调用接口："+url);
        ThreadUtils.execute(() -> {
            try {
            	if(isCallTenant(invokeUrl)){
            		callTenant(tenantService, requestParams, invokeUrl,  method);
            	}else{
            		callSCM(tenantService, requestParams, invokeUrl,  method);
            	}
            	
            }
            catch (Exception e) {
                log.error("调用链接时异常", e);
            }
        });
    }

    
    private static boolean isCallTenant(String url){
    	return url.contains(":8202");
    }
    
    
    private static void callSCM(TenantService tenantService,RequestCommonParams requestParams,String invokeUrl, String method) throws Exception{
    	log.info("定时任务开始调用scm接口");
    	Map<String, String> headerParams = requestParams.getHeaderParams();
        headerParams.putAll(getHeaderParams(-1l));
        requestParams.setHeaderParams(headerParams);
        log.info("调用参数methodParams=" + requestParams.getMethodParams() + ",headerParamsJson=" + requestParams.getHeaderParams() + ",method=" + method+",url="+invokeUrl);
        if (CommonConstant.POSTMETHOD.equalsIgnoreCase(method)) {
            HttpUtils.post(invokeUrl, requestParams);
        }
        else {
            HttpUtils.get(invokeUrl, requestParams);
        }
    }
    
    
    
    /**
     * 调用租户接口
     * callTenant:
     * @author: 欧阳利
     * @param tenantService
     * @param requestParams
     * @param invokeUrl
     * @param method
     * @throws Exception
     * @description:
     */
    private static void callTenant(TenantService tenantService,RequestCommonParams requestParams,String invokeUrl, String method) throws Exception{
    	log.info("定时任务开始调用租户接口");
    	List<TenantModel> list = tenantService.getEnableList();
    	if(BooleanUtils.isEmpty(list)){
    		log.error("系统异常,没有可用的租户");
    		return;
    	}
    	for(TenantModel model : list){
            Map<String, String> headerParams = requestParams.getHeaderParams();
            headerParams.putAll(getHeaderParams(model.getId()));
            requestParams.setHeaderParams(headerParams);
            log.info("调用参数methodParams=" + requestParams.getMethodParams() + ",headerParamsJson=" + requestParams.getHeaderParams() + ",method=" + method+",url="+invokeUrl);
            if (CommonConstant.POSTMETHOD.equalsIgnoreCase(method)) {
                HttpUtils.post(invokeUrl, requestParams);
            }
            else {
                HttpUtils.get(invokeUrl, requestParams);
            }
    	}
    }
    
    
    /**
     * 获取头部参数
     *
     * @return 头部参数
     */
    public static Map<String, String> getHeaderParams(Long tenandId) {
        Map<String, String> result = new HashMap<>();
        result.put(HeaderConstant.HEADER_USER_ID, "-1");
        result.put(HeaderConstant.HEADER_TENANT_ID, tenandId.toString());
        result.put(HeaderConstant.HEADER_REAL_NAME, "admin");
        result.put(HeaderConstant.HEADER_APP_TYPE, "pc");
        return result;
    }
}
