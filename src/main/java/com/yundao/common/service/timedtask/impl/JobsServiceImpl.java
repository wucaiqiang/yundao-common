package com.yundao.common.service.timedtask.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JavaType;
import com.yundao.common.dto.timedtask.group.GroupResDto;
import com.yundao.common.dto.timedtask.job.JobReqDto;
import com.yundao.common.mapper.timedtask.JobsMapper;
import com.yundao.common.model.base.timedtask.JobsModel;
import com.yundao.common.model.base.timedtask.JobsPropsModel;
import com.yundao.common.model.base.timedtask.TriggersModel;
import com.yundao.common.service.timedtask.GroupsService;
import com.yundao.common.service.timedtask.JobsPropsService;
import com.yundao.common.service.timedtask.JobsService;
import com.yundao.common.service.timedtask.SchedulerService;
import com.yundao.common.service.timedtask.TriggersService;
import com.yundao.core.code.Result;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.DateUtils;
import com.yundao.core.utils.JsonUtils;

/**
 * 任务实现类
 *
 * @author 欧阳利
 * 2017年8月17日
 */
@Service
public class JobsServiceImpl implements JobsService {

    private static Log log = LogFactory.getLog(JobsServiceImpl.class);

    @Autowired
    private JobsMapper jobsMapper;

    @Autowired
    private GroupsService groupsService;

    @Autowired
    private TriggersService triggersService;

    @Autowired
    private JobsPropsService jobsPropsService;

    @Autowired
    private SchedulerService schedulerService;

    @Override
    public Result<Long> insert(JobReqDto dto) throws BaseException {
        log.begin("开始增加任务", dto);

        // 格式化日期
        Date startTime;
        Date endTime;
        try {
            startTime = DateUtils.parse(dto.getStartTime(), DateUtils.YY_MM_DD_HH_MM_SS);
            endTime = DateUtils.parse(dto.getEndTime(), DateUtils.YY_MM_DD_HH_MM_SS);
        }
        catch (Exception e) {
            log.error("时间格式有误", e);
            throw new BaseException(8027);
        }

        // 添加组
        Result<GroupResDto> groupResDtoResult = groupsService.insert(dto);
        GroupResDto groupResDto = groupResDtoResult.getResult();

        // 添加触发器
        TriggersModel triggersModel = new TriggersModel();
        triggersModel.setCode(dto.getCode() + "Trigger");
        triggersModel.setDescription(dto.getName());
        triggersModel.setCronExpression(dto.getCronExpression());
        triggersModel.setName(dto.getName());
        triggersModel.setTriggerGroupId(groupResDto.getTriggerGroupId());
        triggersModel.setStatus(NumberEnum.ONE.getValue());
        triggersModel.setRepeatInterval(dto.getRepeatInterval());
        triggersModel.setRepeatNumber(dto.getRepeatNumber());
        triggersModel.setStartTime(startTime);
        triggersModel.setEndTime(endTime);
        triggersService.insert(triggersModel);

        // 添加任务
        JobsModel jobsModel = new JobsModel();
        jobsModel.setCode(dto.getCode());
        jobsModel.setStatus(NumberEnum.ONE.getValue());
        jobsModel.setTriggerGroupId(groupResDto.getTriggerGroupId());
        jobsModel.setName(dto.getName());
        jobsModel.setDescription(dto.getName());
        jobsModel.setJobClass("com.yundao.common.service.timedtask.UrlJob");
        jobsModel.setJobGroupId(groupResDto.getJobGroupId());
        jobsModel.setStartTime(startTime);
        jobsModel.setEndTime(endTime);
        insert(jobsModel);

        // 添加链接任务属性
        JobsPropsModel urlProps = new JobsPropsModel();
        urlProps.setPropName("url");
        urlProps.setPropValue(dto.getUrl());
        urlProps.setStatus(NumberEnum.ONE.getValue());
        urlProps.setJobsId(jobsModel.getId());
        jobsPropsService.insert(urlProps);

        // 添加任务属性
        if (BooleanUtils.isNotBlank(dto.getJson())) {
            JavaType javaType = JsonUtils.getCollectionType(List.class, JobsPropsModel.class);
            List<JobsPropsModel> jobsPropsModelList = JsonUtils.jsonToObject(dto.getJson(), javaType);
            for (JobsPropsModel each : jobsPropsModelList) {
                each.setStatus(NumberEnum.ONE.getValue());
                each.setJobsId(jobsModel.getId());
                jobsPropsService.insert(each);
            }
        }

        // 增加该任务
        schedulerService.addJob(jobsModel.getId());
        return Result.newSuccessResult(jobsModel.getId());
    }

    @Override
    public Result<Long> insert(JobsModel model) throws BaseException {
        log.begin(model);

        // 校验编码是否存在
        Result<JobsModel> jobResult = getByCode(model.getCode());
        if (jobResult.getResult() != null) {
            log.info("编码已存在");
            throw new BaseException(8019);
        }

        if (model.getCreateDate() == null) {
            model.setCreateDate(new Date());
        }
        jobsMapper.insert(model);
        return Result.newSuccessResult(model.getId());
    }

    @Override
    public Result<JobsModel> getByCode(String code) throws BaseException {
        JobsModel result = jobsMapper.getByCode(code);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<JobsModel> getById(Long id) throws BaseException {
        JobsModel result = jobsMapper.getById(id);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<JobsModel>> getValid() throws BaseException {
        List<JobsModel> result = jobsMapper.getValid();
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<JobsModel>> getExpire() throws BaseException {
        List<JobsModel> result = jobsMapper.getExpire();
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<Boolean> deleteById(Long id) throws BaseException {
        log.begin(id);

        // 根据任务id查询数据
        Result<JobsModel> jobsModelResult = getById(id);
        JobsModel jobsModel = jobsModelResult.getResult();
        if (jobsModel == null) {
            log.info("任务数据不存在id=" + id);
            return Result.newSuccessResult(false);
        }

        log.info("开始删除任务id=" + id + ",name=" + jobsModel.getName());

        // 删除正在执行的任务
        schedulerService.doDeleteJob(id);

        // 删除任务组
        List<Long> groupIdList = new ArrayList<Long>();
        groupIdList.add(jobsModel.getJobGroupId());
        groupIdList.add(jobsModel.getTriggerGroupId());
        groupsService.deleteByIds(groupIdList);

        // 删除触发器
        triggersService.deleteByTriggerGroupId(jobsModel.getTriggerGroupId());

        // 删除任务属性
        jobsPropsService.deleteByJobsId(id);

        // 删除任务
        jobsMapper.deleteById(id);
        return Result.newSuccessResult(true);
    }

}
