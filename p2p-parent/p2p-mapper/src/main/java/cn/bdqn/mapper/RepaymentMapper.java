package cn.bdqn.mapper;

import cn.bdqn.domain.Repayment;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 还款接口
 */
public interface RepaymentMapper {


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
    Repayment selectByPrimaryKey(Integer repId);


    /**
     * 根据出借人款人id查询
     * @param userId
     * @return
     */
    public List<Repayment> selectByUserId(Integer userId);


    /**
     * 根据还款人id查询
     * @param repayUserId
     * @return
     */
    public List<Repayment> selectByRepayUserId(@Param("repayUserId") Integer repayUserId,@Param("state") Integer state);

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

    /**
     * 根基还款状态查询
     * @return
     */
    public List<Repayment> selectByState();


    /**
     * 查询已还款的散标订单
     * @return
     */
    public List<Repayment> selectByStateBy2();
}