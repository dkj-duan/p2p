package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/user/")
public class UserController {


    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String register(User user, ModelMap modelMap)throws Exception{
        try{
            //调用添加方法
            userService.save(user);
            //设置request作用域
            modelMap.addAttribute("user",user);
            return "login";
        }catch (Exception e) {
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }
}
