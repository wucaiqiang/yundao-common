package com.yundao.common.service.domainname.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.dto.domainname.TenantDomainResDto;
import com.yundao.common.dto.tenant.TenantDomainDto;
import com.yundao.common.mapper.base.DomainNameModelMapper;
import com.yundao.common.mapper.base.TenantModelMapper;
import com.yundao.common.mapper.domainname.DomainNameMapper;
import com.yundao.common.model.base.DomainNameModel;
import com.yundao.common.model.base.DomainNameModelExample;
import com.yundao.common.model.base.TenantModel;
import com.yundao.common.model.base.TenantModelExample;
import com.yundao.common.service.domainname.DomainNameService;
import com.yundao.common.service.system.SystemService;
import com.yundao.common.service.tenant.TenantService;
import com.yundao.common.util.LambdaFilter;
import com.yundao.common.util.LambdaMap;
import com.yundao.core.code.Result;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.service.AbstractService;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.JsonUtils;
import com.yundao.core.utils.Limit;

@Service
public class DomainNameServiceImpl extends AbstractService implements DomainNameService {

    private static Log log = LogFactory.getLog(DomainNameServiceImpl.class);

    @Autowired
    private DomainNameModelMapper domainNameModelMapper;

    @Autowired
    private DomainNameMapper domainNameMapper;
    @Autowired
    private SystemService systemService;
    @Autowired
    private TenantService tenantService;
    
    @Autowired
    private TenantModelMapper tenantModelMapper;

