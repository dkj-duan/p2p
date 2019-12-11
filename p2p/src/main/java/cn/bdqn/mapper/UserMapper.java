package cn.bdqn.mapper;

import cn.bdqn.domain.User;

/**
 * 用户接口
 */
public interface UserMapper {

    int deleteByPrimaryKey(Integer userId);
    /**
     * 添加用户
     * @param record
     * @return
     */
    int insert(User record);

    /**
     * 选择性用户添加
     * @param record
     * @return
     */
    int insertSelective(User record);

    /**
     * 根据主键id查询用户
     * @param userId
     * @return
     */
    User selectByPrimaryKey(Integer userId);

    /**
     * 选择性修改用户信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * 更新用户信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(User record);
}