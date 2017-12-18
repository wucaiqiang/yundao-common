package com.yundao.common.controller.tenantinitdepartment;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.model.base.DepartmentModel;
import com.yundao.common.service.tenantinitdepartment.TenantInitDepartmentService;
import com.yundao.common.model.base.TenantInitDepartmentModel;
import com.yundao.common.dto.tenantinitdepartment.TenantInitDepartmentReqDto;
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

import java.util.List;

@RestController
@RequestMapping(value = "/tenantinitdepartment/")
@ResponseBody
@Api("租户初始化部门表")
public class TenantInitDepartmentController{

    @Autowired
    private TenantInitDepartmentService tenantInitDepartmentService;

    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询租户初始化部门表")
    public Result<PaginationSupport<TenantInitDepartmentModel>> getPage(@ModelAttribute TenantInitDepartmentReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        TenantInitDepartmentModel model = new TenantInitDepartmentModel();
        BeanUtils.copyProperties(dto,model);
		return tenantInitDepartmentService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增租户初始化部门表", notes="根据TenantInitDepartment对象创建租户初始化部门表")
    public Result<Integer> add(@Validated @ModelAttribute TenantInitDepartmentReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        TenantInitDepartmentModel model = new TenantInitDepartmentModel();
        BeanUtils.copyProperties(dto,model);
        return tenantInitDepartmentService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑租户初始化部门表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute TenantInitDepartmentReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        TenantInitDepartmentModel model = new TenantInitDepartmentModel();
        BeanUtils.copyProperties(dto,model);
        return tenantInitDepartmentService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取租户初始化部门表详细信息")
    public Result<TenantInitDepartmentModel> get(@RequestParam Long id) throws Exception{
       return tenantInitDepartmentService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除租户初始化部门表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return tenantInitDepartmentService.delete(id);
    }

    @RequestMapping(value = "get_tenant_department",method = RequestMethod.GET)
    @ApiOperation(value = "获取租户对应的初始化所有数据")
    public Result<List<DepartmentModel>> getTenantDepartment(@RequestParam(value = "tenantId") Long tenantId,@RequestParam(value =  "systemCode",required = false)String systemCode) throws  Exception{
        return tenantInitDepartmentService.getTenantDepartment(tenantId,systemCode);
    }

    @RequestMapping(value = "update_init_department", method=RequestMethod.GET)
    @ApiOperation(value="设置租户对应的角色")
    public Result<TenantInitDepartmentModel> get(@RequestParam Long tenantId,@RequestParam String departmentIds, @RequestParam String systemCode) throws Exception{
        return tenantInitDepartmentService.uploadTenantRole(tenantId,departmentIds,systemCode);
    }

}
