package com.yundao.common.service.domainname;

import com.yundao.common.dto.BasePageDto;
import com.yundao.common.dto.domainname.TenantDomainResDto;
import com.yundao.common.dto.tenant.TenantDomainDto;
import com.yundao.common.model.base.DomainNameModel;
import com.yundao.common.model.base.TenantModel;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;

import java.util.List;

public interface DomainNameService {


	public Result<Integer> insert(List<TenantDomainDto> tenantDomainDtos,Long tenantId) throws Exception;
	
    public Result<Integer> insert(DomainNameModel domainName) throws Exception;


    public Result<Integer> update(DomainNameModel domainName) throws Exception;


    public Result<Integer> delete(Long id) throws Exception;


    public Result<DomainNameModel> select(Long id) throws Exception;

    /**
     * 根据系统编码与域名查询租户信息
     *
     * @param systemCode
     * @param url
     * @return
     * @throws Exception
     */
    public Result<TenantModel> select(String systemCode, String url) throws Exception;

    public Result<PaginationSupport<DomainNameModel>> selectPage(DomainNameModel domainNameModel, BasePageDto pageDto) throws Exception;

    /**
     * 获取租户域名列表
     */
    Result<List<TenantDomainResDto>> getTenantDomains() throws BaseException;
    /**
     * 获取租户具体类型的域名
     * selectByCodeAndType:
     * @author: wucq
     * @param code
     * @param platformCode
     * @return
     * @throws Exception
     * @description:
     */
    public Result<DomainNameModel> selectByCodeAndType(String code,String platformCode) throws Exception;


    /**
     * 获取域名下的url
     * @param tenantId
     * @param platformCodes
     * @return
     */
    Result<List<DomainNameModel>> getDomainBytp(Long tenantId, String platformCodes);

    public boolean existDomainUrl(String domainUrl)throws BaseException;

}
