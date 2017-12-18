package com.yundao.common.service.department.impl;

import java.util.Date;
import java.util.List;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.yundao.common.enums.EnabledStatusEnum;
import com.yundao.common.mapper.department.DepartmentMapper;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.mapper.base.DepartmentModelMapper;
import com.yundao.common.model.base.DepartmentModel;
import com.yundao.common.model.base.DepartmentModelExample;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.department.DepartmentService;
import com.yundao.core.code.Result;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.utils.HierarchyCodeUtils;
import com.yundao.core.utils.Limit;

@Service
public class DepartmentServiceImpl extends AbstractService implements DepartmentService{

    @Autowired
    private DepartmentModelMapper departmentModelMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    public Result<Integer> insert(DepartmentModel department) throws Exception{
        Long parentId = department.getParentId();
        String code = getCode(parentId);
        department.setCode(code);
        department.setCreateDate(new Date());
        int count = departmentModelMapper.insertSelective(department);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(DepartmentModel department) throws Exception{
        department.setUpdateDate(new Date());
        DepartmentModel oldModel = departmentModelMapper.selectByPrimaryKey(department.getId());
        int count = 0;
        if(oldModel.getParentId() != department.getParentId()){
            DepartmentModel parentModel = departmentModelMapper.selectByPrimaryKey(department.getParentId());
            String code = moveDepartment(oldModel,parentModel);
            department.setCode(code);
            //修改自己
            departmentModelMapper.updateByPrimaryKeySelective(department);
            //修改之前的子集
            count = departmentMapper.updateSubset(oldModel.getCode(),code);
        }else {
            //修改自己的信息
            count = departmentModelMapper.updateByPrimaryKeySelective(department);
        }
        return Result.newSuccessResult(count);
    }

    /**
     * 移动部门到新部门
     * @param oldModel
     * @param parentModel
     */
    private String moveDepartment(DepartmentModel oldModel, DepartmentModel parentModel) throws BaseException {
        if(parentModel == null || oldModel == null){
            throw new BaseException(CodeConstant.CODE_1000002);
        }
        if(parentModel.getCode().indexOf(oldModel.getCode()) == 0){
            throw new BaseException(CodeConstant.CODE_1000000);
        }
        return getCode(parentModel.getId());
    }

    private String getCode(Long parentId) {
        String parentCode = null;
        if(parentId != null) {
            DepartmentModel parentModel = departmentModelMapper.selectByPrimaryKey(parentId);
            parentCode = parentModel != null ? parentModel.getCode() : null;
        }
        //获取当前parentId的最后一条数据，设置code
        DepartmentModelExample example = new DepartmentModelExample();
        DepartmentModelExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        example.setOrderByClause("code DESC");
        DepartmentModel lastModel = departmentModelMapper.selectOne(example);
        String peerCode = lastModel != null ? lastModel.getCode() : null;
        return HierarchyCodeUtils.getCode(peerCode, parentId, parentCode);
    }

    public Result<Integer> delete(Long id) throws Exception{
        DepartmentModel department = new DepartmentModel();
        department.setId(id);
        department.setIsDelete(CommonConstant.ONE);
        int count = departmentModelMapper.updateByPrimaryKeySelective(department);
        return Result.newSuccessResult(count);
    }

    public Result<DepartmentModel> select(Long id) throws Exception{
       DepartmentModel model = departmentModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<DepartmentModel>> selectPage(DepartmentModel departmentModel, BasePageDto pageDto) throws Exception{
		DepartmentModelExample departmentModelExample = new DepartmentModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		DepartmentModelExample.Criteria criteria = departmentModelExample.createCriteria();
		String orderByClause="create_date desc";
		if(StringUtils.isNotBlank(pageDto.getOrderColumn())){
		  StringBuilder orderBuider=new StringBuilder();
		  orderBuider.append(pageDto.getOrderColumn()).append(" ");
		  if(StringUtils.isNotBlank(pageDto.getSort())){
			orderBuider.append(pageDto.getSort());
		  }else{
			orderBuider.append("desc");
		  }
		  orderByClause=orderBuider.toString();
		}
		departmentModelExample.setOrderByClause(orderByClause);
		List<DepartmentModel> list = departmentModelMapper.selectByExample(departmentModelExample);
		int totalCount = departmentModelMapper.countByExample(departmentModelExample);
		PaginationSupport<DepartmentModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<DepartmentModel>> getAll() {
        return Result.newSuccessResult(departmentModelMapper.selectByExample(null));
    }

    @Override
    public Result<Integer> processEnabled(Long id, EnabledStatusEnum enabled) {
        DepartmentModel model = new DepartmentModel();
        model.setId(id);
        model.setIsEnabled(enabled.getStatus());
        return Result.newSuccessResult(departmentModelMapper.updateByPrimaryKeySelective(model));
    }

}
