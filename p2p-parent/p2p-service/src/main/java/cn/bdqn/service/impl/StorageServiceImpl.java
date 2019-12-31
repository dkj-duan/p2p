package cn.bdqn.service.impl;

import cn.bdqn.domain.Storage;
import cn.bdqn.mapper.StorageMapper;
import cn.bdqn.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("storageService")
public class StorageServiceImpl implements StorageService {


    @Autowired
    private StorageMapper storageMapper;

    /**
     * 充值的方法
     * @param storage
     */
    @Override
    public void save(Storage storage) {

        //调用添加方法
        storageMapper.insert(storage);
    }

    /**
     * 根据用户id查询充值记录
     * @param userId
     * @return
     */
    @Override
    public List<Storage> queryByUserId(Integer userId) {
        //根据用户id查询充值信息
        return storageMapper.selectByUserId(userId);
    }

    /**
     * 根据充值编号查询充值信息
     * @param orderNumber
     * @return
     */
    @Override
    public Storage queryByOrderNumber(String orderNumber) {
        //根据充值订单查询充值信息
        return storageMapper.selectByOrderNumber(orderNumber);
    }
}
