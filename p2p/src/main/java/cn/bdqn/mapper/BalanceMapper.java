package cn.bdqn.mapper;

import cn.bdqn.domain.Balance;

/**
 * 资金表接口
 */
public interface BalanceMapper {


    void deleteByPrimaryKey(Integer id);

    /**
     * 添加信息
     * @param record
     * @return
     */
    void insert(Balance record);

    void insertSelective(Balance record);

    /**
     * 根据用户id查询可用余额
     * @param userId
     * @return
     */
    Balance selectByPrimaryKey(Integer userId);

    /**
     * 更新资金
     * @param record
     */
    void updateByPrimaryKeySelective(Balance record);

    void updateByPrimaryKey(Balance record);
}