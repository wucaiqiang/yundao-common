package com.yundao.common.service.timedtask.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.dto.timedtask.group.GroupResDto;
import com.yundao.common.dto.timedtask.job.JobReqDto;
import com.yundao.common.mapper.timedtask.GroupsMapper;
import com.yundao.common.model.base.timedtask.GroupsModel;
import com.yundao.common.service.timedtask.GroupsService;
import com.yundao.core.code.Result;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;

/**
 * 任务组或触发器组实现类
 *
 * @author 欧阳利
 * 2017年8月17日
 */
@Service
public class GroupsServiceImpl implements GroupsService {

    private static Log log = LogFactory.getLog(GroupsServiceImpl.class);

    @Autowired
    private GroupsMapper groupsMapper;

    @Override
    public Result<Long> insert(GroupsModel model) throws BaseException {
        // 校验编码是否存在
        Result<GroupsModel> groupResult = getByCode(model.getCode());
        if (groupResult.getResult() != null) {
            log.info("编码已存在");
            throw new BaseException(8019);
        }

        if (model.getCreateDate() == null) {
            model.setCreateDate(new Date());
        }
        groupsMapper.insert(model);
        return Result.newSuccessResult(model.getId());
    }

    @Override
    public Result<GroupResDto> insert(JobReqDto dto) throws BaseException {
        GroupResDto result = new GroupResDto();

        // 校验任务组编码是否存在
        String jobCode = dto.getCode() + "Job";
        Result<GroupsModel> groupResult = getByCode(jobCode);
        if (groupResult.getResult() != null) {
            log.info("任务组编码已存在");
            throw new BaseException(8020);
        }

        // 校验任务组编码是否存在
        String triggerCode = dto.getCode() + "Trigger";
        groupResult = getByCode(triggerCode);
        if (groupResult.getResult() != null) {
            log.info("触发器组编码已存在");
            throw new BaseException(8021);
        }

        // 添加任务组
        Date now = new Date();
        GroupsModel jobGroup = new GroupsModel();
        jobGroup.setCode(jobCode);
        jobGroup.setName(dto.getName());
        jobGroup.setDescription(dto.getName());
        jobGroup.setStatus(NumberEnum.ONE.getValue());
        jobGroup.setType(NumberEnum.ONE.getValue());
        jobGroup.setCreateDate(now);
        insert(jobGroup);
        result.setJobGroupId(jobGroup.getId());

        // 添加触发器组
        GroupsModel triggerGroup = new GroupsModel();
        triggerGroup.setCode(triggerCode);
        triggerGroup.setName(dto.getName());
        triggerGroup.setDescription(dto.getName());
        triggerGroup.setStatus(NumberEnum.ONE.getValue());
        triggerGroup.setType(NumberEnum.ZERO.getValue());
        triggerGroup.setCreateDate(now);
        insert(triggerGroup);
        result.setTriggerGroupId(triggerGroup.getId());

        return Result.newSuccessResult(result);
    }

    @Override
    public Result<GroupsModel> getByCode(String code) throws BaseException {
        GroupsModel result = groupsMapper.getByCode(code);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<GroupsModel> getById(Long id) throws BaseException {
        GroupsModel result = groupsMapper.getById(id);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<GroupsModel>> getByType(int type) throws BaseException {
        List<GroupsModel> result = groupsMapper.getByType(type);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<Boolean> deleteByIds(List<Long> idList) throws BaseException {
        groupsMapper.deleteByIds(idList);
        return Result.newSuccessResult(true);
    }

}
