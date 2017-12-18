package com.yundao.common.listener;

import com.yundao.common.service.timedtask.JobsService;
import com.yundao.common.service.timedtask.SchedulerService;
import com.yundao.core.listener.SystemListener;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;

/**
 * 任务监听类
 *
 * @author wupengfei wupf86@126.com
 */
public class JobListener extends SystemListener {

    private static Log log = LogFactory.getLog(SystemListener.class);

    @Override
    protected void subclassInit() {
        try {
            this.startup();
        }
        catch (Exception e) {
            log.error("增加任务时异常", e);
        }
    }

    protected void startup() throws Exception {
        JobsService jobsService = getBean("jobsServiceImpl", JobsService.class);
        SchedulerService schedulerService = getBean("schedulerServiceImpl", SchedulerService.class);
        schedulerService.addValidJob(false);
    }

}
