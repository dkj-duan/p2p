package cn.bdqn.mapper;

import cn.bdqn.domain.Storage;

import java.util.List;

public interface StorageMapper {

    /**
     * 根据id删除充值记录
     * @param id
     * @return
     */
    void deleteByPrimaryKey(Integer id);

    /**
     * 添加
     * @param record
     * @return
     */
    void insert(Storage record);

    /**
     * 选择性添加
     * @param record
     * @return
     */
    void insertSelective(Storage record);

    /**
     * 根据id查询信息
     * @param id
     * @return
     */
    Storage selectByPrimaryKey(Integer id);

    /**
     * 根据用户id查询全部充值记录
     * @return
     */
    List<Storage> selectByUserId(Integer userId);


    /**
     * 根据充值编码查询充值信息
     * @param orderNumber
     * @return
     */
    Storage selectByOrderNumber(String orderNumber);
    /**
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Storage record);

    int updateByPrimaryKey(Storage record);
}