package com.yundao.common.mapper.base;

import com.yundao.common.model.base.KeyPairModel;
import com.yundao.common.model.base.KeyPairModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KeyPairModelMapper {
    int countByExample(KeyPairModelExample example);

    int deleteByExample(KeyPairModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(KeyPairModel record);

    int insertSelective(KeyPairModel record);

    List<KeyPairModel> selectByExampleWithBLOBs(KeyPairModelExample example);

    List<KeyPairModel> selectByExample(KeyPairModelExample example);

    KeyPairModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") KeyPairModel record, @Param("example") KeyPairModelExample example);

    int updateByExampleWithBLOBs(@Param("record") KeyPairModel record, @Param("example") KeyPairModelExample example);

    KeyPairModel selectOne(KeyPairModelExample example);

    int updateByExample(@Param("record") KeyPairModel record, @Param("example") KeyPairModelExample example);

    int updateByPrimaryKeySelective(KeyPairModel record);

    int updateByPrimaryKeyWithBLOBs(KeyPairModel record);

    int updateByPrimaryKey(KeyPairModel record);
}