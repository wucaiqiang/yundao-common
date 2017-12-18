package com.yundao.common.controller.role;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.role.RoleService;
import com.yundao.common.model.base.RoleModel;
import com.yundao.common.dto.role.RoleReqDto;
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
@RequestMapping(value = "/role/")
@ResponseBody
@Api("角色表")
public class RoleController{

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询角色表")
    public Result<PaginationSupport<RoleModel>> getPage(@ModelAttribute RoleReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        RoleModel model = new RoleModel();
        BeanUtils.copyProperties(dto,model);
		return roleService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增角色表", notes="根据Role对象创建角色表")
    public Result<Integer> add(@Validated @ModelAttribute RoleReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        RoleModel model = new RoleModel();
        BeanUtils.copyProperties(dto,model);
        return roleService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑角色表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute RoleReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        RoleModel model = new RoleModel();
        BeanUtils.copyProperties(dto,model);
        return roleService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取角色表详细信息")
    public Result<RoleModel> get(@RequestParam Long id) throws Exception{
       return roleService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除角色表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return roleService.delete(id);
    }

}
