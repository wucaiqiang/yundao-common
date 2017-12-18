package com.yundao.common.mapper.base;

import com.yundao.common.model.base.TicketModel;
import com.yundao.common.model.base.TicketModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TicketModelMapper {
    int countByExample(TicketModelExample example);

    int deleteByExample(TicketModelExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TicketModel record);

    int insertSelective(TicketModel record);

    List<TicketModel> selectByExample(TicketModelExample example);

    TicketModel selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TicketModel record, @Param("example") TicketModelExample example);

    TicketModel selectOne(TicketModelExample example);

    int updateByExample(@Param("record") TicketModel record, @Param("example") TicketModelExample example);

    int updateByPrimaryKeySelective(TicketModel record);

    int updateByPrimaryKey(TicketModel record);
}