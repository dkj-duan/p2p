package cn.bdqn.controller;

import cn.bdqn.domain.Earnings;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.EarningsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequestMapping("/earnings/")
public class EarningsController {

    @Autowired
    private EarningsService earningsService;

    @RequestMapping("/selectByTypeAndUserId")
    @ResponseBody
    public List<Earnings> selectByTypeAndUserId(Integer type, @SessionAttribute("user")User user)throws Exception{

        try {

            //根据产品类型和用户id查询
            List<Earnings> earnings = earningsService.queryByTypeAndUserId(type,user.getUserId());
            return earnings;

        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误");
        }


    }
}
