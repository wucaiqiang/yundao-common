package com.yundao.common.mapper.base;

import com.yundao.common.model.base.DataSourceModel;
import com.yundao.common.model.base.DataSourceModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DataSourceModelMapper {
    int countByExample(DataSourceModelExample example);

    int deleteByExample(DataSourceModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(DataSourceModel record);

    int insertSelective(DataSourceModel record);

    List<DataSourceModel> selectByExample(DataSourceModelExample example);

    DataSourceModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") DataSourceModel record, @Param("example") DataSourceModelExample example);

    DataSourceModel selectOne(DataSourceModelExample example);

    int updateByExample(@Param("record") DataSourceModel record, @Param("example") DataSourceModelExample example);

    int updateByPrimaryKeySelective(DataSourceModel record);

    int updateByPrimaryKey(DataSourceModel record);
}