package cn.bdqn.service.impl;

import cn.bdqn.domain.Record;
import cn.bdqn.mapper.RecordMapper;
import cn.bdqn.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("recordService")
public class RecordServiceImpl implements RecordService {


    @Autowired
    private RecordMapper recordMapper;

    @Override
    public void deleteByPrimaryKey(Integer reId) {

        recordMapper.deleteByPrimaryKey(reId);
    }

    @Override
    public void insert(Record record) {

        recordMapper.insert(record);
    }

    @Override
    public void insertSelective(Record record) {

        recordMapper.insertSelective(record);
    }

    @Override
    public Record queryByPrimaryKey(Integer reId) {
        return recordMapper.selectByPrimaryKey(reId);
    }

    @Override
    public List<Record> queryByRepayUserIdAndScId(Integer repayUserId, Integer scId) {
        return recordMapper.selectByRepayUserIdAndScId(repayUserId,scId);
    }

    @Override
    public List<Record> queryByUserIdAndScId(Integer userId, Integer scId) {
        return recordMapper.selectByUserIdAndScId(userId,scId);
    }


    @Override
    public void updateByPrimaryKeySelective(Record record) {

        recordMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Record record) {

        recordMapper.updateByPrimaryKey(record);
    }
}
