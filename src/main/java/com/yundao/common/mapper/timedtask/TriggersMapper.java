package com.yundao.common.mapper.timedtask;

import java.util.List;

import com.yundao.common.model.base.timedtask.TriggersModel;

/**
 * 触发器映射
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface TriggersMapper {

    /**
     * 增加触发器
     *
     * @param model 触发器模型
     */
    void insert(TriggersModel model);

    /**
     * 根据编码获取数据
     *
     * @param code 编码
     * @return 触发器模型
     */
    TriggersModel getByCode(String code);

    /**
     * 根据编码获取数据
     *
     * @param id 主键
     * @return 触发器模型
     */
    TriggersModel getById(Long id);

    /**
     * 根据组获取数据
     *
     * @param groupId 组id
     * @return 触发器模型集合
     */
    List<TriggersModel> getByGroupId(Long groupId);

    /**
     * 删除触发器
     *
     * @param triggerGroupId 触发器组id
     * @return 删除的条数
     */
    int deleteByTriggerGroupId(Long triggerGroupId);
}
