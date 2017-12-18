package com.yundao.common.mapper.base;

import com.yundao.common.model.base.ContractModel;
import com.yundao.common.model.base.ContractModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ContractModelMapper {
    int countByExample(ContractModelExample example);

    int deleteByExample(ContractModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ContractModel record);

    int insertSelective(ContractModel record);

    List<ContractModel> selectByExample(ContractModelExample example);

    ContractModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ContractModel record, @Param("example") ContractModelExample example);

    ContractModel selectOne(ContractModelExample example);

    int updateByExample(@Param("record") ContractModel record, @Param("example") ContractModelExample example);

    int updateByPrimaryKeySelective(ContractModel record);

    int updateByPrimaryKey(ContractModel record);
}