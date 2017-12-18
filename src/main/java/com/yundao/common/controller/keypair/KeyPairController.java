package com.yundao.common.controller.keypair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yundao.common.model.base.KeyPairModel;
import com.yundao.common.service.keypair.KeyPairService;
import com.yundao.core.code.Result;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/keypair/")
@ResponseBody
@Api("密钥对表")
public class KeyPairController{

    @Autowired
    private KeyPairService keyPairService;

    @RequestMapping(value="add", method=RequestMethod.POST)
    @ApiOperation(value="新增租户密钥对")
    public Result<Integer> add(@RequestParam Long tenantId,@RequestParam String area) throws Exception{
       return keyPairService.insert(tenantId, area);
    }
    @RequestMapping(value="update_by_id", method=RequestMethod.POST)
    @ApiOperation(value="根据ID修改密钥对")
    public Result<Integer> updateById(@RequestParam Long id) throws Exception{
       return keyPairService.updateById(id);
    }
    @RequestMapping(value = "delete", method=RequestMethod.POST)
    @ApiOperation(value="根据ID删除密钥对")
    public Result<Integer> delete(@RequestParam Long id) throws Exception{
        return keyPairService.delete(id);
    }
    @RequestMapping(value = "get_by_tenant_id", method=RequestMethod.GET)
    @ApiOperation(value="获取租户加密的密钥对")
    public Result<KeyPairModel> getByTenantId(@RequestParam Long tenantId,@RequestParam String area) throws Exception{
       return keyPairService.selectByTenantId(tenantId, area);
    }
}
