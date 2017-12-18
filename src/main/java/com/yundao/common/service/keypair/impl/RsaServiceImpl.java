
package com.yundao.common.service.keypair.impl;

import java.security.KeyPair;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yundao.common.constant.CodeConstant;
import com.yundao.core.dto.HeaderUser;
import com.yundao.common.enums.KeyPairAreaEnum;
import com.yundao.common.model.base.KeyPairModel;
import com.yundao.core.service.AbstractService;
import com.yundao.common.service.keypair.KeyPairService;
import com.yundao.common.service.keypair.RsaService;
import com.yundao.common.util.ObjectAndByteUtils;
import com.yundao.common.util.RSAUtils;
import com.yundao.core.code.Result;
import com.yundao.core.constant.CommonConstant;
import com.yundao.core.ed.Md5Utils;
import com.yundao.core.exception.BaseException;

/**
 * Function: Reason: Date: 2017年7月17日 下午6:56:14
 * 
 * @author wucq
 * @version
 */
@Service
public class RsaServiceImpl extends AbstractService implements RsaService {
	@Autowired
	private KeyPairService keyPairService;

	@Override
	public String processEncryptDBPassword(String password) throws Exception {
		if (StringUtils.isBlank(password)) {
			return "";
		}
		StringBuilder builder = new StringBuilder(password);
		Result<KeyPairModel> keyResult = keyPairService.selectByTenantId(null, KeyPairAreaEnum.DB.getValue());
		if (keyResult != null && keyResult.getResult() != null) {
			KeyPairModel keyPairModel = keyResult.getResult();
			KeyPair keyPair = (KeyPair) ObjectAndByteUtils.toObject(keyPairModel.getKeyPair());
			String encryptPassword=RSAUtils.encryptToHex(keyPair.getPublic(), builder.reverse().toString());
			return Md5Utils.md5(encryptPassword);
		}
		return "";

	}

	@Override
	public String processDecryptTranPassword(String password) throws Exception {
		HeaderUser user = this.getHeaderUser();
		
		Result<KeyPairModel> keyResult = keyPairService.selectByTenantId(null, KeyPairAreaEnum.TRAN.getValue());
		if (keyResult != null && keyResult.getResult() != null) {
			KeyPairModel keyPairModel = keyResult.getResult();
			KeyPair keyPair = (KeyPair) ObjectAndByteUtils.toObject(keyPairModel.getKeyPair());
			String decPassword = RSAUtils.decryptHex(keyPair.getPrivate(), password);
			if(StringUtils.isBlank(decPassword)){
				throw new BaseException(CodeConstant.CODE_1000020);
			}
			StringBuffer sb = new StringBuffer(decPassword);
			decPassword=sb.reverse().toString();
			String realPassword = decPassword.split(CommonConstant.COMMA_SEMICOLON)[0];
			return realPassword;
		}
		return "";

	}
	@Override
	public String processMD5Password(String password)throws Exception{
		return Md5Utils.md5(password);
	}
	@Override
	public String encryptPassword(String password)throws Exception{
		 password=password+",8888888";
		 StringBuilder bid=new StringBuilder(password).reverse();
		Result<KeyPairModel> keyResult = keyPairService.selectByTenantId(null, KeyPairAreaEnum.TRAN.getValue());
		KeyPairModel keyPairModel=keyResult.getResult();
		KeyPair keyPair = (KeyPair) ObjectAndByteUtils.toObject(keyPairModel.getKeyPair());
		String content=RSAUtils.encryptToHex(keyPair.getPublic(), bid.toString());
		System.out.println(content);
		return null;
	}
}
