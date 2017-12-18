package com.yundao.common.controller.system;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.system.SystemService;
import com.yundao.common.model.base.SystemModel;
import com.yundao.common.dto.system.SystemReqDto;
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
@RequestMapping(value = "/system/")
@ResponseBody
@Api("系统表")
public class SystemController{

    @Autowired
    private SystemService systemService;

    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询系统表")
    public Result<PaginationSupport<SystemModel>> getPage(@ModelAttribute SystemReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        SystemModel model = new SystemModel();
        BeanUtils.copyProperties(dto,model);
		return systemService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增系统表", notes="根据System对象创建系统表")
    public Result<Integer> add(@Validated @ModelAttribute SystemReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        SystemModel model = ObjectCopyUtil.copyObject(dto,SystemModel.class);
        return systemService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑系统表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute SystemReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        SystemModel model = new SystemModel();
        BeanUtils.copyProperties(dto,model);
        return systemService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取系统表详细信息")
    public Result<SystemModel> get(@RequestParam Long id) throws Exception{
       return systemService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除系统表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return systemService.delete(id);
    }

}
