package com.yundao.common.service.timedtask.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.mapper.timedtask.JobsPropsMapper;
import com.yundao.common.model.base.timedtask.JobsPropsModel;
import com.yundao.common.service.timedtask.JobsPropsService;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;

/**
 * 任务类属性值服务类
 *
 * @author 欧阳利
 * 2017年8月17日
 */
@Service
public class JobsPropsServiceImpl implements JobsPropsService {

    private static Log log = LogFactory.getLog(JobsPropsServiceImpl.class);

    @Autowired
    private JobsPropsMapper jobsPropsMapper;

    @Override
    public Result<Long> insert(JobsPropsModel model) throws BaseException {
        // 校验属性名是否已存在
        Result<JobsPropsModel> jobsPropsModelResult = getByJobsIdAndPropName(model.getJobsId(), model.getPropName());
        if (jobsPropsModelResult.getResult() != null) {
            log.info("任务属性名已存在jobId=" + model.getJobsId() + ",propName=" + model.getPropName());
            throw new BaseException(8024);
        }

        if (model.getCreateDate() == null) {
            model.setCreateDate(new Date());
        }
        jobsPropsMapper.insert(model);
        return Result.newSuccessResult(model.getId());
    }

    @Override
    public Result<List<JobsPropsModel>> getByJobsId(Long jobsId) throws BaseException {
        List<JobsPropsModel> result = jobsPropsMapper.getByJobsId(jobsId);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<JobsPropsModel> getByJobsIdAndPropName(Long jobsId, String propName) throws BaseException {
        JobsPropsModel result = jobsPropsMapper.getByJobsIdAndPropName(jobsId, propName);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<Boolean> deleteByJobsId(Long jobsId) throws BaseException {
        jobsPropsMapper.deleteByJobsId(jobsId);
        return Result.newSuccessResult(true);
    }

}
