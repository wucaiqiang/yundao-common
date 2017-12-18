package com.yundao.common.service.datasource;

import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.DataSourceModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;

public interface DataSourceService{


    public Result<Integer> insert(DataSourceModel dataSource) throws Exception;


    public Result<Integer> update(DataSourceModel dataSource) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<DataSourceModel> select(Long id) throws Exception;

    public Result<PaginationSupport<DataSourceModel>> selectPage(DataSourceModel dataSourceModel, BasePageDto pageDto) throws Exception;

    Result<DataSourceModel> selectTenant(String systemCode, Long tenantId) throws Exception;
    
    /**
     * 数据源是否已经存在
     * existDataSource:
     * @author: 欧阳利
     * @param url
     * @return
     * @throws BaseException
     * @description:
     */
    public boolean existDataSource(String url) throws BaseException;
}
