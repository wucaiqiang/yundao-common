package com.yundao.common.service.roleresource.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import com.yundao.common.mapper.base.ResourceModelMapper;
import com.yundao.common.mapper.base.RoleModelMapper;
import com.yundao.common.mapper.base.RoleResourceModelMapper;
import com.yundao.common.mapper.roleresource.RoleResourceMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.*;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.roleresource.RoleResourceService;
import com.yundao.common.util.LambdaFilter;
import com.yundao.core.code.Result;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class RoleResourceServiceImpl extends AbstractService implements RoleResourceService{

    @Autowired
    private RoleResourceModelMapper roleResourceModelMapper;

    @Autowired
    private RoleResourceMapper roleResourceMapper;

    @Autowired
    private RoleModelMapper roleModelMapper;

    @Autowired
    private ResourceModelMapper resourceModelMapper;

    public Result<Integer> insert(RoleResourceModel roleResource) throws Exception{
        roleResource.setCreateDate(new Date());
        roleResource.setId(null);
        int count = roleResourceModelMapper.insertSelective(roleResource);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(RoleResourceModel roleResource) throws Exception{
        roleResource.setUpdateDate(new Date());
        int count = roleResourceModelMapper.updateByPrimaryKeySelective(roleResource);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        RoleResourceModel roleResource = new RoleResourceModel();
        roleResource.setId(id);
        roleResource.setIsDelete(CommonConstant.ONE);
        int count = roleResourceModelMapper.updateByPrimaryKeySelective(roleResource);
        return Result.newSuccessResult(count);
    }

    public Result<RoleResourceModel> select(Long id) throws Exception{
       RoleResourceModel model = roleResourceModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<RoleResourceModel>> selectPage(RoleResourceModel roleResourceModel, BasePageDto pageDto) throws Exception{
		RoleResourceModelExample roleResourceModelExample = new RoleResourceModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		RoleResourceModelExample.Criteria criteria = roleResourceModelExample.createCriteria();
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
		roleResourceModelExample.setOrderByClause(orderByClause);
		List<RoleResourceModel> list = roleResourceModelMapper.selectByExample(roleResourceModelExample);
		int totalCount = roleResourceModelMapper.countByExample(roleResourceModelExample);
		PaginationSupport<RoleResourceModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

    @Override
    public List<RoleResourceModel> getByRoles(List<RoleModel> roleModels) {
        if(roleModels == null || roleModels.isEmpty()){
            return null;
        }
        return roleResourceMapper.getByRoles(roleModels);
    }

    @Override
    public Result<Integer> updateRoleResource(String resourcesIds, Long roleId) {
        List<ResourceModel> resources = new ArrayList<>();
        if (BooleanUtils.isNotEmpty(resourcesIds)) {
            ResourceModelExample resourceExample = new ResourceModelExample();
            String[] idArray = resourcesIds.split(",");
            List<Long> ids = new ArrayList<>(idArray.length);
            for (String idStr : idArray) {
                if (BooleanUtils.isNotEmpty(idStr))
                    ids.add(NumberUtils.toLong(idStr));
            }
            resourceExample.createCriteria().andIdIn(ids);
            //本次操作，为该角色勾选的所有资源
            resources = resourceModelMapper.selectByExample(resourceExample);
        }

        //该角色原有的资源
        List<RoleResourceModel> roleResourceRels = roleResourceMapper.getByRoleId(roleId);

        //本次操作需要为角色增加的资源
        for (ResourceModel resource : resources) {
            RoleResourceModel roleResource = LambdaFilter.firstOrDefault(roleResourceRels, m -> m.getResourceId().equals(resource.getId()));
            if (roleResource == null) {
                //表示为角色添加了该资源
                roleResource = new RoleResourceModel();
                roleResource.setResourceId(resource.getId());
                roleResource.setRoleId(roleId);
                roleResource.setSequence(NumberEnum.ZERO.getValue());
                roleResource.setCreateDate(new Date());
                roleResourceModelMapper.insertSelective(roleResource);
            }
        }

        //本次操作需要为角色删除的资源
        for (RoleResourceModel roleResourceRel : roleResourceRels) {
            ResourceModel reousrce = null;
            if (BooleanUtils.isNotEmpty(resources))
                reousrce = LambdaFilter.firstOrDefault(resources, m -> m.getId().equals(roleResourceRel.getResourceId()));
            if (reousrce == null) {
                //表示该资源已经被删除
                roleResourceModelMapper.deleteByPrimaryKey(roleResourceRel.getId());
            }
        }
        return Result.newSuccessResult();
    }

}
