package com.yundao.common.mapper.timedtask;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yundao.common.model.base.timedtask.JobsPropsModel;

/**
 * 任务类属性值映射
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface JobsPropsMapper {

    /**
     * 增加任务属性
     *
     * @param model 任务属性
     */
    void insert(JobsPropsModel model);

    /**
     * 获取指定任务ID下的所有数据
     *
     * @param jobsId 任务id
     * @return 任务属性集合
     */
    List<JobsPropsModel> getByJobsId(Long jobsId);

    /**
     * 根据任务id和属性名查询任务属性
     *
     * @param jobsId   任务id
     * @param propName 属性名
     * @return 任务属性
     */
    JobsPropsModel getByJobsIdAndPropName(@Param("jobsId") Long jobsId, @Param("propName") String propName);

    /**
     * 根据任务id删除任务属性
     *
     * @param jobsId 任务id
     * @return 更新的条数
     */
    int deleteByJobsId(@Param("jobsId") Long jobsId);
}
