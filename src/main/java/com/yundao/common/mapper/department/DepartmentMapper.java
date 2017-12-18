package com.yundao.common.mapper.department;

import org.apache.ibatis.annotations.Param;

public interface DepartmentMapper{
    int updateSubset(@Param("oldCode") String oldCode, @Param("newCode")String newCode);
}
