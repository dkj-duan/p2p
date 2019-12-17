package cn.bdqn.service;

import cn.bdqn.domain.User;

import java.util.List;

/**
 * 用户接口类
 */
public interface UserService {


    /**
     * 根据手机号和密码查询用户
     * @param phone
     * @param pwd
     * @return
     */
    public User queryByPhoneAndPwd(String phone,String pwd);


    /**
     * 根据主键查询用户
     * @param userId
     * @return
     */
    public User queryByPrimaryKey(Integer userId);

    /**
     * 添加用户
     * @param user
     */
    public void save(User user);


    /**
     * 选择性更新用户
     * @param record
     */
    public void updateByPrimaryKeySelective(User record);


    /**
     * 查询全部
     * @return
     */
    public List<User> queryAll();

}
