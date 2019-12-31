package cn.bdqn.service;

import cn.bdqn.domain.Balance;

/**
 * 资金业务接口
 */
public interface BalanceService {

    /**
     * 添加可用资金
     * @param balance
     */
    public void save(Balance balance);


    /**
     * 根据用户查询可用资金
     * @param userId
     * @return
     */
    public Balance queryByUserId(Integer userId);


    /**
     * 更新可用资金
     * @param balance
     */
    public void updateMoney(Balance balance);

    /**
     * 更新资金
     * @param balance
     */
    public void updateByPrimaryKey(Balance balance);
}