    /**
     * 添加域名
     * insert:
     * @author: 欧阳利
     * @param tenantDomainDtos
     * @param tenantId
     * @return
     * @throws Exception
     * @description:
     */
	public Result<Integer> insert(List<TenantDomainDto> tenantDomainDtos,Long tenantId) throws Exception{
		if(BooleanUtils.isEmpty(tenantDomainDtos)){
			return Result.newSuccessResult(0);
		}
		for(TenantDomainDto dto : tenantDomainDtos){
			DomainNameModel domainName = new DomainNameModel();
			BeanUtils.copyProperties(dto, domainName);
			domainName.setTenantId(tenantId);
			domainName.setSystemCode("WM");
			domainName.setCreateUserId(this.getHeaderUserId());
			insert(domainName);
		}
		return Result.newSuccessResult(tenantDomainDtos.size());
	}
    
    
    public Result<Integer> insert(DomainNameModel domainName) throws Exception {
        domainName.setCreateDate(new Date());
        domainName.setId(null);
        int count = domainNameModelMapper.insertSelective(domainName);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(DomainNameModel domainName) throws Exception {
        domainName.setUpdateDate(new Date());
        int count = domainNameModelMapper.updateByPrimaryKeySelective(domainName);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception {
        DomainNameModel domainName = new DomainNameModel();
        domainName.setId(id);
        domainName.setIsDelete(CommonConstant.ONE);
        int count = domainNameModelMapper.updateByPrimaryKeySelective(domainName);
        return Result.newSuccessResult(count);
    }

    public Result<DomainNameModel> select(Long id) throws Exception {
        DomainNameModel model = domainNameModelMapper.selectByPrimaryKey(id);
        return Result.newSuccessResult(model);
    }

    @Override
    public Result<TenantModel> select(String systemCode, String url) throws Exception {
        DomainNameModelExample domainNameModelExample = new DomainNameModelExample();
        DomainNameModelExample.Criteria criteria = domainNameModelExample.createCriteria();
        criteria.andSystemCodeEqualTo(systemCode);
        criteria.andUrlEqualTo(url);
        Result<Boolean> isLegalResult = systemService.checkLegal(systemCode);
        if (!isLegalResult.getResult()) {
            throw new BaseException(CodeConstant.CODE_1000002);
        }
        DomainNameModel domainNameModel = domainNameModelMapper.selectOne(domainNameModelExample);
        if (domainNameModel == null) {
            throw new BaseException(CodeConstant.CODE_1000004);
        }
        if (domainNameModel.getTenantId() != null) {
            return tenantService.select(domainNameModel.getTenantId());
        }
        return Result.newSuccessResult();
    }

    public Result<PaginationSupport<DomainNameModel>> selectPage(DomainNameModel domainNameModel, BasePageDto pageDto) throws Exception {
        DomainNameModelExample domainNameModelExample = new DomainNameModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
        DomainNameModelExample.Criteria criteria = domainNameModelExample.createCriteria();
        String orderByClause = "create_date desc";
        if (StringUtils.isNotBlank(pageDto.getOrderColumn())) {
            StringBuilder orderBuider = new StringBuilder();
            orderBuider.append(pageDto.getOrderColumn()).append(" ");
            if (StringUtils.isNotBlank(pageDto.getSort())) {
                orderBuider.append(pageDto.getSort());
            } else {
                orderBuider.append("desc");
            }
            orderByClause = orderBuider.toString();
        }
        domainNameModelExample.setOrderByClause(orderByClause);
        List<DomainNameModel> list = domainNameModelMapper.selectByExample(domainNameModelExample);
        int totalCount = domainNameModelMapper.countByExample(domainNameModelExample);
        PaginationSupport<DomainNameModel> result = pageDto.getPaginationSupport();
        result.setDatas(list);
        result.setTotalCount(totalCount);
        return Result.newSuccessResult(result);
    }

    @Override
    public Result<List<TenantDomainResDto>> getTenantDomains() throws BaseException {
        log.begin();
        List<TenantModel> tenants = tenantService.getEnableList();
        log.info("tenants:%s", JsonUtils.objectToJson(tenants));
        if (BooleanUtils.isEmpty(tenants))
            return Result.newSuccessResult(new ArrayList<>());
        DomainNameModelExample example = new DomainNameModelExample();
        example.createCriteria().andTenantIdIn(LambdaMap.toSingleList(tenants, m -> m.getId()));
        List<DomainNameModel> domainNameModels = domainNameModelMapper.selectByExample(example);
        log.info("domainNameModels:%s", JsonUtils.objectToJson(domainNameModels));
        List<TenantDomainResDto> dtos = new ArrayList<>();
        for (DomainNameModel domainNameModel : domainNameModels) {
            TenantModel tenant = LambdaFilter.firstOrDefault(tenants, m -> m.getId().equals(domainNameModel.getTenantId()));
            TenantDomainResDto dto = new TenantDomainResDto();
            dto.setId(domainNameModel.getTenantId());
            dto.setUrl(domainNameModel.getUrl());
            dto.setSystemCode(domainNameModel.getSystemCode());
            dto.setCode(tenant.getCode());
            dto.setName(tenant.getName());
            dto.setType(tenant.getType());
            dtos.add(dto);
        }
        log.info("dtos:%s", JsonUtils.objectToJson(dtos));
        return Result.newSuccessResult(dtos);
    }

	@Override
	public Result<DomainNameModel> selectByCodeAndType(String code, String platformCode) throws Exception {
		TenantModelExample tenantModelExample = new TenantModelExample();
    	TenantModelExample.Criteria criteria = tenantModelExample.createCriteria();
    	criteria.andCodeEqualTo(code);
    	TenantModel tenantModel=tenantModelMapper.selectOne(tenantModelExample);
    	
		DomainNameModelExample dModelExample=new DomainNameModelExample();
    	dModelExample.createCriteria().andTenantIdEqualTo(tenantModel.getId()).andStatusEqualTo(NumberEnum.ONE.getValue()).andPlatformCodeEqualTo(platformCode);
    	DomainNameModel domainNameModel=domainNameModelMapper.selectOne(dModelExample);
    	
		return Result.newSuccessResult(domainNameModel);
		
	}
    @Override
    public Result<List<DomainNameModel>> getDomainBytp(Long tenantId, String platformCodes) {
        List<String> codes = Arrays.asList(platformCodes.split(","));
        DomainNameModelExample dModelExample=new DomainNameModelExample();
        dModelExample.createCriteria().andTenantIdEqualTo(tenantId).andPlatformCodeIn(codes);
        List<DomainNameModel> models = domainNameModelMapper.selectByExample(dModelExample);
        return Result.newSuccessResult(models);
    }

	
	
    /**
     * 检查域名是否存在
     * existDomainUrl:
     * @author: 欧阳利
     * @param domainUrl
     * @return
     * @throws BaseException
     * @description:
     */
    public boolean existDomainUrl(String domainUrl)throws BaseException{
    	DomainNameModelExample example = new DomainNameModelExample();
    	example.createCriteria().andUrlEqualTo(domainUrl);
    	DomainNameModel model = domainNameModelMapper.selectOne(example);
    	return model != null; 
    }
    

}
