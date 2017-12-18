package com.yundao.common.service.timedtask.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.ClassUtils;
import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Sets;
import com.yundao.common.enums.JobStatusEnum;
import com.yundao.common.model.base.timedtask.GroupsModel;
import com.yundao.common.model.base.timedtask.JobsModel;
import com.yundao.common.model.base.timedtask.JobsPropsModel;
import com.yundao.common.model.base.timedtask.TriggersModel;
import com.yundao.common.service.timedtask.GroupsService;
import com.yundao.common.service.timedtask.JobsPropsService;
import com.yundao.common.service.timedtask.JobsService;
import com.yundao.common.service.timedtask.SchedulerService;
import com.yundao.common.service.timedtask.TriggersService;
import com.yundao.core.code.Result;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.code.config.TTCode;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.utils.BooleanUtils;

/**
 * 调度任务服务类
 *
 * @author 欧阳利
 * 2017年8月17日
 */
@Service
public class SchedulerServiceImpl implements SchedulerService {

    private static Log log = LogFactory.getLog(SchedulerServiceImpl.class);

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private GroupsService groupsService;

    @Autowired
    private TriggersService triggersService;

    @Autowired
    private JobsService jobsService;

    @Autowired
    private JobsPropsService jobsPropsService;

    @Override
    public Result<Boolean> addJob(Long jobId) throws BaseException {
        JobsModel jobs = this.getJobsModel(jobId);
        return this.addJob(jobs);
    }

    @Override
    public Result<Boolean> addValidJob(boolean existReturn) throws BaseException {
        log.begin("开始增加有效的任务", existReturn);

        Result<List<JobsModel>> jobsResult = jobsService.getValid();
        List<JobsModel> jobsList = jobsResult.getResult();
        int size = (jobsList != null) ? jobsList.size() : 0;
        for (int i = 0; i < size; i++) {
            JobsModel each = jobsList.get(i);
            log.info("开始增加任务name=" + each.getName());

            // 校验任务是否已存在
            boolean isExist = existReturn && checkExist(each);
            if (isExist) {
                log.info("任务已存在");
                continue;
            }
            addJob(each);
        }
        return Result.newSuccessResult(true);
    }

    @Override
    public Result<Boolean> doPauseJob(Long jobId) throws BaseException {
        log.info("暂停任务jobId=" + jobId);

        JobsModel jobs = this.getJobsModel(jobId);
        JobKey jobKey = this.getJobKey(jobs);
        try {
            scheduler.pauseJob(jobKey);
        }
        catch (Exception e) {
            log.error("暂停任务时异常", e);
            throw new BaseException(TTCode.TT_8004);
        }
        return Result.newSuccessResult(true);
    }

    @Override
    public Result<Boolean> doResumeJob(Long jobId) throws BaseException {
        log.info("恢复任务jobId=" + jobId);

        JobsModel jobs = this.getJobsModel(jobId);
        this.validateJob(jobs);
        JobKey jobKey = this.getJobKey(jobs);
        try {
            scheduler.resumeJob(jobKey);
        }
        catch (Exception e) {
            log.error("恢复任务时异常", e);
            throw new BaseException(TTCode.TT_8005);
        }
        return Result.newSuccessResult(true);
    }

    @Override
    public Result<Boolean> doDeleteJob(Long jobId) throws BaseException {
        log.info("删除任务jobId=" + jobId);

        JobsModel jobs = this.getJobsModel(jobId);
        return deleteJob(jobs);
    }

    @Override
    public Result<Boolean> doDeleteExpireJob() throws BaseException {
        Result<List<JobsModel>> expireListResult = jobsService.getExpire();
        List<JobsModel> expireList = expireListResult.getResult();
        int size = expireList != null ? expireList.size() : 0;
        for (int i = 0; i < size; i++) {
            deleteJob(expireList.get(i));
        }
        return Result.newSuccessResult(true);
    }

