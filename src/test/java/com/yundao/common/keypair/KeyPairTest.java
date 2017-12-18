package com.yundao.common.keypair;

import java.util.*;

import org.junit.Test;

import com.yundao.common.AbstractTest;
import com.yundao.common.enums.KeyPairAreaEnum;

/**
 * @author wucaiqiang
 * @create 2017-06-19 PM7:25
 **/

public class KeyPairTest extends AbstractTest {
	@Test
	public void add() throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenantId", "-1");
		params.put("area", KeyPairAreaEnum.TRAN.getValue());
		this.post("/keypair/add", params);
	}
	@Test
	public void getByTenantId() throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("tenantId", "-1");
		params.put("area", KeyPairAreaEnum.DB.getValue());
		this.get("/keypair/get_by_tenant_id", params);
	}
}
