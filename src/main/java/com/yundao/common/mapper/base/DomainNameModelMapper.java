package com.yundao.common.mapper.base;

import com.yundao.common.model.base.DomainNameModel;
import com.yundao.common.model.base.DomainNameModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DomainNameModelMapper {
    int countByExample(DomainNameModelExample example);

    int deleteByExample(DomainNameModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(DomainNameModel record);

    int insertSelective(DomainNameModel record);

    List<DomainNameModel> selectByExample(DomainNameModelExample example);

    DomainNameModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") DomainNameModel record, @Param("example") DomainNameModelExample example);

    DomainNameModel selectOne(DomainNameModelExample example);

    int updateByExample(@Param("record") DomainNameModel record, @Param("example") DomainNameModelExample example);

    int updateByPrimaryKeySelective(DomainNameModel record);

    int updateByPrimaryKey(DomainNameModel record);
}