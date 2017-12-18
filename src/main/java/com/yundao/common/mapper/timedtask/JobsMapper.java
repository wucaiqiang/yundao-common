package com.yundao.common.mapper.timedtask;

import java.util.List;

import com.yundao.common.model.base.timedtask.JobsModel;

/**
 * 任务映射
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface JobsMapper {

    /**
     * 增加任务
     *
     * @param model 任务模型
     */
    void insert(JobsModel model);

    /**
     * 根据编码获取数据
     *
     * @param code 编码
     * @return 任务模型
     */
    JobsModel getByCode(String code);

    /**
     * 根据编码获取数据
     *
     * @param id 主键
     * @return 任务模型
     */
    JobsModel getById(Long id);

    /**
     * 获取有效的数据
     *
     * @return 任务模型集合
     */
    List<JobsModel> getValid();

    /**
     * 获取无效的数据
     *
     * @return 任务模型集合
     */
    List<JobsModel> getExpire();

    /**
     * 删除任务
     *
     * @param id 任务id
     * @return 删除的条数
     */
    int deleteById(Long id);
}
