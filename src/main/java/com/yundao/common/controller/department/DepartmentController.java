package com.yundao.common.controller.department;

import com.yundao.common.dto.department.DepartmentReqDto;
import com.yundao.common.enums.EnabledStatusEnum;
import com.yundao.common.model.base.DepartmentModel;
import com.yundao.common.service.department.DepartmentService;
import com.yundao.core.code.Result;
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
@RequestMapping(value = "/department/")
@ResponseBody
@Api(value = "部门管理")
public class DepartmentController{

    @Autowired
    private DepartmentService departmentService;

//    /**
//     * 分页查询部门表
//     * @param departmentModel
//     * @param pageDto
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "get_page",method=RequestMethod.GET)
//    @ApiOperation(value="分页查询部门表")
//    public Result<PaginationSupport<DepartmentModel>> getPage(@ModelAttribute DepartmentModel departmentModel, @ModelAttribute BasePageDto pageDto) throws Exception{
//		return departmentService.selectPage(departmentModel, pageDto);
//    }

    /**
     * 新增部门表
     * @param dto
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增部门表", notes="根据Department对象创建部门表")
    public Result<Integer> add(@Validated @ModelAttribute DepartmentReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        DepartmentModel model = ObjectCopyUtil.copyObject(dto,DepartmentModel.class);
        return departmentService.insert(model);
    }

    /**
     * 编辑部门表信息
     * @param dto
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "update", method=RequestMethod.POST)
    @ApiOperation(value="编辑部门表信息")
    public Result<Integer> update(@Validated(value = {Update.class}) @ModelAttribute DepartmentReqDto dto, BindingResult bindingResult) throws Exception{
        BindingResultHandler.handleByException(bindingResult);
        DepartmentModel model = new DepartmentModel();
        BeanUtils.copyProperties(dto,model);
        return departmentService.update(model);
    }

    /**
     * 获取部门表详细信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "get", method=RequestMethod.GET)
    @ApiOperation(value="获取部门表详细信息")
    public Result<DepartmentModel> get(@RequestParam Long id) throws Exception{
       return departmentService.select(id);
    }

    /**
     * 删除部门表信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="删除部门表信息")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return departmentService.delete(id);
    }

    /**
     * 查询所有部门
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "get_all", method = RequestMethod.GET)
    @ApiOperation(value = "获取所有部门")
    public Result<List<DepartmentModel>> getAll() throws Exception{
        return departmentService.getAll();
    }

    /**
     * 启用部门
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "enabled", method = RequestMethod.POST)
    @ApiOperation(value = "启用部门")
    public Result<Integer> enabled(@RequestParam Long id) throws Exception{
        return departmentService.processEnabled(id, EnabledStatusEnum.ENABLED);
    }

    /**
     * 启用部门
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "clear_enabled", method = RequestMethod.POST)
    @ApiOperation(value = "禁用部门")
    public Result<Integer> clearEnabled(@RequestParam Long id) throws Exception{
        return departmentService.processEnabled(id,EnabledStatusEnum.CLEAR_ENABLED);
    }
}
