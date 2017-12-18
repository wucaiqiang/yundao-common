package com.yundao.common.service.timedtask;

import java.util.List;

import com.yundao.common.model.base.timedtask.TriggersModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * 触发器接口
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface TriggersService {

    /**
     * 增加触发器
     *
     * @param model 触发器模型
     * @return 主键
     * @throws BaseException
     */
    Result<Long> insert(TriggersModel model) throws BaseException;

    /**
     * 根据编码获取数据
     *
     * @param code 编码
     * @return 触发器模型
     * @throws BaseException
     */
    Result<TriggersModel> getByCode(String code) throws BaseException;

    /**
     * 根据编码获取数据
     *
     * @param id 主键
     * @return 触发器模型
     * @throws BaseException
     */
    Result<TriggersModel> getById(Long id) throws BaseException;

    /**
     * 根据组获取数据
     *
     * @param groupId 组id
     * @return 触发器模型
     * @throws BaseException
     */
    Result<List<TriggersModel>> getByGroupId(Long groupId) throws BaseException;

    /**
     * 根据触发器组id删除触发器
     *
     * @param triggerGroupId 触发器组id
     * @return 若删除成功则返回true
     * @throws BaseException
     */
    Result<Boolean> deleteByTriggerGroupId(Long triggerGroupId) throws BaseException;

}
