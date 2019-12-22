package cn.bdqn.service.impl;

import cn.bdqn.domain.Scattered;
import cn.bdqn.mapper.ScatteredMapper;
import cn.bdqn.service.ScatteredService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 散标业务实现类
 */
@Service("scatteredService")
public class ScatteredServiceImpl implements ScatteredService {

    @Autowired
    private ScatteredMapper scatteredMapper;

    @Override
    public void deleteByPrimaryKey(Integer scId) {
        scatteredMapper.deleteByPrimaryKey(scId);
    }

    @Override
    public void insert(Scattered record) {

        scatteredMapper.insert(record);
    }

    @Override
    public void insertSelective(Scattered record) {

        scatteredMapper.insertSelective(record);
    }

    @Override
    public Scattered queryByPrimaryKey(Integer scId) {
        return scatteredMapper.selectByPrimaryKey(scId);
    }

    @Override
    public List<Scattered> queryAll() {
        return scatteredMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKeySelective(Scattered record) {

        scatteredMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKeyWithBLOBs(Scattered record) {

        scatteredMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(Scattered record) {
        return scatteredMapper.updateByPrimaryKey(record);
    }
}
