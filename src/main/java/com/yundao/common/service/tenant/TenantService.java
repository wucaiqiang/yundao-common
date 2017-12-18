package com.yundao.common.service.tenant;

import com.yundao.common.dto.BasePageDto;
import com.yundao.common.dto.tenant.TenantDomainDto;
import com.yundao.common.dto.tenant.TenantInitReqDto;
import com.yundao.common.model.base.TenantModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;

import java.util.List;

public interface TenantService {


    public Result<Integer> insert(TenantModel tenant) throws Exception;


    public Result<Integer> update(TenantModel tenant) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<TenantModel> select(Long id) throws Exception;

    public Result<List<TenantModel>> selectListByAccountId(Long accountId) throws Exception;
    public Result<List<TenantModel>> selectListByAccount(String account) throws Exception;

    public Result<TenantModel> selectByCode(String code) throws Exception;

    public Result<PaginationSupport<TenantModel>> selectPage(TenantModel tenantModel, BasePageDto pageDto) throws Exception;

    /**
     * 获取正在启用的租户列表
     */
    List<TenantModel> getEnableList() throws BaseException;

    /**
     * 判断是租户是否已经存在
     * existTenant:
     *
     * @param name
     * @return
     * @throws BaseException
     * @author: 欧阳利
     * @description:
     */
    public boolean existTenant(String name) throws BaseException;

    /**
     * 初始化租户
     * init:
     *
     * @param dto
     * @param tenantDomainDtos
     * @return
     * @throws BaseException
     * @author: 欧阳利
     * @description:
     */
    public Result<Long> doInit(TenantInitReqDto dto, List<TenantDomainDto> tenantDomainDtos) throws Exception;

    /**
     * 初始化租户id
     * initTenantId:
     *
     * @param dto
     * @param tenantId
     * @return
     * @throws Exception
     * @author: 欧阳利
     * @description:
     */
    public int initTenantId(TenantInitReqDto dto, Long tenantId) throws Exception;

    /**
     * 获取租户的限制员工数
     *
     * @param tenantId 租户id
     */
    Result<Integer> getLimitEmployeeCount(Long tenantId) throws BaseException;

}
