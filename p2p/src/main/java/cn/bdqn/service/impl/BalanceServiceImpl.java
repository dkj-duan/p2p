package cn.bdqn.service.impl;

import cn.bdqn.domain.Balance;
import cn.bdqn.mapper.BalanceMapper;
import cn.bdqn.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("balanceService")
public class BalanceServiceImpl implements BalanceService {

    @Autowired
    private BalanceMapper balanceMapper;

    /**
     * 添加资金的方法
     * @param balance
     */
    @Override
    public void save(Balance balance) {

        //添加的方法
        balanceMapper.insert(balance);
    }

    /**
     * 根据用户查询的方法
     * @param userId
     * @return
     */
    @Override
    public Balance queryByUserId(Integer userId) {
        //调用根据用户id查询的方法
        return balanceMapper.selectByPrimaryKey(userId);
    }


    /**
     * 更新资金的方法
     * @param balance
     */
    @Override
    public void updateMoney(Balance balance) {

        //更新的方法
        balanceMapper.updateByPrimaryKey(balance);
    }
}
