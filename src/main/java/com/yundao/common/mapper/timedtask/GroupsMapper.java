package com.yundao.common.mapper.timedtask;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yundao.common.model.base.timedtask.GroupsModel;

/**
 * 任务组或触发器组映射
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface GroupsMapper {

    /**
     * 增加任务组
     *
     * @param model 任务组
     */
    void insert(GroupsModel model);

    /**
     * 根据编码获取数据
     *
     * @param code 组编码
     * @return 组信息
     */
    GroupsModel getByCode(String code);

    /**
     * 根据编码获取数据
     *
     * @param id 组主键
     * @return 组信息
     */
    GroupsModel getById(Long id);

    /**
     * 根据类型获取所有
     *
     * @param type 组类型
     * @return 组信息
     */
    List<GroupsModel> getByType(int type);

    /**
     * 根据组id集合删除组
     *
     * @param idList 组id集合
     * @return 删除的条数
     */
    int deleteByIds(@Param("idList") List<Long> idList);
}
