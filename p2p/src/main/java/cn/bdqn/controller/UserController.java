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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


    /**
     * 注册用户
     * @param request
     * @param users
     * @param sessionCheckCode
     * @param checkCode
     * @param verifyPwd
     * @param balance
     * @return
     * @throws Exception
     */
    @RequestMapping("/register")
    public String register(HttpServletRequest request, User users, @SessionAttribute(value = "checkCode") String sessionCheckCode, String checkCode, String verifyPwd, Balance balance)throws Exception{

        Map<String,String> map = new HashMap<>();
        try{
            if (!checkCode.equalsIgnoreCase(sessionCheckCode)){
                request.getSession(false).removeAttribute("checkCode");
                map.put("yanZheng","验证码错误~");
                request.setAttribute("massage",map);
                request.setAttribute("checkCode",checkCode);
                request.setAttribute("userPhone",users.getUserPhone());
                System.out.println("验证码不对");
                return "register";
            }
            if (!users.getUserPwd().equals(verifyPwd)){
                request.getSession(false).removeAttribute("checkCode");
                map.put("pwd","两次密码不一致~");
                request.setAttribute("massage",map);
                request.setAttribute("checkCode",checkCode);
                request.setAttribute("userPhone",users.getUserPhone());
                System.out.println("两次密码不一致");
                return "register";
            }
            //调用添加方法
            users.setUserRegisterTime(new Date());
            users.setUserPwd(MD5Util.encode(users.getUserPwd()));
            users.setUserImg("moren.jpg");
            //添加用户的方法
            userService.save(users);
            //创建用户资金表
            balance.setUser(users);
            balance.setMoney(new BigDecimal(0));
            balanceService.save(balance);
            //设置request作用域
            request.getSession(false).removeAttribute("checkCode");
            request.setAttribute("userPhone",users.getUserPhone());
            return "login";
        }catch (Exception e) {
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }

    /**
     * 登录
     * @param modelMap
     * @param request
     * @param userPhone
     * @param userPwd
     * @param sessionCheckCode
     * @param checkCode
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login(ModelMap modelMap,HttpServletRequest request,String userPhone,String userPwd,@SessionAttribute(value = "checkCode") String sessionCheckCode, String checkCode)throws Exception{
        Map<String,String> map = new HashMap<>();
        try{
            if (!checkCode.equalsIgnoreCase(sessionCheckCode)){
                request.getSession(false).removeAttribute("checkCode");
                map.put("yanZheng","验证码错误~");
                request.setAttribute("massage",map);
                request.setAttribute("checkCode",checkCode);
                request.setAttribute("userPhone",userPhone);
                System.out.println("验证码不对");
                return "login";
            }
            //登录方法
            User user = userService.queryByPhoneAndPwd(userPhone,MD5Util.encode(userPwd));
            if (user==null){
                map.put("pwd","手机号或密码错误~");
                request.setAttribute("massage",map);
                request.setAttribute("checkCode",checkCode);
                request.setAttribute("userPhone",userPhone);
                System.out.println("用户为空");
                return "login";
            }
            user.setUserLoginTime(new Date());
            //更新用户最近登录时间
            userService.updateByPrimaryKeySelective(user);
            modelMap.addAttribute("user",user);
            return "forward:/product/selectAll";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误");
        }
    }

    /**
     * 更新用户信息的方法
     * @param user
     * @param modelMap
     * @return
     * @throws Exception
     */
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

    /**
     *
     * @param
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectById")
    public String selectById(@SessionAttribute("user")User user,ModelMap modelMap)throws Exception{

        try{
            //根据id查询用户可用资金
            Balance balance = balanceService.queryByUserId(user.getUserId());
            modelMap.addAttribute("balance",balance);
            modelMap.addAttribute("mess","充值成功~");
            return "user";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }


    /**
     * 查询充值记录
     * @return
     */
    @RequestMapping("/ajax")
    @ResponseBody
    public List<User> selectAll(){
        List<User> users = userService.queryAll();
        System.out.println(users);
        return users;
    }
}
