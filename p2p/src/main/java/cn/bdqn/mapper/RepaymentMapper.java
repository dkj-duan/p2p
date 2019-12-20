package cn.bdqn.mapper;

import cn.bdqn.domain.Repayment;

public interface RepaymentMapper {
    int deleteByPrimaryKey(Integer repId);

    int insert(Repayment record);

    int insertSelective(Repayment record);

    Repayment selectByPrimaryKey(Integer repId);

    int updateByPrimaryKeySelective(Repayment record);

    int updateByPrimaryKey(Repayment record);
}