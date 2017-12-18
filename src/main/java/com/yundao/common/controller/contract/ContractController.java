package com.yundao.common.controller.contract;
import com.yundao.common.dto.BasePageDto;

import com.yundao.common.service.contract.ContractService;
import com.yundao.common.model.base.ContractModel;
import com.yundao.common.dto.contract.ContractReqDto;
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
@RequestMapping(value = "/contract/")
@ResponseBody
@Api("合同表")
public class ContractController{

    @Autowired
    private ContractService contractService;

    @RequestMapping(value = "get_page",method=RequestMethod.GET)
    @ApiOperation(value="分页查询合同表")
    public Result<PaginationSupport<ContractModel>> getPage(@ModelAttribute ContractReqDto dto, @ModelAttribute BasePageDto pageDto) throws Exception{
        ContractModel model = new ContractModel();
        BeanUtils.copyProperties(dto,model);
		return contractService.selectPage(model, pageDto);
    }

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增合同表", notes="根据Contract对象创建合同表")
    public Result<Integer> add(@Validated @ModelAttribute ContractReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        ContractModel model = ObjectCopyUtil.copyObject(dto,ContractModel.class);
        return contractService.insert(model);
    }

    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑合同表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute ContractReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        ContractModel model = new ContractModel();
        BeanUtils.copyProperties(dto,model);
        return contractService.update(model);
    }

    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取合同表详细信息")
    public Result<ContractModel> get(@RequestParam Long id) throws Exception{
       return contractService.select(id);
    }

    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除合同表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return contractService.delete(id);
    }

}
