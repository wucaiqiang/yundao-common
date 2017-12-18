package com.yundao.common.controller.resource;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.resource.ResourceService;
import com.yundao.common.model.base.ResourceModel;
import com.yundao.common.dto.resource.ResourceReqDto;
import com.yundao.core.code.Result;
import com.yundao.core.validator.group.Update;
import com.yundao.core.utils.ObjectCopyUtil;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.validator.spring.BindingResultHandler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.beans.BeanUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Api;

@RestController
@RequestMapping(value = "/resource/")
@ResponseBody
@Api("资源表")
public class ResourceController{

    @Autowired
    private ResourceService resourceService;

    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询资源表")
    public Result<PaginationSupport<ResourceModel>> getPage(@ModelAttribute ResourceReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        ResourceModel model = new ResourceModel();
        BeanUtils.copyProperties(dto,model);
		return resourceService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增资源表", notes="根据Resource对象创建资源表")
    public Result<Integer> add(@Validated @ModelAttribute ResourceReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        ResourceModel model = ObjectCopyUtil.copyObject(dto,ResourceModel.class);
        return resourceService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑资源表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute ResourceReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        ResourceModel model = new ResourceModel();
        BeanUtils.copyProperties(dto,model);
        return resourceService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取资源表详细信息")
    public Result<ResourceModel> get(@RequestParam Long id) throws Exception{
       return resourceService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除资源表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return resourceService.delete(id);
    }

}
