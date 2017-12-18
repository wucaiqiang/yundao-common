package com.yundao.common.controller.tenant;

import com.yundao.common.dto.BasePageDto;
import com.yundao.common.dto.tenant.TenantReqDto;
import com.yundao.common.model.base.DomainNameModel;
import com.yundao.common.model.base.TenantModel;
import com.yundao.common.service.domainname.DomainNameService;
import com.yundao.common.service.tenant.TenantService;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.utils.ObjectCopyUtil;
import com.yundao.core.validator.group.Update;
import com.yundao.core.validator.spring.BindingResultHandler;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/tenant/")
@ResponseBody
@Api("租户表")
public class TenantController {

    @Autowired
    private TenantService tenantService;
    @Autowired
    private DomainNameService domainNameService;

    @RequestMapping(value = "get_page", method = RequestMethod.GET)
    @ApiOperation(value = "分页查询租户表")
    public Result<PaginationSupport<TenantModel>> getPage(@ModelAttribute TenantReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception {
        TenantModel model = new TenantModel();
        BeanUtils.copyProperties(dto, model);
        return tenantService.selectPage(model, pageDto);
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ApiOperation(value = "新增租户表", notes = "根据Tenant对象创建租户表")
    public Result<Integer> add(@Validated @ModelAttribute TenantReqDto dto, BindingResult bindingResult) throws Exception {
        BindingResultHandler.handleByException(bindingResult);
        TenantModel model = ObjectCopyUtil.copyObject(dto, TenantModel.class);
        return tenantService.insert(model);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑租户表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute TenantReqDto dto, BindingResult bindingResult) throws Exception {
        BindingResultHandler.handleByException(bindingResult);
        TenantModel model = new TenantModel();
        BeanUtils.copyProperties(dto, model);
        return tenantService.update(model);
    }

    @RequestMapping(value = "get", method = RequestMethod.GET)
    @ApiOperation(value = "获取租户表详细信息")
    public Result<TenantModel> get(@RequestParam Long id) throws Exception {
        return tenantService.select(id);
    }

    @RequestMapping(value = "gets_by_account_id", method = RequestMethod.GET)
    @ApiOperation(value = "根据帐号ID获取租户信息")
    public Result<List<TenantModel>> getsByAccountId(@RequestParam Long accountId) throws Exception {
        return tenantService.selectListByAccountId(accountId);
    }
    @RequestMapping(value = "gets_by_account", method = RequestMethod.GET)
    @ApiOperation(value = "根据帐号(用户名或手机号)获取租户信息")
    public Result<List<TenantModel>> getsByAccount(@RequestParam String account) throws Exception {
        return tenantService.selectListByAccount(account);
    }
    @RequestMapping(value = "get_by_code", method = RequestMethod.GET)
    @ApiOperation(value = "根据租户code获取租户信息")
    public Result<TenantModel> getByCode(@RequestParam String code) throws Exception {
        return tenantService.selectByCode(code);
    }

    @RequestMapping(value = "get_by_code_and_type", method = RequestMethod.GET)
    @ApiOperation(value = "根据租户code获取租户信息")
    public Result<DomainNameModel> getByCode(@RequestParam String code, @RequestParam String platformCode) throws Exception {
        return domainNameService.selectByCodeAndType(code, platformCode);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ApiOperation(value = "删除租户表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception {
        return tenantService.delete(id);
    }

    @RequestMapping(value = "get_limit_employee_count", method = RequestMethod.GET)
    @ApiOperation(value = "获取租户的限制员工数")
    public Result<Integer> getLimitEmployeeCount(@RequestParam Long tenantId) throws Exception {
        return tenantService.getLimitEmployeeCount(tenantId);
    }

}
