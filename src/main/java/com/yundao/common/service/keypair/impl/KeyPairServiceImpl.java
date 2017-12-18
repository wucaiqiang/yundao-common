package com.yundao.common.service.keypair.impl;

import java.security.KeyPair;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.core.dto.HeaderUser;
import com.yundao.common.enums.KeyPairAreaEnum;
import com.yundao.common.mapper.base.KeyPairModelMapper;
import com.yundao.common.mapper.keypair.KeyPairMapper;
import com.yundao.common.model.base.KeyPairModel;
import com.yundao.common.model.base.KeyPairModelExample;
import com.yundao.common.model.base.KeyPairModelExample.Criteria;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.keypair.KeyPairService;
import com.yundao.common.util.ObjectAndByteUtils;
import com.yundao.common.util.RSAUtils;
import com.yundao.core.code.Result;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;

@Service
public class KeyPairServiceImpl extends AbstractService implements KeyPairService {
    private Log logger=LogFactory.getLog(KeyPairServiceImpl.class);
	@Autowired
	private KeyPairModelMapper keyPairModelMapper;

	@Autowired
	private KeyPairMapper keyPairMapper;

	public Result<Integer> insert(Long tenantId, String area) throws Exception {
		if (tenantId == null) {
			throw new BaseException(CodeConstant.CODE_1000008);
		}
		if (StringUtils.isBlank(area)) {
			throw new BaseException(CodeConstant.CODE_1000009);
		}
		HeaderUser user=this.getHeaderUser();
		KeyPairModelExample example=new KeyPairModelExample();
		Criteria criteria=example.createCriteria();
		criteria.andAreaEqualTo(area);
		criteria.andTenantIdEqualTo(tenantId);
		KeyPairModel existMode=keyPairModelMapper.selectOne(example);
		int count=0;
		if(existMode !=null){
			throw new BaseException(CodeConstant.CODE_1000010);
		}else{
			//没有则添加
			KeyPairModel model = new KeyPairModel();
			model.setTenantId(tenantId);
			model.setArea(area);
			model.setCreateDate(new Date());
			model.setCreateUserId(user.getUserId());
			model.setId(null);
			KeyPair keyPair = RSAUtils.generateKeyPair();// 生成密钥对
			model.setKeyPair(ObjectAndByteUtils.toByteArray(keyPair));
			count = keyPairModelMapper.insertSelective(model);
		}
		return Result.newSuccessResult(count);
	}

	@Override
	public Result<Integer> updateById(Long id) throws Exception {
		HeaderUser user=this.getHeaderUser();
		KeyPairModel model = new KeyPairModel();
		model.setUpdateDate(new Date());
		model.setUpdateUserId(user.getUserId());
		model.setId(id);
		KeyPair keyPair = RSAUtils.generateKeyPair();// 生成密钥对
		model.setKeyPair(ObjectAndByteUtils.toByteArray(keyPair));
		int count = keyPairModelMapper.updateByPrimaryKeySelective(model);
		return Result.newSuccessResult(count);

	}

	public Result<Integer> delete(Long id) throws Exception {
		KeyPairModel keyPair = new KeyPairModel();
		keyPair.setId(id);
		keyPair.setIsDelete(CommonConstant.ONE);
		int count = keyPairModelMapper.updateByPrimaryKeySelective(keyPair);
		return Result.newSuccessResult(count);
	}

	public Result<KeyPairModel> selectByTenantId(Long tenantId, String area) throws Exception {
		if (tenantId == null) {
			logger.info("获取系统默认租户的密钥对");
			tenantId=-1l;//如果为空，取系统默认租户密钥对
		}
		if (StringUtils.isBlank(area)) {
			throw new BaseException(CodeConstant.CODE_1000009);
		}
		KeyPairModelExample example=new KeyPairModelExample();
		Criteria criteria=example.createCriteria();
		criteria.andAreaEqualTo(area);
		criteria.andTenantIdEqualTo(tenantId);
		KeyPairModel model=keyPairModelMapper.selectOne(example);
		
		return Result.newSuccessResult(model);
	}

}
