package com.yundao.common.service.datasource.impl;

import java.util.List;
import java.util.Date;

import com.yundao.common.constant.CodeConstant;
import com.yundao.common.mapper.base.DataSourceModelMapper;
import com.yundao.common.mapper.datasource.DataSourceMapper;
import com.yundao.common.dto.BasePageDto;
import com.yundao.common.model.base.DataSourceModel;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.datasource.DataSourceService;
import com.yundao.core.code.Result;
import com.yundao.core.exception.BaseException;
import com.yundao.core.pagination.PaginationSupport;
import com.yundao.core.constant.CommonConstant;
import com.yundao.common.model.base.DataSourceModelExample;
import com.yundao.core.utils.BooleanUtils;
import com.yundao.core.utils.DesUtils;
import com.yundao.core.utils.Limit;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.datasource.DataSourceException;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class DataSourceServiceImpl extends AbstractService implements DataSourceService{

    @Autowired
    private DataSourceModelMapper dataSourceModelMapper;

    @Autowired
    private DataSourceMapper dataSourceMapper;

    /**
     * 数据源是否已经存在
     * existDataSource:
     * @author: 欧阳利
     * @param url
     * @return
     * @throws BaseException
     * @description:
     */
    public boolean existDataSource(String url) throws BaseException{
    	DataSourceModelExample example = new DataSourceModelExample();
    	example.createCriteria().andUrlEqualTo(url);
    	DataSourceModel model = dataSourceModelMapper.selectOne(example);
    	return model != null;
    }
    
    
    public Result<Integer> insert(DataSourceModel dataSource) throws Exception{
        dataSource.setCreateDate(new Date());
        //用户对应系统是否应存在记录
        DataSourceModelExample example = new DataSourceModelExample();
        DataSourceModelExample.Criteria criteria = example.createCriteria();
        criteria.andSystemCodeEqualTo(dataSource.getSystemCode());
        criteria.andTenantIdEqualTo(dataSource.getTenantId());
        criteria.andIsDeleteEqualTo(CommonConstant.ZERO);
        criteria.andIsEnabledEqualTo(CommonConstant.ONE);
        List<DataSourceModel> models = dataSourceModelMapper.selectByExample(example);
        if(models != null && !models.isEmpty()){
            throw new BaseException(CodeConstant.CODE_1000005);
        }
        //加密字段
        encryptModel(dataSource);
        int count = dataSourceModelMapper.insertSelective(dataSource);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> update(DataSourceModel dataSource) throws Exception{
        dataSource.setUpdateDate(new Date());
        DataSourceModelExample example = new DataSourceModelExample();
        DataSourceModelExample.Criteria criteria = example.createCriteria();
        criteria.andSystemCodeEqualTo(dataSource.getSystemCode());
        criteria.andTenantIdEqualTo(dataSource.getTenantId());
        criteria.andIsDeleteEqualTo(CommonConstant.ZERO);
        criteria.andIsEnabledEqualTo(CommonConstant.ONE);
        List<DataSourceModel> models = dataSourceModelMapper.selectByExample(example);
        if(models == null || models.size() > 1){
            throw new BaseException(CodeConstant.CODE_1000006);
        }
        if(models.get(0).getId() != dataSource.getId()){
            throw  new BaseException(CodeConstant.CODE_1000006);
        }

        //加密字段
        encryptModel(dataSource);
        int count = dataSourceModelMapper.updateByPrimaryKeySelective(dataSource);
        return Result.newSuccessResult(count);
    }

    public Result<Integer> delete(Long id) throws Exception{
        DataSourceModel dataSource = new DataSourceModel();
        dataSource.setId(id);
        dataSource.setIsDelete(CommonConstant.ONE);
        int count = dataSourceModelMapper.updateByPrimaryKeySelective(dataSource);
        return Result.newSuccessResult(count);
    }

    public Result<DataSourceModel> select(Long id) throws Exception{
        DataSourceModel model = dataSourceModelMapper.selectByPrimaryKey(id);
        decryptModel(model);
        return Result.newSuccessResult(model);
    }

    private void decryptModel(DataSourceModel model) throws Exception {
        //解密字段
        if (BooleanUtils.isNotEmpty(model.getUrl())) {
            model.setUrl(DesUtils.decrypt(model.getUrl()));
        }
        if (BooleanUtils.isNotEmpty(model.getUsername())) {
            model.setUsername(DesUtils.decrypt(model.getUsername()));
        }
        if (BooleanUtils.isNotEmpty(model.getPassword())) {
            model.setPassword(DesUtils.decrypt(model.getPassword()));
        }
    }

    private void encryptModel(DataSourceModel model) throws Exception {
        //加密字段
        if (BooleanUtils.isNotEmpty(model.getUrl())) {
            model.setUrl(DesUtils.encrypt(model.getUrl()));
        }
        if (BooleanUtils.isNotEmpty(model.getUsername())) {
            model.setUsername(DesUtils.encrypt(model.getUsername()));
        }
        if (BooleanUtils.isNotEmpty(model.getPassword())) {
            model.setPassword(DesUtils.encrypt(model.getPassword()));
        }
    }

    public Result<PaginationSupport<DataSourceModel>> selectPage(DataSourceModel dataSourceModel, BasePageDto pageDto) throws Exception{
		DataSourceModelExample dataSourceModelExample = new DataSourceModelExample().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));
		DataSourceModelExample.Criteria criteria = dataSourceModelExample.createCriteria();
		String orderByClause="create_date desc";
		if(StringUtils.isNotBlank(pageDto.getOrderColumn())){
		  StringBuilder orderBuider=new StringBuilder();
		  orderBuider.append(pageDto.getOrderColumn()).append(" ");
		  if(StringUtils.isNotBlank(pageDto.getSort())){
			orderBuider.append(pageDto.getSort());
		  }else{
			orderBuider.append("desc");
		  }
		  orderByClause=orderBuider.toString();
		}
		dataSourceModelExample.setOrderByClause(orderByClause);
		List<DataSourceModel> list = dataSourceModelMapper.selectByExample(dataSourceModelExample);
		int totalCount = dataSourceModelMapper.countByExample(dataSourceModelExample);
		PaginationSupport<DataSourceModel> result = pageDto.getPaginationSupport();
		result.setDatas(list);
		result.setTotalCount(totalCount);
		return Result.newSuccessResult(result);
    }

    @Override
    public Result<DataSourceModel> selectTenant(String systemCode, Long tenantId) throws Exception {
        DataSourceModelExample example = new DataSourceModelExample();
        DataSourceModelExample.Criteria criteria = example.createCriteria();
        criteria.andIsEnabledEqualTo(CommonConstant.ONE);
        criteria.andSystemCodeEqualTo(systemCode);
        criteria.andTenantIdEqualTo(tenantId);
        List<DataSourceModel> dataSourceModels = dataSourceModelMapper.selectByExample(example);
        DataSourceModel model = BooleanUtils.isEmpty(dataSourceModels) ? null : dataSourceModels.get(0);
        if(model != null){
            decryptModel(model);
        }
        return Result.newSuccessResult(model);
    }

}
