package com.yundao.common.service.timedtask;

import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * 调度任务接口
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface SchedulerService {

    /**
     * 增加任务
     *
     * @param jobId 任务id
     * @return 若添加成功则返回true，否则返回false
     * @throws BaseException
     */
    Result<Boolean> addJob(Long jobId) throws BaseException;

    /**
     * 增加所有有效的任务
     *
     * @param existReturn true：若任务已存在则返回
     * @return 若添加成功则返回true，否则返回false
     * @throws BaseException
     */
    Result<Boolean> addValidJob(boolean existReturn) throws BaseException;

    /**
     * 暂停任务
     *
     * @param jobId 任务id
     * @return 若暂停成功则返回true
     * @throws BaseException
     */
    Result<Boolean> doPauseJob(Long jobId) throws BaseException;

    /**
     * 恢复任务
     *
     * @param jobId 任务id
     * @return 若恢复成功则返回true
     * @throws BaseException
     */
    Result<Boolean> doResumeJob(Long jobId) throws BaseException;

    /**
     * 删除任务
     *
     * @param jobId 任务id
     * @return 若删除成功则返回true
     * @throws BaseException
     */
    Result<Boolean> doDeleteJob(Long jobId) throws BaseException;

    /**
     * 删除已过期的任务
     *
     * @return 若删除成功则返回true
     * @throws BaseException
     */
    Result<Boolean> doDeleteExpireJob() throws BaseException;

    /**
     * 启动调度任务
     *
     * @return 若启动成功则返回true
     * @throws BaseException
     */
    Result<Boolean> doStart() throws BaseException;

    /**
     * 是否已启动
     *
     * @return 若启动成功则返回true
     * @throws BaseException
     */
    Result<Boolean> isStarted() throws BaseException;

    /**
     * 停止调度任务
     *
     * @param waitForJobsToComplete 是否等待任务执行完成
     * @return 若停止成功则返回true
     * @throws BaseException
     */
    Result<Boolean> doShutdown(boolean waitForJobsToComplete) throws BaseException;

}
