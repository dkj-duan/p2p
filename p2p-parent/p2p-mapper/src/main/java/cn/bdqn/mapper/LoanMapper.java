package cn.bdqn.mapper;

import cn.bdqn.domain.Loan;

import java.util.List;


/**
 * 投散标记录表
 */
public interface LoanMapper {


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
    Loan selectByPrimaryKey(Integer loanId);

    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    public List<Loan> selectByUserId(Integer userId);


    /**
     * 根据散标id查询
     * @param scId
     * @return
     */
    public List<Loan> selectByScId(Integer scId);

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