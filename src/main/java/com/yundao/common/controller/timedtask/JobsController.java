package com.yundao.common.controller.timedtask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yundao.common.dto.timedtask.job.JobReqDto;
import com.yundao.common.model.base.timedtask.JobsModel;
import com.yundao.common.service.timedtask.JobsService;
import com.yundao.common.service.timedtask.SchedulerService;
import com.yundao.core.code.Result;
import com.yundao.core.validator.spring.BindingResultHandler;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 任务控制类
 * 
 * @author 欧阳利
 * 2017年8月17日
 */
@RestController
@RequestMapping(value = "/jobs")
@ResponseBody
@Api("任务控制类")
public class JobsController {

    @Autowired
    private SchedulerService schedulerService;

    @Autowired
    private JobsService jobsService;

    /**
     * 获取任务
     *
     * @param id 任务主键id
     * @return 任务对象
     * @throws Exception
     */
    @RequestMapping(value = "/get",method=RequestMethod.GET)
    public Result<JobsModel> get(Long id) throws Exception {
        return jobsService.getById(id);
    }

    /**
     * 增加任务
     *
     * @param id 任务主键id
     * @return 是否添加成功
     * @throws Exception
     */
    @RequestMapping(value = "/add",method=RequestMethod.POST)
    @ApiOperation(value="增加任务")
    public Result<Boolean> add(@RequestParam Long id) throws Exception {
        return schedulerService.addJob(id);
    }

    /**
     * 动态增加任务
     *
     * @param dto           任务请求类
     * @param bindingResult 校验结果
     * @return 任务主键
     * @throws Exception
     */
    @RequestMapping(value = "/add/dynamic",method=RequestMethod.POST)
    @ApiOperation(value="动态增加任务")
    public Result<Long> addDynamic(@Validated @ModelAttribute JobReqDto dto, BindingResult bindingResult) throws Exception {
        BindingResultHandler.handleByException(bindingResult);
        return jobsService.insert(dto);
    }

    /**
     * 增加有效的任务
     *
     * @return 是否添加成功
     * @throws Exception
     */
    @RequestMapping(value = "/add/valid",method=RequestMethod.POST)
    @ApiOperation(value="增加有效的任务")
    public Result<Boolean> addValid() throws Exception {
        return schedulerService.addValidJob(true);
    }

    /**
     * 暂停任务
     *
     * @param id 任务主键id
     * @return 是否添加成功
     * @throws Exception
     */
    @RequestMapping(value = "/pause",method=RequestMethod.POST)
    @ApiOperation(value="暂停任务")
    public Result<Boolean> pause(@RequestParam Long id) throws Exception {
        return schedulerService.doPauseJob(id);
    }

    /**
     * 恢复任务
     *
     * @param id 任务主键id
     * @return 是否添加成功
     * @throws Exception
     */
    @RequestMapping(value = "/resume",method=RequestMethod.POST)
    @ApiOperation(value="恢复任务")
    public Result<Boolean> resume(@RequestParam Long id) throws Exception {
        return schedulerService.doResumeJob(id);
    }

    /**
     * 删除正在执行的任务，但不删除任务配置
     *
     * @param id 任务主键id
     * @return 是否删除成功
     * @throws Exception
     */
    @RequestMapping(value = "/delete/running",method=RequestMethod.POST)
    @ApiOperation(value="删除正在执行的任务，但不删除任务配置")
    public Result<Boolean> deleteRunning(@RequestParam Long id) throws Exception {
        return schedulerService.doDeleteJob(id);
    }

    /**
     * 删除已过期的任务，但不删除任务配置
     *
     * @return 是否删除成功
     * @throws Exception
     */
    @RequestMapping(value = "/delete/expire",method=RequestMethod.POST)
    @ApiOperation(value="删除已过期的任务，但不删除任务配置")
    public Result<Boolean> deleteExpire() throws Exception {
        return schedulerService.doDeleteExpireJob();
    }

    /**
     * 删除正在执行的任务和任务配置
     *
     * @param id 任务主键id
     * @return 是否删除成功
     * @throws Exception
     */
    @RequestMapping(value = "/delete/all",method=RequestMethod.POST)
    public Result<Boolean> deleteAll(@RequestParam Long id) throws Exception {
        return jobsService.deleteById(id);
    }

}
