package com.yundao.common.service.timedtask;

import java.util.List;

import com.yundao.common.model.base.timedtask.JobsPropsModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * 任务类属性值接口
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface JobsPropsService {

    /**
     * 增加任务属性
     *
     * @param model 任务属性模型
     * @return 主键
     * @throws BaseException
     */
    Result<Long> insert(JobsPropsModel model) throws BaseException;

    /**
     * 获取指定任务ID下的所有数据
     *
     * @param jobsId 任务id
     * @return 任务属性
     * @throws BaseException
     */
    Result<List<JobsPropsModel>> getByJobsId(Long jobsId) throws BaseException;

    /**
     * 根据任务id和属性名查询任务属性
     *
     * @param jobsId   任务id
     * @param propName 属性名
     * @return 任务属性
     */
    Result<JobsPropsModel> getByJobsIdAndPropName(Long jobsId, String propName) throws BaseException;

    /**
     * 根据任务id删除任务属性
     *
     * @param jobsId 任务id
     * @return 若删除成功则返回true
     * @throws BaseException
     */
    Result<Boolean> deleteByJobsId(Long jobsId) throws BaseException;

}
