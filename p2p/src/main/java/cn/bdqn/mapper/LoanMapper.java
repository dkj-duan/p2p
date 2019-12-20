package cn.bdqn.mapper;

import cn.bdqn.domain.Loan;

public interface LoanMapper {


    int deleteByPrimaryKey(Integer loanId);

    int insert(Loan record);

    int insertSelective(Loan record);

    Loan selectByPrimaryKey(Integer loanId);

    int updateByPrimaryKeySelective(Loan record);

    int updateByPrimaryKey(Loan record);
}