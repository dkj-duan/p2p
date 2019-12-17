package cn.bdqn.service.impl;

import cn.bdqn.domain.Bid;
import cn.bdqn.mapper.BalanceMapper;
import cn.bdqn.mapper.BidMapper;
import cn.bdqn.service.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bidService")
public class BidServiceImpl implements BidService {


    @Autowired
    private BidMapper bidMapper;

    @Override
    public void deleteByPrimaryKey(Integer id) {

        bidMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Bid record) {

        bidMapper.insert(record);
    }

    @Override
    public void insertSelective(Bid record) {

        bidMapper.insertSelective(record);
    }

    @Override
    public Bid queryByPrimaryKey(Integer id) {
        return bidMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKeySelective(Bid record) {

        bidMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Bid record) {

        bidMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Bid> queryAll(Integer userId) {
        return bidMapper.selectAll(userId);
    }

    @Override
    public List<Bid> queryByProductId(Integer ProductId) {
        return bidMapper.selectByProductId(ProductId);
    }
}
