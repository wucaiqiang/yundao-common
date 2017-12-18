
package com.yundao.common.service.keypair;

/**
 * Function: Reason: Date: 2017年7月17日 下午6:54:31
 * 
 * @author wucq
 * @version
 */
public interface RsaService {
	public String encryptPassword(String password)throws Exception;
	public String processEncryptDBPassword(String password) throws Exception;
	public String processMD5Password(String password)throws Exception;
	public String processDecryptTranPassword(String password) throws Exception;
}
