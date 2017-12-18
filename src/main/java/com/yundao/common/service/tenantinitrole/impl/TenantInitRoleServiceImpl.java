package com.yundao.common.service.tenantinitrole.impl;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Date;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.tenantinitrole.TenantinitRoleDto;
import com.yundao.common.mapper.base.RoleModelMapper;
import com.yundao.common.mapper.base.TenantInitRoleModelMapper;
import com.yundao.common.mapper.base.TenantModelMapper;
import com.yundao.common.mapper.tenantinitrole.TenantInitRoleMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.*;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.resource.ResourceService;
import com.yundao.common.service.roleresource.RoleResourceService;
import com.yundao.common.service.roleresource.impl.RoleResourceServiceImpl;
import com.yundao.common.service.tenantinitrole.TenantInitRoleService;
import com.yundao.common.util.LambdaFilter;
import com.yundao.core.code.Result;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.Limit;
import io.swagger.models.auth.In;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class TenantInitRoleServiceImpl extends AbstractService implements TenantInitRoleService{

    @Autowired
    private TenantInitRoleModelMapper tenantInitRoleModelMapper;

    @Autowired
    private TenantInitRoleMapper tenantInitRoleMapper;

    @Autowired
    private RoleResourceService roleResourceService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private RoleModelMapper roleModelMapper;

    @Autowired
    private TenantModelMapper tenantModelMapper;

    public Result<Integer> insert(TenantInitRoleModel tenantInitRole) throws Exception{
        tenantInitRole.setCreateDate(new Date());
        tenantInitRole.setId(null);
        int count = tenantInitRoleModelMapper.insertSelective(tenantInitRole);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(TenantInitRoleModel tenantInitRole) throws Exception{
        tenantInitRole.setUpdateDate(new Date());
        int count = tenantInitRoleModelMapper.updateByPrimaryKeySelective(tenantInitRole);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        TenantInitRoleModel tenantInitRole = new TenantInitRoleModel();
        tenantInitRole.setId(id);
        tenantInitRole.setIsDelete(CommonConstant.ONE);
        int count = tenantInitRoleModelMapper.updateByPrimaryKeySelective(tenantInitRole);
        return Result.newSuccessResult(count);
    }

    public Result<TenantInitRoleModel> select(Long id) throws Exception{
       TenantInitRoleModel model = tenantInitRoleModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<TenantInitRoleModel>> selectPage(TenantInitRoleModel tenantInitRoleModel, BasePageDto pageDto) throws Exception{
		TenantInitRoleModelExample tenantInitRoleModelExample = new TenantInitRoleModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		TenantInitRoleModelExample.Criteria criteria = tenantInitRoleModelExample.createCriteria();
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
		tenantInitRoleModelExample.setOrderByClause(orderByClause);
		List<TenantInitRoleModel> list = tenantInitRoleModelMapper.selectByExample(tenantInitRoleModelExample);
		int totalCount = tenantInitRoleModelMapper.countByExample(tenantInitRoleModelExample);
		PaginationSupport<TenantInitRoleModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

    @Override
    public Result<TenantinitRoleDto> getTenantRole(Long tenantId, String systemCode) {
        List<RoleModel> roleModels = tenantInitRoleMapper.getRoleModels(tenantId,systemCode);
        List<RoleResourceModel> roleResourceModels = roleResourceService.getByRoles(roleModels);
        List<ResourceModel> resourceModels = resourceService.getByRoleResources(roleResourceModels);
        return Result.newSuccessResult(new TenantinitRoleDto(roleModels,roleResourceModels,resourceModels));
    }

    @Override
    public Result<TenantInitRoleModel> uploadTenantRole(Long tenantId, String roleIds, String systemCode) throws BaseException {
        TenantModel tenantModel = tenantModelMapper.selectByPrimaryKey(tenantId);
        if(tenantModel == null){
            throw new BaseException(CodeConstant.CODE_1000007);
        }
        String[] roleSelectIds = roleIds.split(",");
        List<Long> arrIds  = new ArrayList<Long>();
        for (String id : roleSelectIds){
            arrIds.add(Long.valueOf(id));
        }
        RoleModelExample example = new RoleModelExample();
        example.createCriteria().andIdIn(arrIds);
        List<RoleModel> roleModels = roleModelMapper.selectByExample(example);

        TenantInitRoleModelExample modelExample = new TenantInitRoleModelExample();
        modelExample.createCriteria().andTenantIdEqualTo(tenantId);
        List<TenantInitRoleModel> tenantInitRoleModels = tenantInitRoleModelMapper.selectByExample(modelExample);
        //新增的数据
        for(RoleModel roleModel : roleModels){
            TenantInitRoleModel tenantInitRoleModel = LambdaFilter.firstOrDefault(tenantInitRoleModels,m -> m.getRoleId().equals(roleModel.getId()));
            if(tenantInitRoleModel == null){
                TenantInitRoleModel initRoleModel = new TenantInitRoleModel();
                initRoleModel.setCreateDate(new Date());
                initRoleModel.setRoleId(roleModel.getId());
                initRoleModel.setTenantId(tenantId);
                initRoleModel.setSequence(NumberEnum.ZERO.getValue());
                initRoleModel.setTenantType(tenantModel.getType());
                initRoleModel.setSystemCode(systemCode);
                tenantInitRoleModelMapper.insertSelective(initRoleModel);
            }
        }

        //本次操作需要为角色删除的资源
        for (TenantInitRoleModel initRoleModel : tenantInitRoleModels) {
            RoleModel role = null;
            if (BooleanUtils.isNotEmpty(roleModels))
                role = LambdaFilter.firstOrDefault(roleModels, m -> m.getId().equals(initRoleModel.getRoleId()));
            if (role == null) {
                //表示该资源已经被删除
                tenantInitRoleModelMapper.deleteByPrimaryKey(initRoleModel.getId());
            }
        }

        return Result.newSuccessResult();
    }

}
