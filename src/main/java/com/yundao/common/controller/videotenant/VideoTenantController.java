package com.yundao.common.controller.videotenant;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.videotenant.VideoTenantService;
import com.yundao.common.model.base.VideoTenantModel;
import com.yundao.common.dto.videotenant.VideoTenantReqDto;
import com.yundao.core.code.Result;
import com.yundao.core.validator.group.Update;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.validator.spring.BindingResultHandler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.BeanUtils;
import org.springframework.validation.annotation.Validated;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Api;

@RestController
@RequestMapping(value = "/videotenant/")
@ResponseBody
@Api("视频ID与租户的关联表")
public class VideoTenantController{

    @Autowired
    private VideoTenantService videoTenantService;

    @RequestMapping(value = "get_transcode_msg", method = RequestMethod.GET)
	@ApiOperation(value = "获取腾讯云通知的消息,定时任务正则：0/20 * * * * ?")
	public Result<Boolean> getTranscodeMsg() throws Exception {
		return videoTenantService.doGetTranscodeMsg();
	}
    
    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询租户ID与租户的关联表")
    public Result<PaginationSupport<VideoTenantModel>> getPage(@ModelAttribute VideoTenantReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        VideoTenantModel model = new VideoTenantModel();
        BeanUtils.copyProperties(dto,model);
		return videoTenantService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增租户ID与租户的关联表", notes="根据VideoTenant对象创建租户ID与租户的关联表")
    public Result<Long> add(@Validated @ModelAttribute VideoTenantReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        VideoTenantModel model = new VideoTenantModel();
        BeanUtils.copyProperties(dto,model);
        return videoTenantService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑租户ID与租户的关联表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute VideoTenantReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        VideoTenantModel model = new VideoTenantModel();
        BeanUtils.copyProperties(dto,model);
        return videoTenantService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取租户ID与租户的关联表详细信息")
    public Result<VideoTenantModel> get(@RequestParam Long id) throws Exception{
       return videoTenantService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除租户ID与租户的关联表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return videoTenantService.delete(id);
    }

}
