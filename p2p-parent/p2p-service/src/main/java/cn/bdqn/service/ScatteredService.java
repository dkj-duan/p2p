package cn.bdqn.service;


import cn.bdqn.domain.Scattered;

import java.util.List;

/**
 * 散标
 */
public interface ScatteredService {
    /**
     * 根据id删除
     * @param scId
     * @return
     */
    void deleteByPrimaryKey(Integer scId);

    /**
     * 添加一个散标对象
     * @param record
     * @return
     */
    void insert(Scattered record);

    /**
     * 选择性添加
     * @param record
     * @return
     */
    void insertSelective(Scattered record);

    /**
     * 根据id查询
     * @param scId
     * @return
     */
    Scattered queryByPrimaryKey(Integer scId);

    /**
     * 查询全部
     * @return
     */
    public List<Scattered> queryAll();

    /**
     * 根据状态查询
     * @return
     */
    public List<Scattered> queryByState();

    /**
     * 选择性更新
     * @param record
     */
    void updateByPrimaryKeySelective(Scattered record);

    /**
     * 更新全部
     * @param record
     */
    void updateByPrimaryKeyWithBLOBs(Scattered record);


    int updateByPrimaryKey(Scattered record);
}
