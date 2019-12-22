package cn.bdqn.service;

import cn.bdqn.domain.Loan;

import java.util.List;

/**
 * 投注散标业务接口
 */
public interface LoanService {

    /**
     * 根据散标id查询
     * @param scId
     * @return
     */
    public List<Loan> queryByScId(Integer scId);

    /**
     * 根据id删除
     * @param loanId
     */
    void deleteByPrimaryKey(Integer loanId);

    /**
     * 添加对象
     * @param record
     */
    void insert(Loan record);

    /**
     * 选择性添加对象
     * @param record
     */
    void insertSelective(Loan record);

    /**
     * 根据id查询对象
     * @param loanId
     * @return
     */
    Loan queryByPrimaryKey(Integer loanId);

    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    public List<Loan> queryByUserId(Integer userId);

    /**
     * 选择性更新
     * @param record
     */
    void updateByPrimaryKeySelective(Loan record);

    /**
     * 更新全部
     * @param record
     */
    void updateByPrimaryKey(Loan record);
}
