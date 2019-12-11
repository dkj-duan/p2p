package cn.bdqn.mapper;

import cn.bdqn.domain.Storage;

import java.util.List;

public interface StorageMapper {

    /**
     * 根据id删除充值记录
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 添加
     * @param record
     * @return
     */
    int insert(Storage record);

    /**
     * 选择性添加
     * @param record
     * @return
     */
    int insertSelective(Storage record);

    /**
     * 根据id查询信息
     * @param id
     * @return
     */
    Storage selectByPrimaryKey(Integer id);

    /**
     * 查询全部充值记录
     * @return
     */
    List<Storage> selectAll();

    /**
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Storage record);

    int updateByPrimaryKey(Storage record);
}