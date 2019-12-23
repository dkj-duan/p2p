package cn.bdqn.service.impl;

import cn.bdqn.domain.Repayment;
import cn.bdqn.mapper.RepaymentMapper;
import cn.bdqn.service.RepaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("repaymentService")
public class RepaymentServiceImpl implements RepaymentService {

    @Autowired
    private RepaymentMapper repaymentMapper;

    @Override
    public void deleteByPrimaryKey(Integer repId) {
        repaymentMapper.deleteByPrimaryKey(repId);
    }

    @Override
    public void insert(Repayment record) {

        repaymentMapper.insert(record);
    }

    @Override
    public void insertSelective(Repayment record) {

        repaymentMapper.insertSelective(record);
    }

    @Override
    public Repayment queryByPrimaryKey(Integer repId) {
        return repaymentMapper.selectByPrimaryKey(repId);
    }

    @Override
    public List<Repayment> queryByUserId(Integer userId) {
        return repaymentMapper.selectByUserId(userId);
    }

    @Override
    public List<Repayment> queryByRepayUserId(Integer RepayUserId) {
        return repaymentMapper.selectByRepayUserId(RepayUserId);
    }

    @Override
    public void updateByPrimaryKeySelective(Repayment record) {

        repaymentMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Repayment record) {

        repaymentMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Repayment> queryByState() {
        return repaymentMapper.selectByState();
    }
}
