package cn.bdqn.mapper;

import cn.bdqn.domain.Earnings;

public interface EarningsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Earnings record);

    int insertSelective(Earnings record);

    Earnings selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Earnings record);

    int updateByPrimaryKey(Earnings record);
}