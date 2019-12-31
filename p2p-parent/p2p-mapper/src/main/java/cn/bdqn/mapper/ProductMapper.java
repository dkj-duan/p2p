package cn.bdqn.mapper;

import cn.bdqn.domain.Product;

import java.util.List;

public interface ProductMapper {

    /**
     * //    根据主键删除产品信息
     * @param id
     */

    void deleteByPrimaryKey(Integer id);


    /**
     * //    添加产品信息
     * @param record
     */
    void insert(Product record);


    /**
     * //    选择性添加产品信息
     * @param record
     */
    void insertSelective(Product record);


    /**
     * //    根据id查询产品信息
     * @param id
     * @return
     */
    Product selectByPrimaryKey(Integer id);


    /**
     * //    选择性修改产品信息
     * @param record
     */
    void updateByPrimaryKeySelective(Product record);


    /**
     * //连同描述更新
     * @param record
     * @return
     */
    void updateByPrimaryKeyWithBLOBs(Product record);

    /**
     * //不更新描述
     * @param record
     * @return
     */
    void updateByPrimaryKey(Product record);

    /**
     * 根据投保类型查询
     * @param type
     * @return
     */
    List<Product> selectByAll(Integer type);
}