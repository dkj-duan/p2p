package cn.bdqn.service.impl;

import cn.bdqn.domain.Earnings;
import cn.bdqn.mapper.EarningsMapper;
import cn.bdqn.service.EarningsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("earningsService")
public class EarningsServiceImpl implements EarningsService {

    @Autowired
    private EarningsMapper earningsMapper;

    @Override
    public void deleteByPrimaryKey(Integer id) {
        earningsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Earnings record) {
        earningsMapper.insert(record);
    }

    @Override
    public void insertSelective(Earnings record) {

        earningsMapper.insertSelective(record);
    }

    @Override
    public Earnings queryByPrimaryKey(Integer id) {
        return earningsMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKeySelective(Earnings record) {

        earningsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Earnings record) {

        earningsMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Earnings> queryAll() {
        return earningsMapper.selectAll();
    }

    @Override
    public List<Earnings> queryByUserId(Integer userId) {
        return earningsMapper.selectByUserId(userId);
    }

    @Override
    public List<Earnings> queryByProductId(Integer productId) {
        return earningsMapper.selectByProductId(productId);
    }
}
