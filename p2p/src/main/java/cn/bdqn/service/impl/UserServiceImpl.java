package cn.bdqn.service.impl;

import cn.bdqn.domain.User;
import cn.bdqn.mapper.UserMapper;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 查询用户
     * @param phone
     * @param pwd
     * @return
     */
    @Override
    public User queryByPhoneAndPwd(String phone, String pwd) {
        return userMapper.selectByuPhoneAndPwd(phone,pwd);
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void save(User user) {
        userMapper.insertSelective(user);
    }

    /**
     * 更新用户
     * @param record
     */
    @Override
    public void updateByPrimaryKeySelective(User record) {
        userMapper.updateByPrimaryKeySelective(record);
    }
}
