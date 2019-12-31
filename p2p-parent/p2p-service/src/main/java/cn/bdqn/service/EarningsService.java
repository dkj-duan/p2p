package cn.bdqn.service;

import cn.bdqn.domain.Earnings;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 收益业务接口
 */
public interface EarningsService {

    /**
     * 根据id删除
     * @param id
     * @return
     */
    void deleteByPrimaryKey(Integer id);

    /**
     * 添加
     * @param record
     * @return
     */
    void insert(Earnings record);

    /**
     * 选择性添加
     * @param record
     * @return
     */
    void insertSelective(Earnings record);

    /**
     * 根据id查询查询
     * @param id
     * @return
     */
    Earnings queryByPrimaryKey(Integer id);

    /**
     * 选择性更新
     * @param record
     */
    void updateByPrimaryKeySelective(Earnings record);

    /**
     * 更新全部
     * @param record
     */
    void updateByPrimaryKey(Earnings record);

    /**
     * 查询全部
     * @return
     */
    List<Earnings> queryAll();

    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    List<Earnings> queryByUserId(Integer userId);

    /**
     * 根据用户id查询
     * @param productId
     * @return
     */
    List<Earnings> queryByProductId(Integer productId);


    /**
     * 根据用户id和产品id查询
     * @param type
     * @param userId
     * @return
     */
    public List<Earnings> queryByTypeAndUserId(Integer type, Integer userId);


    /**
     * 查询未收益的订单
     * @return
     */
    public List<Earnings> queryByEarningsState();

    /**
     * 修改收益状态
     */
    public void updateEarningsState(Integer id);
}
