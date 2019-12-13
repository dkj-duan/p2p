package cn.bdqn.service;

import cn.bdqn.domain.Storage;

import java.util.List;

/**
 * 充值记录业务接口
 */
public interface StorageService {

    /**
     * 充值
     * @param storage
     */
    public void save(Storage storage);


    /**
     * 根据用户查询充值记录
     * @param userId
     * @return
     */
    public List<Storage> queryByUserId(Integer userId);


    /**
     * 根据充值编码查询充值信息
     * @param orderNumber
     * @return
     */
    public Storage queryByOrderNumber(String orderNumber);
}
