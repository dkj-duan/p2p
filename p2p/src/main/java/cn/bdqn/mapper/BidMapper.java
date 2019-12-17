package cn.bdqn.mapper;

import cn.bdqn.domain.Bid;

import java.util.List;

public interface BidMapper {


    void deleteByPrimaryKey(Integer id);



    /**
     * //添加投标
     * @param record
     */
    void insert(Bid record);

    void insertSelective(Bid record);

    /**
     * 根据id查询投标信息
     * @param id
     * @return
     */
    Bid selectByPrimaryKey(Integer id);

    /**
     * 现在性更新
     * @param record
     */
    void updateByPrimaryKeySelective(Bid record);

    /**
     * 更新
     * @param record
     */
    void updateByPrimaryKey(Bid record);

    /**
     * 查询全部投标记录
     * @return
     */
    List<Bid> selectAll(Integer userId);

    /**
     * 根据产品id查询投标记录
     * @param ProductId
     * @return
     */
    List<Bid> selectByProductId(Integer ProductId);

}