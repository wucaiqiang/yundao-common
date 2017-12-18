package com.yundao.common.mapper.base;

import com.yundao.common.model.base.epartmentModel;
import com.yundao.common.model.base.epartmentModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface epartmentModelMapper {
    int countByExample(epartmentModelExample example);

    int deleteByExample(epartmentModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(epartmentModel record);

    int insertSelective(epartmentModel record);

    List<epartmentModel> selectByExample(epartmentModelExample example);

    epartmentModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") epartmentModel record, @Param("example") epartmentModelExample example);

    epartmentModel selectOne(epartmentModelExample example);

    int updateByExample(@Param("record") epartmentModel record, @Param("example") epartmentModelExample example);

    int updateByPrimaryKeySelective(epartmentModel record);

    int updateByPrimaryKey(epartmentModel record);
}