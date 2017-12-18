package com.yundao.common.controller.tenantinitrole;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.dto.tenantinitrole.TenantinitRoleDto;
import com.yundao.common.service.tenantinitrole.TenantInitRoleService;
import com.yundao.common.model.base.TenantInitRoleModel;
import com.yundao.common.dto.tenantinitrole.TenantInitRoleReqDto;
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
@RequestMapping(value = "/tenantinitrole/")
@ResponseBody
@Api("租户初始化角色表")
public class TenantInitRoleController{

    @Autowired
    private TenantInitRoleService tenantInitRoleService;

//    @RequestMapping(value = "get_page",method=RequestMethod.GET)
//    @ApiOperation(value="分页查询租户初始化角色表")
//    public Result<PaginationSupport<TenantInitRoleModel>> getPage(@ModelAttribute TenantInitRoleReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
//        TenantInitRoleModel model = new TenantInitRoleModel();
//        BeanUtils.copyProperties(dto,model);
//		return tenantInitRoleService.selectPage(model, pageDto);
//    }
//
//    @RequestMapping(value="add", method=RequestMethod.POST)
//    @ApiOperation(value="新增租户初始化角色表", notes="根据TenantInitRole对象创建租户初始化角色表")
//    public Result<Integer> add(@Validated @ModelAttribute TenantInitRoleReqDto dto, BindingResult bindingResult) throws Exception{
//        BindingResultHandler.handleByException(bindingResult);
//        TenantInitRoleModel model = new TenantInitRoleModel();
//        BeanUtils.copyProperties(dto,model);
//        return tenantInitRoleService.insert(model);
//    }
//
//    @RequestMapping(value = "update", method=RequestMethod.POST)
//    @ApiOperation(value="编辑租户初始化角色表信息")
//    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute TenantInitRoleReqDto dto, BindingResult bindingResult) throws Exception{
//        BindingResultHandler.handleByException(bindingResult);
//        TenantInitRoleModel model = new TenantInitRoleModel();
//        BeanUtils.copyProperties(dto,model);
//        return tenantInitRoleService.update(model);
//    }
//
//    @RequestMapping(value = "get", method=RequestMethod.GET)
//    @ApiOperation(value="获取租户初始化角色表详细信息")
//    public Result<TenantInitRoleModel> get(@RequestParam Long id) throws Exception{
//       return tenantInitRoleService.select(id);
//    }

    @RequestMapping(value = "update_init_role", method=RequestMethod.GET)
    @ApiOperation(value="设置租户对应的角色")
    public Result<TenantInitRoleModel> get(@RequestParam Long tenantId,@RequestParam String roleIds, @RequestParam String systemCode) throws Exception{
       return tenantInitRoleService.uploadTenantRole(tenantId,roleIds,systemCode);
    }

//    @RequestMapping(value = "delete", method=RequestMethod.POST)
//    @ApiOperation(value="删除租户初始化角色表信息")
//    public Result<Integer> delete(@RequestParam Long id) throws Exception{
//        return tenantInitRoleService.delete(id);
//    }

    @RequestMapping(value = "get_tenant_role", method=RequestMethod.GET)
    @ApiOperation(value="获取租户初始化角色信息")
    public Result<TenantinitRoleDto> getTenantRole(@RequestParam(value = "tenantId") Long tenantId,@RequestParam(value = "systemCode",required = false)String systemCode) throws Exception{
        return tenantInitRoleService.getTenantRole(tenantId,systemCode);
    }
}
