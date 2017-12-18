package com.yundao.common.controller.datasource;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.datasource.DataSourceService;
import com.yundao.common.model.base.DataSourceModel;
import com.yundao.common.dto.datasource.DataSourceReqDto;
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
@RequestMapping(value = "/datasource/")
@ResponseBody
@Api("数据源表")
public class DataSourceController{

    @Autowired
    private DataSourceService dataSourceService;

    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询数据源表")
    public Result<PaginationSupport<DataSourceModel>> getPage(@ModelAttribute DataSourceReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        DataSourceModel model = new DataSourceModel();
        BeanUtils.copyProperties(dto,model);
		return dataSourceService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增数据源表", notes="根据DataSource对象创建数据源表")
    public Result<Integer> add(@Validated @ModelAttribute DataSourceReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        DataSourceModel model = new DataSourceModel();
        BeanUtils.copyProperties(dto,model);
        return dataSourceService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑数据源表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute DataSourceReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        DataSourceModel model = new DataSourceModel();
        BeanUtils.copyProperties(dto,model);
        return dataSourceService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取数据源表详细信息")
    public Result<DataSourceModel> get(@RequestParam Long id) throws Exception{
       return dataSourceService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除数据源表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return dataSourceService.delete(id);
    }

    @RequestMapping(value = "get_tenant", method=RequestMethod.GET)
    @ApiOperation(value="根据系统编码与租户ID查询数据源")
    public Result<DataSourceModel> get(@RequestParam String systemCode,@RequestParam Long tenantId) throws Exception{
        return dataSourceService.selectTenant(systemCode,tenantId);
    }
}
