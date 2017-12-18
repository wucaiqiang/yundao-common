package com.yundao.common.service.tenant.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.dto.tenant.TenantDomainDto;
import com.yundao.common.dto.tenant.TenantInitReqDto;
import com.yundao.common.mapper.base.RoleModelMapper;
import com.yundao.common.mapper.base.TenantInitRoleModelMapper;
import com.yundao.common.mapper.base.TenantModelMapper;
import com.yundao.common.mapper.base.UserAccountModelMapper;
import com.yundao.common.mapper.tenant.TenantMapper;
import com.yundao.common.model.base.DataSourceModel;
import com.yundao.common.model.base.RoleModel;
import com.yundao.common.model.base.RoleModelExample;
import com.yundao.common.model.base.TenantInitRoleModel;
import com.yundao.common.model.base.TenantModel;
import com.yundao.common.model.base.TenantModelExample;
import com.yundao.common.model.base.UserAccountModelExample;
import com.yundao.common.service.datasource.DataSourceService;
import com.yundao.common.service.domainname.DomainNameService;
import com.yundao.common.service.tenant.TenantService;
import com.yundao.common.util.DBUtils;
import com.yundao.core.code.Result;
import com.yundao.core.code.config.CoreCode;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.enums.NumberEnum;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.service.AbstractService;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.Limit;

@Service
public class TenantServiceImpl extends AbstractService implements TenantService {

	@Autowired
	private TenantModelMapper tenantModelMapper;

	@Autowired
	private TenantMapper tenantMapper;

	@Autowired
	DomainNameService domainNameService;

	@Autowired
	DataSourceService dataSourceService;
	@Autowired
	TenantInitRoleModelMapper tenantInitRoleModelMapper;
	@Autowired
	RoleModelMapper roleModelMapper;
	@Autowired
	private UserAccountModelMapper userAccountModelMapper;

	/**
	 * 初始化租户 init:
	 *
	 * @param dto
	 * @param tenantDomainDtos
	 * @return
	 * @throws BaseException
	 * @author: 欧阳利
	 * @description:
	 */
	public Result<Long> doInit(TenantInitReqDto dto, List<TenantDomainDto> tenantDomainDtos) throws Exception {
		// 添加租户
		TenantModel tenant = new TenantModel();
		BeanUtils.copyProperties(dto, tenant);
		tenant.setCreateDate(new Date());
		tenant.setCreateUserId(this.getHeaderUserId());
		insert(tenant);

		TenantModel record = new TenantModel();
		record.setId(tenant.getId());
		record.setTenantId(tenant.getId());
		tenantModelMapper.updateByPrimaryKeySelective(record);

		// 添加租户角色
		insertTenantInitRole(tenant.getId());
		// 添加域名
		domainNameService.insert(tenantDomainDtos, tenant.getId());

		// 添加数据源
		DataSourceModel dataSource = new DataSourceModel();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setSystemCode("WM");
		dataSource.setName(dto.getName());
		dataSource.setUrl(dto.getDbUrl());
		dataSource.setUsername(dto.getDbUsername());
		dataSource.setPassword(dto.getDbPassword());
		dataSource.setTenantId(tenant.getId());
		dataSourceService.insert(dataSource);

		return Result.newSuccessResult(tenant.getId());
	}

	private void insertTenantInitRole(Long tenantId) {
		RoleModelExample example = new RoleModelExample();
		List<RoleModel> roles = roleModelMapper.selectByExample(example);
		if (!BooleanUtils.isEmpty(roles)) {
			for (int i = 0; i < roles.size(); i++) {
				RoleModel base = roles.get(i);
				TenantInitRoleModel record = new TenantInitRoleModel();
				record.setRoleId(base.getId());
				record.setTenantId(tenantId);
				record.setSystemCode("WM");
				record.setIsDelete(0);
				record.setIsEnabled(1);
				record.setSequence(i + 1);
				tenantInitRoleModelMapper.insert(record);
			}
		}

	}

	/**
	 * 判断是租户是否已经存在 existTenant:
	 *
	 * @param name
	 * @return
	 * @throws BaseException
	 * @author: 欧阳利
	 * @description:
	 */
	public boolean existTenant(String name) throws BaseException {
		TenantModelExample example = new TenantModelExample();
		example.createCriteria().andNameEqualTo(name);
		TenantModel model = tenantModelMapper.selectOne(example);
		return model != null;
	}

