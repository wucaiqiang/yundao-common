package com.yundao.common.service.tenantinitdepartment.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.mapper.base.DepartmentModelMapper;
import com.yundao.common.mapper.base.TenantInitDepartmentModelMapper;
import com.yundao.common.mapper.base.TenantModelMapper;
import com.yundao.common.mapper.tenantinitdepartment.TenantInitDepartmentMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.*;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.tenantinitdepartment.TenantInitDepartmentService;
import com.yundao.common.util.LambdaFilter;
import com.yundao.core.code.Result;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class TenantInitDepartmentServiceImpl extends AbstractService  implements TenantInitDepartmentService{

    @Autowired
    private TenantInitDepartmentModelMapper tenantInitDepartmentModelMapper;

    @Autowired
    private TenantInitDepartmentMapper tenantInitDepartmentMapper;

    @Autowired
    private TenantModelMapper tenantModelMapper;

    @Autowired
    private DepartmentModelMapper departmentModelMapper;

    public Result<Integer> insert(TenantInitDepartmentModel tenantInitDepartment) throws Exception{
        tenantInitDepartment.setCreateDate(new Date());
        tenantInitDepartment.setId(null);
        int count = tenantInitDepartmentModelMapper.insertSelective(tenantInitDepartment);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(TenantInitDepartmentModel tenantInitDepartment) throws Exception{
        tenantInitDepartment.setUpdateDate(new Date());
        int count = tenantInitDepartmentModelMapper.updateByPrimaryKeySelective(tenantInitDepartment);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        TenantInitDepartmentModel tenantInitDepartment = new TenantInitDepartmentModel();
        tenantInitDepartment.setId(id);
        tenantInitDepartment.setIsDelete(CommonConstant.ONE);
        int count = tenantInitDepartmentModelMapper.updateByPrimaryKeySelective(tenantInitDepartment);
        return Result.newSuccessResult(count);
    }

    public Result<TenantInitDepartmentModel> select(Long id) throws Exception{
       TenantInitDepartmentModel model = tenantInitDepartmentModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<TenantInitDepartmentModel>> selectPage(TenantInitDepartmentModel tenantInitDepartmentModel, BasePageDto pageDto) throws Exception{
		TenantInitDepartmentModelExample tenantInitDepartmentModelExample = new TenantInitDepartmentModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		TenantInitDepartmentModelExample.Criteria criteria = tenantInitDepartmentModelExample.createCriteria();
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
		tenantInitDepartmentModelExample.setOrderByClause(orderByClause);
		List<TenantInitDepartmentModel> list = tenantInitDepartmentModelMapper.selectByExample(tenantInitDepartmentModelExample);
		int totalCount = tenantInitDepartmentModelMapper.countByExample(tenantInitDepartmentModelExample);
		PaginationSupport<TenantInitDepartmentModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<DepartmentModel>> getTenantDepartment(Long tenantId,String systemCode) {
        List<DepartmentModel> models = tenantInitDepartmentMapper.getTenantDepartment(tenantId,systemCode);
        for (DepartmentModel model : models){
            model.setTenantId(tenantId);
        }
        return Result.newSuccessResult(models);
    }

    @Override
    public Result<TenantInitDepartmentModel> uploadTenantRole(Long tenantId, String departmentIds, String systemCode) throws BaseException {
        TenantModel tenantModel = tenantModelMapper.selectByPrimaryKey(tenantId);
        if(tenantModel == null){
            throw new BaseException(CodeConstant.CODE_1000007);
        }
        String[] departmentSelectIds = departmentIds.split(",");
        List<Long> arrIds  = new ArrayList<Long>();
        for (String id : departmentSelectIds){
            arrIds.add(Long.valueOf(id));
        }
        DepartmentModelExample example = new DepartmentModelExample();
        example.createCriteria().andIdIn(arrIds);
        List<DepartmentModel> DepartmentModels = departmentModelMapper.selectByExample(example);

        TenantInitDepartmentModelExample modelExample = new TenantInitDepartmentModelExample();
        modelExample.createCriteria().andTenantIdEqualTo(tenantId);
        List<TenantInitDepartmentModel> tenantinitDepartments = tenantInitDepartmentModelMapper.selectByExample(modelExample);
        //新增的数据
        for(DepartmentModel DepartmentModel : DepartmentModels){
            TenantInitDepartmentModel tenantinitDepartment = LambdaFilter.firstOrDefault(tenantinitDepartments, m -> m.getDepartmentId().equals(DepartmentModel.getId()));
            if(tenantinitDepartment == null){
                TenantInitDepartmentModel initDepartment = new TenantInitDepartmentModel();
                initDepartment.setCreateDate(new Date());
                initDepartment.setDepartmentId(DepartmentModel.getId());
                initDepartment.setTenantId(tenantId);
                initDepartment.setSequence(NumberEnum.ZERO.getValue());
                initDepartment.setTenantType(tenantModel.getType());
                initDepartment.setSystemCode(systemCode);
                tenantInitDepartmentModelMapper.insertSelective(initDepartment);
            }
        }

        //本次操作需要为角色删除的资源
        for (TenantInitDepartmentModel initDepartment : tenantinitDepartments) {
            DepartmentModel role = null;
            if (BooleanUtils.isNotEmpty(DepartmentModels))
                role = LambdaFilter.firstOrDefault(DepartmentModels, m -> m.getId().equals(initDepartment.getDepartmentId()));
            if (role == null) {
                //表示该资源已经被删除
                tenantInitDepartmentModelMapper.deleteByPrimaryKey(initDepartment.getId());
            }
        }

        return Result.newSuccessResult();
    }

}