    @Override
    public Result<Boolean> doStart() throws BaseException {
        log.info("启动任务");
        try {
            scheduler.start();
        }
        catch (SchedulerException e) {
            log.error("启动任务时异常", e);
            throw new BaseException(TTCode.TT_8003);
        }
        return Result.newSuccessResult(true);
    }

    @Override
    public Result<Boolean> isStarted() throws BaseException {
        log.info("是否已启动任务");
        try {
            boolean result = scheduler.isStarted();
            return Result.newSuccessResult(result);
        }
        catch (SchedulerException e) {
            log.error("是否已启动任务时异常", e);
            throw new BaseException(CommonCode.COMMON_1007);
        }
    }

    @Override
    public Result<Boolean> doShutdown(boolean waitForJobsToComplete) throws BaseException {
        log.info("关闭任务");
        try {
            if (!scheduler.isShutdown()) {
                scheduler.shutdown(waitForJobsToComplete);
            }
        }
        catch (SchedulerException e) {
            log.error("关闭任务时异常", e);
            throw new BaseException(TTCode.TT_8007);
        }
        return Result.newSuccessResult(true);
    }

    private JobsModel getJobsModel(Long jobId) throws BaseException {
        Result<JobsModel> jobResult = jobsService.getById(jobId);
        JobsModel result = jobResult.getResult();
        if (result == null) {
            log.info("任务id有误jobId=" + jobId);
            throw new BaseException(CommonCode.COMMON_1003);
        }
        return result;
    }

    private void validateJob(JobsModel job) throws BaseException {
        if (job == null) {
            log.info("任务有误");
            throw new BaseException(CommonCode.COMMON_1003);
        }
        boolean isValid = JobStatusEnum.isValidStatus(job.getStatus());
        if (!isValid) {
            log.info("任务状态有误");
            throw new BaseException(CommonCode.COMMON_1048);
        }
    }

    private boolean checkExist(JobsModel job) throws BaseException {
        try {
            JobKey jobKey = getJobKey(job);
            return scheduler.checkExists(jobKey);
        }
        catch (Exception e) {
            log.error("校验任务是否存在时异常", e);
            throw new BaseException(TTCode.TT_8003);
        }
    }

    private JobKey getJobKey(JobsModel jobs) throws BaseException {
        Result<GroupsModel> jobGroupResult = groupsService.getById(jobs.getJobGroupId());
        GroupsModel jobGroup = jobGroupResult.getResult();
        if (jobGroup == null) {
            log.info("任务组id有误groupId=" + jobs.getJobGroupId());
            throw new BaseException(TTCode.TT_8008);
        }
        return new JobKey(jobs.getCode(), jobGroup.getCode());
    }

    private List<TriggerKey> getTriggerKey(JobsModel jobs) throws BaseException {
        List<TriggerKey> result = new ArrayList<>();

        // 获取触发器组
        Result<GroupsModel> jobGroupResult = groupsService.getById(jobs.getTriggerGroupId());
        GroupsModel triggerGroup = jobGroupResult.getResult();
        if (triggerGroup == null) {
            log.info("触发器组id有误groupId=" + jobs.getJobGroupId());
            throw new BaseException(8026);
        }

        // 获取触发器
        Result<List<TriggersModel>> triggersResult = triggersService.getByGroupId(jobs.getTriggerGroupId());
        List<TriggersModel> triggers = triggersResult.getResult();
        int size = (triggers != null) ? triggers.size() : 0;
        for (int i = 0; i < size; i++) {
            TriggersModel each = triggers.get(i);
            result.add(new TriggerKey(each.getCode(), triggerGroup.getCode()));
        }
        return result;
    }

    private Result<Boolean> deleteJob(JobsModel jobs) throws BaseException {
        JobKey jobKey = this.getJobKey(jobs);
        try {
            scheduler.deleteJob(jobKey);
        }
        catch (Exception e) {
            log.error("删除任务时异常", e);
            throw new BaseException(TTCode.TT_8006);
        }
        return Result.newSuccessResult(true);
    }

