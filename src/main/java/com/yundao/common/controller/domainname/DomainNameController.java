package com.yundao.common.controller.domainname;

import com.yundao.common.dto.BasePageDto;

import com.yundao.common.dto.domainname.TenantDomainResDto;
import com.yundao.common.service.domainname.DomainNameService;
import com.yundao.common.model.base.DomainNameModel;
import com.yundao.common.model.base.TenantModel;
import com.yundao.common.dto.domainname.DomainNameReqDto;
import com.yundao.core.code.Result;
import com.yundao.core.validator.group.Update;
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
@RequestMapping(value = "/domainname/")
@ResponseBody
@Api("域名表")
public class DomainNameController {

    @Autowired
    private DomainNameService domainNameService;

    @RequestMapping(value = "get_page", method = RequestMethod.GET)
    @ApiOperation(value = "分页查询域名表")
    public Result<PaginationSupport<DomainNameModel>> getPage(@ModelAttribute DomainNameReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception {
        DomainNameModel model = new DomainNameModel();
        BeanUtils.copyProperties(dto, model);
        return domainNameService.selectPage(model, pageDto);
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ApiOperation(value = "新增域名表", notes = "根据DomainName对象创建域名表")
    public Result<Integer> add(@Validated @ModelAttribute DomainNameReqDto dto, BindingResult bindingResult) throws Exception {
        BindingResultHandler.handleByException(bindingResult);
        DomainNameModel model = new DomainNameModel();
        BeanUtils.copyProperties(dto, model);
        return domainNameService.insert(model);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑域名表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute DomainNameReqDto dto, BindingResult bindingResult) throws Exception {
        BindingResultHandler.handleByException(bindingResult);
        DomainNameModel model = new DomainNameModel();
        BeanUtils.copyProperties(dto, model);
        return domainNameService.update(model);
    }

    @RequestMapping(value = "get", method = RequestMethod.GET)
    @ApiOperation(value = "获取域名表详细信息")
    public Result<DomainNameModel> get(@RequestParam Long id) throws Exception {
        return domainNameService.select(id);
    }

    @RequestMapping(value = "get_tenant", method = RequestMethod.GET)
    @ApiOperation(value = "根据系统编码与域名查询租户信息")
    public Result<TenantModel> get(@RequestParam String systemCode, @RequestParam String url) throws Exception {
        return domainNameService.select(systemCode, url);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ApiOperation(value = "删除域名表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception {
        return domainNameService.delete(id);
    }

    @RequestMapping(value = "get_tenant_domain", method = RequestMethod.GET)
    @ApiOperation(value = "根据系统编码与域名查询租户信息")
    public Result<List<TenantDomainResDto>> getTenantDomain() throws
            Exception {
        return domainNameService.getTenantDomains();
    }

    @RequestMapping(value = "get_domain_bytp",method = RequestMethod.GET)
    @ApiOperation(value = "批量获取租户下多个平台")
    public Result<List<DomainNameModel>> getDomainBytp(@RequestParam Long tenantId,@RequestParam String platformCodes){
        return domainNameService.getDomainBytp(tenantId,platformCodes);
    }
}
