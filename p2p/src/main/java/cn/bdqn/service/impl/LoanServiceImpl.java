package cn.bdqn.service.impl;

import cn.bdqn.domain.Loan;
import cn.bdqn.mapper.LoanMapper;
import cn.bdqn.service.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loanService")
public class LoanServiceImpl implements LoanService {
    @Autowired
    private LoanMapper loanMapper;

    @Override
    public List<Loan> queryByScId(Integer scId) {
        return loanMapper.selectByScId(scId);
    }

    @Override
    public void deleteByPrimaryKey(Integer loanId) {

        loanMapper.deleteByPrimaryKey(loanId);
    }

    @Override
    public void insert(Loan record) {

        loanMapper.insert(record);
    }

    @Override
    public void insertSelective(Loan record) {

        loanMapper.insertSelective(record);
    }

    @Override
    public Loan queryByPrimaryKey(Integer loanId) {
        return loanMapper.selectByPrimaryKey(loanId);
    }

    @Override
    public List<Loan> queryByUserId(Integer userId) {
        return loanMapper.selectByUserId(userId);
    }

    @Override
    public void updateByPrimaryKeySelective(Loan record) {

        loanMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Loan record) {

        loanMapper.updateByPrimaryKey(record);
    }
}
