package com.yundao.common.service.resource.impl;

import java.util.List;
import java.util.Date;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.mapper.base.ResourceModelMapper;
import com.yundao.common.mapper.resource.ResourceMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.ResourceModel;
import com.yundao.common.model.base.RoleResourceModel;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.resource.ResourceService;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.common.model.base.ResourceModelExample;
import com.yundao.core.utils.HierarchyCodeUtils;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ResourceServiceImpl extends AbstractService implements ResourceService{

    @Autowired
    private ResourceModelMapper resourceModelMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    public Result<Integer> insert(ResourceModel resource) throws Exception{
        resource.setCreateDate(new Date());
        int count = resourceModelMapper.insertSelective(resource);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(ResourceModel resource) throws Exception{
        resource.setUpdateDate(new Date());
        int count = resourceModelMapper.updateByPrimaryKeySelective(resource);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        ResourceModel resource = new ResourceModel();
        resource.setId(id);
        resource.setIsDelete(CommonConstant.ONE);
        int count = resourceModelMapper.updateByPrimaryKeySelective(resource);
        return Result.newSuccessResult(count);
    }

    public Result<ResourceModel> select(Long id) throws Exception{
       ResourceModel model = resourceModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<ResourceModel>> selectPage(ResourceModel resourceModel, BasePageDto pageDto) throws Exception{
		ResourceModelExample resourceModelExample = new ResourceModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		ResourceModelExample.Criteria criteria = resourceModelExample.createCriteria();
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
		resourceModelExample.setOrderByClause(orderByClause);
		List<ResourceModel> list = resourceModelMapper.selectByExample(resourceModelExample);
		int totalCount = resourceModelMapper.countByExample(resourceModelExample);
		PaginationSupport<ResourceModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<ResourceModel>> getsByRoleId(Long roleId) throws BaseException {

        return null;
    }

    @Override
    public List<ResourceModel> getByRoleResources(List<RoleResourceModel> roleResourceModels) {
        if(roleResourceModels == null || roleResourceModels.isEmpty()){
            return null;
        }
        return resourceMapper.getByRoleResources(roleResourceModels);
    }
}
