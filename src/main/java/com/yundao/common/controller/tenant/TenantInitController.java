package com.yundao.common.controller.tenant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JavaType;
import com.yundao.common.constant.CodeConstant;
import com.yundao.common.constant.url.TenantUrlConstant;
import com.yundao.common.constant.url.WorkFlowUrlConstant;
import com.yundao.common.dto.tenant.TenantDomainDto;
import com.yundao.common.dto.tenant.TenantInitReqDto;
import com.yundao.common.dto.user.TenantAdminAddReqDto;
import com.yundao.common.service.datasource.DataSourceService;
import com.yundao.common.service.domainname.DomainNameService;
import com.yundao.common.service.tenant.TenantService;
import com.yundao.common.service.user.UserAccountService;
import com.yundao.common.util.DBUtils;
import com.yundao.common.util.TenantHttpUtils;
import com.yundao.core.code.Result;
import com.yundao.core.json.jackson.type.BaseTypeReference;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.DesUtils;
import com.yundao.core.utils.JsonUtils;
import com.yundao.core.validator.spring.BindingResultHandler;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/tenant/")
@ResponseBody
@Api("租户初始化")
public class TenantInitController{

	@Autowired
	TenantService tenantService;
	
	@Autowired
	DataSourceService dataSourceService;
	
	@Autowired
	DomainNameService domainNameService;
	
