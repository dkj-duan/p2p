package cn.bdqn.mapper;

import cn.bdqn.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户接口
 */
public interface UserMapper {

    void deleteByPrimaryKey(Integer userId);
    /**
     * 添加用户
     * @param record
     * @return
     */
    void insert(User record);

    /**
     * 选择性用户添加
     * @param record
     * @return
     */
    void insertSelective(User record);

    /**
     * 根据主键id查询用户
     * @param userId
     * @return
     */
    User selectByPrimaryKey(Integer userId);

    /**
     * 根据手机号密码查询用户
     * @param phone
     * @param pwd
     * @return
     */
    User selectByuPhoneAndPwd(@Param("phone") String phone, @Param("pwd") String pwd);
    /**
     * 选择性修改用户信息
     * @param record
     * @return
     */
    void updateByPrimaryKeySelective(User record);

    /**
     * 更新用户信息
     * @param record
     * @return
     */
    void updateByPrimaryKey(User record);


    /**
     * 查询全部用户
     * @return
     */
    List<User> selectAll();
}