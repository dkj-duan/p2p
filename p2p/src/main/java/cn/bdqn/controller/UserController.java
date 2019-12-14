package cn.bdqn.controller;

import cn.bdqn.domain.Balance;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.UserService;
import cn.bdqn.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/user/")
@SessionAttributes(value = {"user"})
public class UserController {


    @Autowired
    private UserService userService;

    @Autowired
    private BalanceService balanceService;
    @RequestMapping("/register")
    public String register(HttpServletRequest request, User user, @SessionAttribute(value = "checkCode") String sessionCheckCode, String checkCode, String verifyPwd, Balance balance)throws Exception{
        try{
            if (!checkCode.equalsIgnoreCase(sessionCheckCode)){
                request.getSession(false).removeAttribute("checkCode");
                request.setAttribute("message","验证码错误~");
                System.out.println("验证码不对");
                return "register1";
            }
            if (!user.getUserPwd().equals(verifyPwd)){
                request.getSession(false).removeAttribute("checkCode");
                request.setAttribute("message","两次密码不一致~");
                System.out.println("两次密码不一致");
                return "register1";
            }
            //调用添加方法
            user.setUserRegisterTime(new Date());
            user.setUserPwd(MD5Util.encode(user.getUserPwd()));
            //添加用户的方法
            userService.save(user);
            //创建用户资金表
            balance.setUser(user);
            balance.setMoney(0.0);
            balanceService.save(balance);
            //设置request作用域
            request.getSession(false).removeAttribute("checkCode");
            return "login";
        }catch (Exception e) {
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }

    @RequestMapping("/login")
    public String login(ModelMap modelMap,HttpServletRequest request,String userPhone,String userPwd,@SessionAttribute(value = "checkCode") String sessionCheckCode, String checkCode)throws Exception{
        try{
            if (!checkCode.equalsIgnoreCase(sessionCheckCode)){
                request.getSession(false).removeAttribute("checkCode");
                request.setAttribute("message","验证码错误~");
                System.out.println("验证码不对");
                return "register1";
            }
            //登录方法
            User user = userService.queryByPhoneAndPwd(userPhone,MD5Util.encode(userPwd));
            if (user==null){
                request.setAttribute("massage","用户登录失败~");
                System.out.println("用户为空");
                return "login";
            }
            modelMap.addAttribute("user",user);
            return "p2p";
        }catch (Exception e){
            throw new MyException("网络错误");
        }
    }

    @RequestMapping("/update")
    public String update(User user,ModelMap modelMap)throws Exception{

        try {
            //更新方法
            userService.updateByPrimaryKeySelective(user);
            return "p2p";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }
}
