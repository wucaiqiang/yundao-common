package com.yundao.common.controller.roleresource;
import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.roleresource.RoleResourceService;
import com.yundao.common.model.base.RoleResourceModel;
import com.yundao.common.dto.roleresource.RoleResourceReqDto;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
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

import javax.validation.constraints.NotNull;

@RestController
@RequestMapping(value = "/roleresource/")
@ResponseBody
@Api("角色资源表")
public class RoleResourceController{

    @Autowired
    private RoleResourceService roleResourceService;

//    @RequestMapping(value = "get_page",method=RequestMethod.GET)
//    @ApiOperation(value="分页查询角色资源表")
//    public Result<PaginationSupport<RoleResourceModel>> getPage(@ModelAttribute RoleResourceReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
//        RoleResourceModel model = new RoleResourceModel();
//        BeanUtils.copyProperties(dto,model);
//		return roleResourceService.selectPage(model, pageDto);
//    }
//
//    @RequestMapping(value="add", method=RequestMethod.POST)
//    @ApiOperation(value="新增角色资源表", notes="根据RoleResource对象创建角色资源表")
//    public Result<Integer> add(@Validated @ModelAttribute RoleResourceReqDto dto, BindingResult bindingResult) throws Exception{
//        BindingResultHandler.handleByException(bindingResult);
//        RoleResourceModel model = new RoleResourceModel();
//        BeanUtils.copyProperties(dto,model);
//        return roleResourceService.insert(model);
//    }
//
//    @RequestMapping(value = "update", method=RequestMethod.POST)
//    @ApiOperation(value="编辑角色资源表信息")
//    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute RoleResourceReqDto dto, BindingResult bindingResult) throws Exception{
//        BindingResultHandler.handleByException(bindingResult);
//        RoleResourceModel model = new RoleResourceModel();
//        BeanUtils.copyProperties(dto,model);
//        return roleResourceService.update(model);
//    }
//
//    @RequestMapping(value = "get", method=RequestMethod.GET)
//    @ApiOperation(value="获取角色资源表详细信息")
//    public Result<RoleResourceModel> get(@RequestParam Long id) throws Exception{
//       return roleResourceService.select(id);
//    }
//
//    @RequestMapping(value = "delete", method=RequestMethod.POST)
//    @ApiOperation(value="删除角色资源表信息")
//    public Result<Integer> delete(@RequestParam Long id) throws Exception{
//        return roleResourceService.delete(id);
//    }

    /**
     * 设置角色的资源
     *
     * @param resourceIds 多个资源id,以逗号分隔
     * @param roleId      角色id
     * @return 操作结果
     * @throws BaseException 异常信息
     */
    @RequestMapping(value = "/role/update", method = RequestMethod.POST)
    @ApiOperation(value = "设置角色资源", notes = "管理员为该角色设置权限资源")
    public Result<Integer> updateRoleResource(@RequestParam String resourceIds, @RequestParam Long roleId) throws BaseException {
        return roleResourceService.updateRoleResource(resourceIds, roleId);
    }
}
