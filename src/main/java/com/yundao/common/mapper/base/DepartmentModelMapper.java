package com.yundao.common.mapper.base;

import com.yundao.common.model.base.DepartmentModel;
import com.yundao.common.model.base.DepartmentModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentModelMapper {
    int countByExample(DepartmentModelExample example);

    int deleteByExample(DepartmentModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(DepartmentModel record);

    int insertSelective(DepartmentModel record);

    List<DepartmentModel> selectByExample(DepartmentModelExample example);

    DepartmentModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") DepartmentModel record, @Param("example") DepartmentModelExample example);

    DepartmentModel selectOne(DepartmentModelExample example);

    int updateByExample(@Param("record") DepartmentModel record, @Param("example") DepartmentModelExample example);

    int updateByPrimaryKeySelective(DepartmentModel record);

    int updateByPrimaryKey(DepartmentModel record);
}