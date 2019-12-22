package cn.bdqn.service;

import cn.bdqn.domain.Repayment;

import java.util.List;

/**
 * 还款业务借款
 */
public interface RepaymentService {


    /**
     * 根据id删除
     * @param repId
     */
    void deleteByPrimaryKey(Integer repId);

    /**
     * 添加对象
     * @param record
     */
    void insert(Repayment record);

    /**
     * 选择性添加
     * @param record
     */
    void insertSelective(Repayment record);

    /**
     *根据主键id查询
     * @param repId
     * @return
     */
    Repayment queryByPrimaryKey(Integer repId);


    /**
     * 根据出借人款人id查询
     * @param userId
     * @return
     */
    public List<Repayment> queryByUserId(Integer userId);


    /**
     * 根据还款人id查询
     * @param RepayUserId
     * @return
     */
    public List<Repayment> queryByRepayUserId(Integer RepayUserId);

    /**
     * 选择性更新对象
     * @param record
     */
    void updateByPrimaryKeySelective(Repayment record);

    /**
     * 更新全部
     * @param record
     */
    void updateByPrimaryKey(Repayment record);
}
