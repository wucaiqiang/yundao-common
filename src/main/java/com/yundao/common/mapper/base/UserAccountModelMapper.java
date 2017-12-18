package com.yundao.common.mapper.base;

import com.yundao.common.model.base.UserAccountModel;
import com.yundao.common.model.base.UserAccountModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserAccountModelMapper {
    int countByExample(UserAccountModelExample example);

    int deleteByExample(UserAccountModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserAccountModel record);

    int insertSelective(UserAccountModel record);

    List<UserAccountModel> selectByExample(UserAccountModelExample example);

    UserAccountModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserAccountModel record, @Param("example") UserAccountModelExample example);

    UserAccountModel selectOne(UserAccountModelExample example);

    int updateByExample(@Param("record") UserAccountModel record, @Param("example") UserAccountModelExample example);

    int updateByPrimaryKeySelective(UserAccountModel record);

    int updateByPrimaryKey(UserAccountModel record);
}