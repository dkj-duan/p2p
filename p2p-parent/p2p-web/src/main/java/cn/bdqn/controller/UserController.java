package cn.bdqn.controller;

import cn.bdqn.domain.Balance;
import cn.bdqn.domain.RegisterUser;
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
import java.util.*;

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
     * @param sessionCheckCode
     * @param checkCode
     * @param verifyPwd
     * @param balance
     * @return
     * @throws Exception
     */
    @RequestMapping("/register")
    public String register(HttpServletRequest request, String userPhone,String userPwd, @SessionAttribute(value = "checkCode") String sessionCheckCode, String checkCode, String verifyPwd, Balance balance)throws Exception{
        User users = new User();
        users.setUserPhone(userPhone);
        users.setUserPwd(userPwd);
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
            Random random = new Random();

            users.setUserName("Y225"+ random.nextInt(5000));
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


    /**
     * 判断原密码是否一致
     * @param user
     * @param pwd
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectByPwd")
    @ResponseBody
    public Map<String,Object> selectPwd(@SessionAttribute("user")User user, String pwd)throws Exception{
        Map<String,Object> map = new HashMap<>();
        try{
            if (user.getUserPwd().equals(MD5Util.encode(pwd))){
                map.put("query",true);
            }else {
                map.put("query",false);
            }
            return map;
        }catch (Exception e){
            e.printStackTrace();
            map.put("query",false);
            return map;
        }
    }

    /**
     * 更新密码
     * @param user
     * @param pwd
     * @return
     * @throws Exception
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map<String,Object> updatePwd(@SessionAttribute("user")User user,String pwd)throws Exception{

        Map<String,Object> map = new HashMap<>();
        try {
            //获得最新的用户信息
            user = userService.queryByPrimaryKey(user.getUserId());
            //设置新的密码
            user.setUserPwd(MD5Util.encode(pwd));
            //更新密码
            userService.updateByPrimaryKeySelective(user);
            map.put("query",true);
            return map;
        }catch (Exception e){
            e.printStackTrace();
            map.put("query",false);
            return map;
        }
    }


    /**
     * 更新用户名和身份证
     * @param user
     * @param name
     * @param card
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateCard")
    @ResponseBody
    public Map<String,Object> updateCard(@SessionAttribute("user")User user,String name,String card,ModelMap modelMap)throws Exception{

        Map<String,Object> map = new HashMap<>();
        try{
            //获得最新的用户信息
            user = userService.queryByPrimaryKey(user.getUserId());
            //更新用户的用户名和身份证号
            user.setUserName(name);
            user.setUserCard(card);
            //更新用户信息
            userService.updateByPrimaryKeySelective(user);
            //再次查询用户最新信息
            user = userService.queryByPrimaryKey(user.getUserId());
            //更新到session作用域中
            modelMap.addAttribute("user",user);
            map.put("query",true);
            return map;
        }catch (Exception e){
            e.printStackTrace();
            map.put("query",false);
            return map;
        }
    }


    /**
     * 查询手机号是否存在
     * @param phone
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryPhone")
    @ResponseBody
    public Map<String,Object> queryPhone(String phone)throws Exception{
        Map<String,Object> map = new HashMap<>();
        try{
            int count = userService.queryByPhone(phone);
            if (count==0){
                map.put("query",true);
            }else {
                map.put("query",false);
            }
            return map;
        }catch (Exception e){
            e.printStackTrace();
            map.put("query",false);
            return map;
        }

    }
}
