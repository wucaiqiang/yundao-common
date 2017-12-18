package com.yundao.common.service.timedtask;

import java.util.List;

import com.yundao.common.dto.timedtask.job.JobReqDto;
import com.yundao.common.model.base.timedtask.JobsModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * 任务接口
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface JobsService {

    /**
     * 增加任务
     *
     * @param dto 任务请求类
     * @return 任务主键
     * @throws BaseException
     */
    Result<Long> insert(JobReqDto dto) throws BaseException;

    /**
     * 增加任务
     *
     * @param model 任务模型
     * @return 主键
     * @throws BaseException
     */
    Result<Long> insert(JobsModel model) throws BaseException;

    /**
     * 根据编码获取数据
     *
     * @param code 编码
     * @return 任务模型
     * @throws BaseException
     */
    Result<JobsModel> getByCode(String code) throws BaseException;

    /**
     * 根据编码获取数据
     *
     * @param id 主键
     * @return 任务模型
     * @throws BaseException
     */
    Result<JobsModel> getById(Long id) throws BaseException;

    /**
     * 获取有效的数据
     *
     * @return 任务模型集合
     * @throws BaseException
     */
    Result<List<JobsModel>> getValid() throws BaseException;

    /**
     * 获取无效的数据
     *
     * @return 任务模型集合
     * @throws BaseException
     */
    Result<List<JobsModel>> getExpire() throws BaseException;

    /**
     * 根据任务id删除任务
     *
     * @param id 任务id
     * @return 若删除成功则返回true
     * @throws BaseException
     */
    Result<Boolean> deleteById(Long id) throws BaseException;

}