	public Result<Integer> insert(TenantModel tenant) throws Exception {
		tenant.setCreateDate(new Date());
		int count = tenantModelMapper.insertSelective(tenant);
		return Result.newSuccessResult(count);
	}

	public Result<Integer> update(TenantModel tenant) throws Exception {
		tenant.setUpdateDate(new Date());
		int count = tenantModelMapper.updateByPrimaryKeySelective(tenant);
		return Result.newSuccessResult(count);
	}

	public Result<Integer> delete(Long id) throws Exception {
		TenantModel tenant = new TenantModel();
		tenant.setId(id);
		tenant.setIsDelete(CommonConstant.ONE);
		int count = tenantModelMapper.updateByPrimaryKeySelective(tenant);
		return Result.newSuccessResult(count);
	}

	public Result<TenantModel> select(Long id) throws Exception {
		TenantModel model = tenantModelMapper.selectByPrimaryKey(id);
		return Result.newSuccessResult(model);
	}

	@Override
	public Result<List<TenantModel>> selectListByAccountId(Long accountId) throws Exception {
		List<TenantModel> tenantModels = tenantMapper.selectListByAccountId(accountId);
		return Result.newSuccessResult(tenantModels);
	}

	@Override
	public Result<List<TenantModel>> selectListByAccount(String account) throws Exception {
		if (StringUtils.isBlank(account)) {
			throw new BaseException(CodeConstant.CODE_1000067);
		}
		// 查手机
		UserAccountModelExample userAccountExample = new UserAccountModelExample();
		userAccountExample.createCriteria().andMobileEqualTo(account);
		com.yundao.common.model.base.UserAccountModel userAccount = userAccountModelMapper
				.selectOne(userAccountExample);
		// 为空查用户名
		if (userAccount == null) {
			userAccountExample = new UserAccountModelExample();
			userAccountExample.createCriteria().andUsernameEqualTo(account);
			userAccount = userAccountModelMapper.selectOne(userAccountExample);
		}
		if (userAccount == null) {
			throw new BaseException(CodeConstant.CODE_1000019);
		}

		List<TenantModel> tenantModels = tenantMapper.selectListByAccountId(userAccount.getId());

		return Result.newSuccessResult(tenantModels);

	}

	@Override
	public Result<TenantModel> selectByCode(String code) throws Exception {
		TenantModelExample tenantModelExample = new TenantModelExample();
		TenantModelExample.Criteria criteria = tenantModelExample.createCriteria();
		criteria.andCodeEqualTo(code);
		TenantModel tenantModel = tenantModelMapper.selectOne(tenantModelExample);

		return Result.newSuccessResult(tenantModel);

	}

	public Result<PaginationSupport<TenantModel>> selectPage(TenantModel tenantModel, BasePageDto pageDto)
			throws Exception {
		TenantModelExample tenantModelExample = new TenantModelExample()
				.setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		TenantModelExample.Criteria criteria = tenantModelExample.createCriteria();
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
		tenantModelExample.setOrderByClause(orderByClause);
		List<TenantModel> list = tenantModelMapper.selectByExample(tenantModelExample);
		int totalCount = tenantModelMapper.countByExample(tenantModelExample);
		PaginationSupport<TenantModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
	}

	@Override
	public List<TenantModel> getEnableList() throws BaseException {
		TenantModelExample tenantExample = new TenantModelExample();
		tenantExample.createCriteria().andIsEnabledEqualTo(NumberEnum.ONE.getValue());
		return tenantModelMapper.selectByExample(tenantExample);
	}

	/**
	 * 初始化租户id initTenantId:
	 *
	 * @param dto
	 * @param tenantId
	 * @return
	 * @throws Exception
	 * @author: 欧阳利
	 * @description:
	 */
	public int initTenantId(TenantInitReqDto dto, Long tenantId) throws Exception {
		DBUtils.insertTenantId(dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword(), tenantId, dto);
		return 0;
	}

	@Override
	public Result<Integer> getLimitEmployeeCount(Long tenantId) throws BaseException {
		TenantModel tenantModel = tenantModelMapper.selectByPrimaryKey(tenantId);
		return Result.newSuccessResult(tenantModel.getLimitEmployeeCount());
	}

}
