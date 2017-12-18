package com.yundao.common.mapper.base;

import com.yundao.common.model.base.SmsCaptchaModel;
import com.yundao.common.model.base.SmsCaptchaModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SmsCaptchaModelMapper {
    int countByExample(SmsCaptchaModelExample example);

    int deleteByExample(SmsCaptchaModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SmsCaptchaModel record);

    int insertSelective(SmsCaptchaModel record);

    List<SmsCaptchaModel> selectByExample(SmsCaptchaModelExample example);

    SmsCaptchaModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SmsCaptchaModel record, @Param("example") SmsCaptchaModelExample example);

    SmsCaptchaModel selectOne(SmsCaptchaModelExample example);

    int updateByExample(@Param("record") SmsCaptchaModel record, @Param("example") SmsCaptchaModelExample example);

    int updateByPrimaryKeySelective(SmsCaptchaModel record);

    int updateByPrimaryKey(SmsCaptchaModel record);
}