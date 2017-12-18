package com.yundao.common.service.system.impl;

import java.util.List;
import java.util.Date;
import com.yundao.common.mapper.base.SystemModelMapper;
import com.yundao.common.mapper.system.SystemMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.SystemModel;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.system.SystemService;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.common.model.base.SystemModelExample;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class SystemServiceImpl extends AbstractService implements SystemService{

    @Autowired
    private SystemModelMapper systemModelMapper;

    @Autowired
    private SystemMapper systemMapper;

    public Result<Integer> insert(SystemModel system) throws Exception{
        system.setCreateDate(new Date());
        int count = systemModelMapper.insertSelective(system);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(SystemModel system) throws Exception{
        system.setUpdateDate(new Date());
        int count = systemModelMapper.updateByPrimaryKeySelective(system);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        SystemModel system = new SystemModel();
        system.setId(id);
        system.setIsDelete(CommonConstant.ONE);
        int count = systemModelMapper.updateByPrimaryKeySelective(system);
        return Result.newSuccessResult(count);
    }

    @Override
	public Result<Boolean> checkLegal(String systemCode) throws Exception {
    	SystemModelExample systemModelExample = new SystemModelExample();
    	SystemModelExample.Criteria criteria = systemModelExample.createCriteria();
    	criteria.andCodeEqualTo(systemCode);
    	SystemModel model=systemModelMapper.selectOne(systemModelExample);
		return Result.newSuccessResult(model !=null?true:false);
	}

	public Result<SystemModel> select(Long id) throws Exception{
       SystemModel model = systemModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<SystemModel>> selectPage(SystemModel systemModel, BasePageDto pageDto) throws Exception{
		SystemModelExample systemModelExample = new SystemModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		SystemModelExample.Criteria criteria = systemModelExample.createCriteria();
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
		systemModelExample.setOrderByClause(orderByClause);
		List<SystemModel> list = systemModelMapper.selectByExample(systemModelExample);
		int totalCount = systemModelMapper.countByExample(systemModelExample);
		PaginationSupport<SystemModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

}
