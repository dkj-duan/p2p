package cn.bdqn.controller;

import cn.bdqn.domain.fuKuan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class Test {
    @RequestMapping("/fuKuan")
    public String fuKuan1(String WIDout_trade_no,String WIDsubject,Double WIDtotal_amount,String WIDbody, ModelMap modelMap){

        modelMap.addAttribute("WIDout_trade_no",WIDout_trade_no);
        modelMap.addAttribute("WIDsubject",WIDsubject);
        modelMap.addAttribute("WIDtotal_amount",WIDtotal_amount);
        modelMap.addAttribute("WIDbody",WIDbody);
        return "alipay.trade.page.pay";
    }

    @RequestMapping("/add")
    public String add(){

        return "error";
    }
}
