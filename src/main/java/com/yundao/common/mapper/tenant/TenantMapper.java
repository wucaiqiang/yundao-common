package com.yundao.common.mapper.tenant;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yundao.common.model.base.TenantModel;

public interface TenantMapper{
   public List<TenantModel> selectListByAccountId(@Param("userId") Long userId);
}
