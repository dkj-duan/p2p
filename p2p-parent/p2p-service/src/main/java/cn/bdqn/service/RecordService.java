package cn.bdqn.service;

import cn.bdqn.domain.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecordService {

    /**
     * 根据id删除
     * @param reId
     * @return
     */
    void deleteByPrimaryKey(Integer reId);

    /**
     * 添加一个对象
     * @param record
     */
    void insert(Record record);

    /**
     * 选择性添加
     * @param record
     * @return
     */
    void insertSelective(Record record);

    /**
     * 根据id查询
     * @param reId
     * @return
     */
    Record queryByPrimaryKey(Integer reId);

    /**
     * 根据还款人id AND 散标id查询
     * @param repayUserId
     * @return
     */
    public List<Record> queryByRepayUserIdAndScId(Integer repayUserId, Integer scId);

    /**
     * 根据收款人id AND 散标id查询
     * @param userId
     * @return
     */
    public List<Record> queryByUserIdAndScId( Integer userId, Integer scId);

    /**
     * 选择性更新
     * @param record
     */
    void updateByPrimaryKeySelective(Record record);

    /**
     * 更新全部
     * @param record
     */
    void updateByPrimaryKey(Record record);
}
