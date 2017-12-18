package com.yundao.common.service.timedtask.impl;

import java.util.Date;
import java.util.List;

import org.quartz.CronScheduleBuilder;
import org.quartz.SimpleScheduleBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.mapper.timedtask.TriggersMapper;
import com.yundao.common.model.base.timedtask.TriggersModel;
import com.yundao.common.service.timedtask.TriggersService;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.utils.BooleanUtils;

/**
 * * 触发器服务实现类
 *
 * @author 欧阳利
 * 2017年8月17日
 */
@Service
public class TriggersServiceImpl implements TriggersService {

    private static Log log = LogFactory.getLog(TriggersServiceImpl.class);

    @Autowired
    private TriggersMapper triggersMapper;

    @Override
    public Result<Long> insert(TriggersModel model) throws BaseException {
        // 校验编码是否已存在
        Result<TriggersModel> triggerResult = getByCode(model.getCode());
        if (triggerResult.getResult() != null) {
            log.info("触发器编码已存在");
            throw new BaseException(8019);
        }

        try {
            // 校验触发器的规则
            if (BooleanUtils.isNotBlank(model.getCronExpression())) {
                CronScheduleBuilder.cronSchedule(model.getCronExpression());
            }
            else {
                SimpleScheduleBuilder.simpleSchedule().withRepeatCount(model.getRepeatNumber()).withIntervalInMilliseconds(model.getRepeatInterval());
            }
        }
        catch (Exception e) {
            log.error("触发器规则有误", e);
            throw new BaseException(8022);
        }

        if (model.getCreateDate() == null) {
            model.setCreateDate(new Date());
        }
        triggersMapper.insert(model);
        return Result.newSuccessResult(model.getId());
    }

    @Override
    public Result<TriggersModel> getByCode(String code) throws BaseException {
        TriggersModel result = triggersMapper.getByCode(code);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<TriggersModel> getById(Long id) throws BaseException {
        TriggersModel result = triggersMapper.getById(id);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<TriggersModel>> getByGroupId(Long groupId) throws BaseException {
        List<TriggersModel> result = triggersMapper.getByGroupId(groupId);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<Boolean> deleteByTriggerGroupId(Long triggerGroupId) throws BaseException {
        triggersMapper.deleteByTriggerGroupId(triggerGroupId);
        return Result.newSuccessResult(true);
    }
}
