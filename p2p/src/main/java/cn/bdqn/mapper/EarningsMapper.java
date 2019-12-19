package cn.bdqn.mapper;

import cn.bdqn.domain.Earnings;

import java.util.List;

public interface EarningsMapper {

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
    Earnings selectByPrimaryKey(Integer id);

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
    List<Earnings> selectAll();

    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    List<Earnings> selectByUserId(Integer userId);

    /**
     * 根据用户id查询
     * @param productId
     * @return
     */
    List<Earnings> selectByProductId(Integer productId);
}