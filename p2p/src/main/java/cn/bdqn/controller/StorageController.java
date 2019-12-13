package cn.bdqn.controller;


import cn.bdqn.domain.Balance;
import cn.bdqn.domain.Storage;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.Date;

@Controller
@RequestMapping("/alipay/")
public class StorageController {

    @Autowired
    private StorageService storageService;
    @Autowired
    private BalanceService balanceService;
    @RequestMapping("/addPayment")
    public String payment(@SessionAttribute("user")User user,String WIDout_trade_no,String WIDsubject,Double WIDtotal_amount,String WIDbody, ModelMap modelMap)throws Exception{


        try{
            Storage storage = new Storage();
            storage.setUser(user);
            storage.setState("已充值");
            storage.setStorageTime(new Date());
            storage.setAnnotation(WIDbody);
            storage.setMoney(WIDtotal_amount);
            storage.setOrderNumber(WIDout_trade_no);
            System.out.println(storage);
            storageService.save(storage);
            //根据用户id查询用户可用资金
            Balance balance = balanceService.queryByUserId(user.getUserId());
            //更新可用资金
            balance.setUser(user);
            balance.setMoney(balance.getMoney()+storage.getMoney());
            balanceService.updateMoney(balance);
            //订单
            modelMap.addAttribute("WIDout_trade_no",WIDout_trade_no);
            //订单名称
            modelMap.addAttribute("WIDsubject",WIDsubject);
            //金额
            modelMap.addAttribute("WIDtotal_amount",WIDtotal_amount);
            //商品描述
            modelMap.addAttribute("WIDbody",WIDbody);

            return "alipay.trade.page.pay";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络出错了");
        }

    }

//    @RequestMapping("/addPayment")
//    public String payment(@SessionAttribute("user")User user, Storage storage, String WIDsubject, Balance balance, ModelMap modelMap)throws Exception{
//
//
//        try{
//            storage.setUser(user);
//            storage.setState("已充值");
//            storage.setStorageTime(new Date());
//            System.out.println(storage);
//            storageService.save(storage);
//
//            //更新可用资金
//            balance.setUser(user);
//            balance.setMoney(balance.getMoney()+storage.getMoney());
//            balanceService.updateMoney(balance);
//            //订单
//            modelMap.addAttribute("WIDout_trade_no",storage.getOrderNumber());
//            //订单名称
//            modelMap.addAttribute("WIDsubject",WIDsubject);
//            //金额
//            modelMap.addAttribute("WIDtotal_amount",storage.getMoney());
//            //商品描述
//            modelMap.addAttribute("WIDbody",storage.getAnnotation());
//
//            return "alipay.trade.page.pay";
//        }catch (Exception e){
//            e.printStackTrace();
//            throw new MyException("网络出错了");
//        }
//
//    }

    @RequestMapping("/skip")
    public String add(){

        return "p2p";
    }
}
