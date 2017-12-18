package com.yundao.common.service.role.impl;

import java.util.List;
import java.util.Date;
import com.yundao.common.mapper.base.RoleModelMapper;
import com.yundao.common.mapper.role.RoleMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.RoleModel;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.role.RoleService;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.common.model.base.RoleModelExample;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class RoleServiceImpl extends AbstractService implements RoleService{

    @Autowired
    private RoleModelMapper roleModelMapper;

    @Autowired
    private RoleMapper roleMapper;

    public Result<Integer> insert(RoleModel role) throws Exception{
        role.setCreateDate(new Date());
        role.setId(null);
        int count = roleModelMapper.insertSelective(role);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(RoleModel role) throws Exception{
        role.setUpdateDate(new Date());
        int count = roleModelMapper.updateByPrimaryKeySelective(role);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        RoleModel role = new RoleModel();
        role.setId(id);
        role.setIsDelete(CommonConstant.ONE);
        int count = roleModelMapper.updateByPrimaryKeySelective(role);
        return Result.newSuccessResult(count);
    }

    public Result<RoleModel> select(Long id) throws Exception{
       RoleModel model = roleModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<RoleModel>> selectPage(RoleModel roleModel, BasePageDto pageDto) throws Exception{
		RoleModelExample roleModelExample = new RoleModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		RoleModelExample.Criteria criteria = roleModelExample.createCriteria();
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
		roleModelExample.setOrderByClause(orderByClause);
		List<RoleModel> list = roleModelMapper.selectByExample(roleModelExample);
		int totalCount = roleModelMapper.countByExample(roleModelExample);
		PaginationSupport<RoleModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

}