    @Autowired
    UserAccountService userAccountService;

    
    @RequestMapping(value = "init",method=RequestMethod.POST)
    @ApiOperation(value="初始化租户(欧阳利)")
    public Result<Long> init(@Validated @ModelAttribute TenantInitReqDto dto, BindingResult bindingResult) throws Exception{
    	BindingResultHandler.handleByException(bindingResult);
    	
    	// 服务校验
    	Result<String> testRsult = serviceTest();
    	if(!testRsult.getSuccess()){
    		return Result.newFailureResult(testRsult.getCode(),testRsult.getMessage(),null);
    	}
    	
    	// 检查租户是否存在
    	Boolean isExist = tenantService.existTenant(dto.getName());
    	if(isExist){
    		return Result.newFailureResult(CodeConstant.CODE_1000043);
    	}
    	
    	// 检查数据库连接是否存在
    	isExist = dataSourceService.existDataSource(DesUtils.encrypt(dto.getDbUrl()));
    	if(isExist){
    		return Result.newFailureResult(CodeConstant.CODE_1000005);
    	}
    	
    	// 检查租户数据库是否存在
    	isExist = DBUtils.testDBExist(dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
    	if(!isExist){
    		return Result.newFailureResult(CodeConstant.CODE_1000041);
    	}
    	
    	// 检查数据库表是否存在
    	List<String> tableNames = new ArrayList<String>();
    	tableNames.add("department");
    	tableNames.add("role");
    	tableNames.add("resource");
    	tableNames.add("role_resource");
    	isExist =  DBUtils.testTableExist(dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword(), tableNames);
    	if(isExist){
    		return Result.newFailureResult(CodeConstant.CODE_1000042);
    	}
    	
    	// 检查域名是否存在
    	if(BooleanUtils.isEmpty(dto.getTenantDomainDtos())){
			return Result.newFailureResult(CodeConstant.CODE_1000045);
		}
		JavaType javaType = JsonUtils.getCollectionType(List.class, TenantDomainDto.class);
		List<TenantDomainDto> tenantDomainDtos = JsonUtils.jsonToObject(dto.getTenantDomainDtos(), javaType);
		if(BooleanUtils.isEmpty(tenantDomainDtos)){
			return Result.newFailureResult(CodeConstant.CODE_1000045);
		}
		for(TenantDomainDto domainDto : tenantDomainDtos){
			isExist = domainNameService.existDomainUrl(domainDto.getUrl());
			if(isExist){
	    		return Result.newFailureResult(CodeConstant.CODE_1000044,"已经存在域名"+domainDto.getUrl(),null);
	    	}
		}
		
		if(dto.getSmsIsDefault() != 1 && dto.getSmsIsDefault() != 0){
			return Result.newFailureResult(CodeConstant.CODE_1000062);
		}
		
		if(dto.getSmsIsDefault() == 0){
			if(BooleanUtils.isBlank(dto.getSmsAccessKeyId())){
				return Result.newFailureResult(CodeConstant.CODE_1000057);
			}
			if(BooleanUtils.isBlank(dto.getSmsAccesskeySecret())){
				return Result.newFailureResult(CodeConstant.CODE_1000058);
			}
            if(BooleanUtils.isBlank(dto.getSmsSign())){
            	return Result.newFailureResult(CodeConstant.CODE_1000059);
			}
		}
		
		//初始化SCM 租户信息(创建租户，创建域名，创建数据源，创建初始角色)
    	Result<Long> result =  tenantService.doInit(dto, tenantDomainDtos);

    	if(result.getSuccess()){
    		// 创建租户数据库表
        	DBUtils.excelDBFile("2-tenant_schema.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
    		
        	// 初始租户表的id(在租户表临时表添加数据(租户id,smsAccessKeyId等信息))
        	tenantService.initTenantId(dto, result.getResult());
        	
        	// 初始化数据
        	DBUtils.excelDBFile("4-tenant_data_init.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
        	
        	// 执行sql版本1
        	DBUtils.excelDBFile("1_tenant.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
        	
        	DBUtils.excelDBFile("1_1_tenant.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
        	
        	DBUtils.excelDBFile("1_2_tenant.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
        	
        	DBUtils.excelDBFile("2_0_tenant.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
        	
        	DBUtils.excelDBFile("1_3_app_tenant.sql", dto.getDbUrl(), dto.getDbUsername(), dto.getDbPassword());
        	
    		// 调用租户接口完成 数据初始化(角色，部门，资源，角色资源关系)，流程部署
        	Map<String, Object> methodParams = new HashMap<String, Object>();
        	methodParams.put("tenantId", result.getResult());
        	Result<Integer> initTenantResult = TenantHttpUtils.post(TenantUrlConstant.INIT_TENANT_SYSTEM_DB_AND_DATA, methodParams, new BaseTypeReference<Result<Integer>>() {}, result.getResult());
        	if(!initTenantResult.getSuccess()){
        		return Result.newFailureResult(initTenantResult.getCode(), initTenantResult.getMessage(),null);
        	}
        	
        	// 添加租户系统管理员
        	TenantAdminAddReqDto reqDto = new TenantAdminAddReqDto();
        	reqDto.setMobile(dto.getMobile());
        	reqDto.setTenantId(result.getResult());
        	reqDto.setRealname(dto.getRealname());
        	reqDto.setPassword(dto.getPassword());
        	userAccountService.addTenantSystemAdmin(reqDto);
        	
    	}
    		
		return result;
    }


    
    /**
     * 服务测试
     * serviceTest:
     * @author: 欧阳利
     * @return
     * @throws Exception
     * @description:
     */
    private Result<String> serviceTest()throws Exception{
		Map<String, Object> testMap = new HashMap<String, Object>();
		testMap.put("tenantId", 1l);
		
		// 检查工作流服务是否正常
    	Result<String> initTenantResult = TenantHttpUtils.get(WorkFlowUrlConstant.TEST, testMap, new BaseTypeReference<Result<String>>() {}, 1l);
    	if(initTenantResult.getResult() == null || !"成功!".equals(initTenantResult.getResult())){
			return Result.newFailureResult(CodeConstant.CODE_1000060);
		}
    	
		// 检查租户服务是否正常
		initTenantResult = TenantHttpUtils.get(TenantUrlConstant.TEST, testMap, new BaseTypeReference<Result<String>>() {}, 1l);
		if(initTenantResult.getResult() == null || !"成功!".equals(initTenantResult.getResult())){
			return Result.newFailureResult(CodeConstant.CODE_1000056);
		}
		return initTenantResult;
		
    }
    
 // jdbc:mysql://rds996n72786ft1i3ee4o.mysql.rds.aliyuncs.com:3306/wm_tenant_zr?useUnicode=true&characterEncoding=UTF-8
 // yundao_dev
 // YunDao_Dev@com
 // [{"url":"172.18.221.172:8203","registerDate":"2017-10-17 16:31:40","expireDate":"2027-10-17 16:31:40","type":"to_b"}]

}
