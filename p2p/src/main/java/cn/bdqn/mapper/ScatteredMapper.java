package cn.bdqn.mapper;

import cn.bdqn.domain.Scattered;

public interface ScatteredMapper {
    int deleteByPrimaryKey(Integer scId);

    int insert(Scattered record);

    int insertSelective(Scattered record);

    Scattered selectByPrimaryKey(Integer scId);

    int updateByPrimaryKeySelective(Scattered record);

    int updateByPrimaryKeyWithBLOBs(Scattered record);

    int updateByPrimaryKey(Scattered record);
}