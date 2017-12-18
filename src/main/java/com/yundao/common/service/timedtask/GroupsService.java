package com.yundao.common.service.timedtask;

import java.util.List;

import com.yundao.common.dto.timedtask.group.GroupResDto;
import com.yundao.common.dto.timedtask.job.JobReqDto;
import com.yundao.common.model.base.timedtask.GroupsModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;

/**
 * 任务组或触发器组接口
 *
 * @author 欧阳利
 * 2017年8月17日
 */
public interface GroupsService {

    /**
     * 插入组
     *
     * @param model 组对象
     * @return 插入后的主键
     * @throws BaseException
     */
    Result<Long> insert(GroupsModel model) throws BaseException;

    /**
     * 插入任务组和触发器组
     *
     * @param dto 任务请求传输类
     * @return 组返回信息
     * @throws BaseException
     */
    Result<GroupResDto> insert(JobReqDto dto) throws BaseException;

    /**
     * 根据编码获取数据
     *
     * @param code 编码
     * @return 组对象
     * @throws BaseException
     */
    Result<GroupsModel> getByCode(String code) throws BaseException;

    /**
     * 根据编码获取数据
     *
     * @param id 主键
     * @return 组对象
     * @throws BaseException
     */
    Result<GroupsModel> getById(Long id) throws BaseException;

    /**
     * 获取所有
     *
     * @param type 类型
     * @return 组对象
     * @throws BaseException
     */
    Result<List<GroupsModel>> getByType(int type) throws BaseException;

    /**
     * 根据组id集合删除组
     *
     * @param idList 组id集合
     * @return 若删除成功则返回true
     * @throws BaseException
     */
    Result<Boolean> deleteByIds(List<Long> idList) throws BaseException;

}
