package com.yundao.common.service.contract.impl;

import java.util.List;
import java.util.Date;
import com.yundao.common.mapper.base.ContractModelMapper;
import com.yundao.common.mapper.contract.ContractMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.ContractModel;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.contract.ContractService;
import com.yundao.core.code.Result;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.common.model.base.ContractModelExample;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ContractServiceImpl extends AbstractService implements ContractService{

    @Autowired
    private ContractModelMapper contractModelMapper;

    @Autowired
    private ContractMapper contractMapper;

    public Result<Integer> insert(ContractModel contract) throws Exception{
        contract.setCreateDate(new Date());
        int count = contractModelMapper.insertSelective(contract);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(ContractModel contract) throws Exception{
        contract.setUpdateDate(new Date());
        int count = contractModelMapper.updateByPrimaryKeySelective(contract);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        ContractModel contract = new ContractModel();
        contract.setId(id);
        contract.setIsDelete(CommonConstant.ONE);
        int count = contractModelMapper.updateByPrimaryKeySelective(contract);
        return Result.newSuccessResult(count);
    }

    public Result<ContractModel> select(Long id) throws Exception{
       ContractModel model = contractModelMapper.selectByPrimaryKey(id);
       return Result.newSuccessResult(model);
    }

    public Result<PaginationSupport<ContractModel>> selectPage(ContractModel contractModel, BasePageDto pageDto) throws Exception{
		ContractModelExample contractModelExample = new ContractModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		ContractModelExample.Criteria criteria = contractModelExample.createCriteria();
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
		contractModelExample.setOrderByClause(orderByClause);
		List<ContractModel> list = contractModelMapper.selectByExample(contractModelExample);
		int totalCount = contractModelMapper.countByExample(contractModelExample);
		PaginationSupport<ContractModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

}
