package cn.bdqn.service.impl;

import cn.bdqn.domain.Product;
import cn.bdqn.mapper.ProductMapper;
import cn.bdqn.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 产品业务实现类
 */
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    /**
     * 根据id删除产品
     * @param id
     */
    @Override
    public void deleteByPrimaryKey(Integer id) {

        productMapper.deleteByPrimaryKey(id);
    }

    /**
     * 添加产品
     * @param record
     */
    @Override
    public void insert(Product record) {

        productMapper.insert(record);
    }

    /**
     * 选择性添加产品
     * @param record
     */
    @Override
    public void insertSelective(Product record) {

        productMapper.insertSelective(record);
    }

    /**
     * 根据产品id查询产品信息
     * @param id
     * @return
     */
    @Override
    public Product queryByPrimaryKey(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }

    /**
     * 选择性更新产品信息
     * @param record
     */
    @Override
    public void updateByPrimaryKeySelective(Product record) {

        productMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 更新全部产品新信息
     * @param record
     * @return
     */
    @Override
    public void updateByPrimaryKeyWithBLOBs(Product record) {

        productMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    /**
     * 更新全部产品新信息除产品描述外
     * @param record
     * @return
     */
    @Override
    public void updateByPrimaryKey(Product record) {

        productMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Product> queryByAll(Integer type) {
        return productMapper.selectByAll(type);
    }
}