    @SuppressWarnings("unchecked")
    private Result<Boolean> addJob(JobsModel jobs) throws BaseException {
        log.begin("开始增加任务", jobs);

        // 校验任务
        this.validateJob(jobs);
        Long triggerGroupId = jobs.getTriggerGroupId();

        // 获取任务类属性
        JobDataMap dataMap = new JobDataMap();
        Result<List<JobsPropsModel>> propsResult = jobsPropsService.getByJobsId(jobs.getId());
        List<JobsPropsModel> props = propsResult.getResult();
        int propSize = (props != null) ? props.size() : 0;
        for (int i = 0; i < propSize; i++) {
            JobsPropsModel prop = props.get(i);
            dataMap.put(prop.getPropName(), prop.getPropValue());

            log.info("任务属性name=" + prop.getPropName() + ",value=" + prop.getPropValue());
        }

        // 初始化任务类
        Class<? extends Job> jobClass = null;
        try {
            jobClass = ClassUtils.getClass(jobs.getJobClass());
        }
        catch (Exception e) {
            log.error("初始化类时异常", e);
            return Result.newFailureResult(TTCode.TT_8002);
        }

        // 配置任务
        Result<GroupsModel> jobGroupResult = groupsService.getById(jobs.getJobGroupId());
        GroupsModel jobGroup = jobGroupResult.getResult();
        if (jobGroup == null) {
            log.info("任务组id有误groupId=" + jobs.getJobGroupId());
            return Result.newFailureResult(TTCode.TT_8000);
        }
        JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(jobs.getCode(), jobGroup.getCode()).setJobData(dataMap).build();

        // 获取触发器组
        Set<Trigger> triggerSet = Sets.newHashSet();
        Result<GroupsModel> triggerGroupResult = groupsService.getById(triggerGroupId);
        GroupsModel triggerGroup = triggerGroupResult.getResult();
        if (triggerGroup == null) {
            log.info("触发器id有误triggerGroupId=" + triggerGroupId);
            return Result.newFailureResult(TTCode.TT_8001);
        }

        // 配置触发器
        Result<List<TriggersModel>> triggersResult = triggersService.getByGroupId(triggerGroupId);
        List<TriggersModel> triggers = triggersResult.getResult();
        int size = (triggers != null) ? triggers.size() : 0;
        for (int i = 0; i < size; i++) {
            TriggersModel trigger = triggers.get(i);
            log.info("触发器code=" + trigger.getCode());

            TriggerBuilder<Trigger> tb = TriggerBuilder.newTrigger().withIdentity(trigger.getCode(), triggerGroup.getCode());
            if (!BooleanUtils.isBlank(trigger.getCronExpression())) {
                tb.withSchedule(CronScheduleBuilder.cronSchedule(trigger.getCronExpression()));
            }
            else {
                tb.withSchedule(SimpleScheduleBuilder.simpleSchedule().withRepeatCount(trigger.getRepeatNumber()).withIntervalInMilliseconds(trigger.getRepeatInterval()));
            }

            // 设置开始时间
            Date beginTime = trigger.getStartTime();
            if (beginTime != null) {
                tb.startAt(beginTime);
            }

            // 设置结束时间
            Date endTime = trigger.getEndTime();
            if (endTime != null) {
                tb.endAt(endTime);
            }
            triggerSet.add(tb.build());
        }
        try {
            scheduler.scheduleJob(jobDetail, triggerSet, true);
            log.info("定时任务增加成功name=" + jobs.getName());
        }
        catch (SchedulerException e) {
            log.error("增加定时任务异常", e);
            throw new BaseException(TTCode.TT_8003);
        }

        log.end();
        return Result.newSuccessResult(true);
    }

}
