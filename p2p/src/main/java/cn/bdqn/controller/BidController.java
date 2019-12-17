package cn.bdqn.controller;


import cn.bdqn.domain.Balance;
import cn.bdqn.domain.Bid;
import cn.bdqn.domain.Product;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.BidService;
import cn.bdqn.service.ProductService;
import cn.bdqn.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.Date;

@Controller
@RequestMapping("/bid/")
public class BidController {

    //投资表
    @Autowired
    private BidService bidService;

    //资金表
    @Autowired
    private BalanceService balanceService;

    //产品表
    @Autowired
    private ProductService productService;

    @RequestMapping("/invest")
    public String insert(@SessionAttribute("user")User user, Integer productId, Bid bid, ModelMap modelMap)throws Exception{
        try {
            //封装数据
            bid.setUser(user);
            bid.setBidTime(new Date());
            bid.setProductId(productId);
            bid.setBidState(1);
            //调用添加方法
            bidService.insert(bid);
            //根据用户id查询用户可用余额
            Balance balance = balanceService.queryByUserId(user.getUserId());
            //减去投标金额
            balance.setMoney(balance.getMoney()-bid.getBidMoney());
            //更新金额
            balanceService.updateMoney(balance);

            //根据产品id查询产品
            Product product = productService.queryByPrimaryKey(productId);
            //减去投资金额

            product.setBalance(product.getBalance()-bid.getBidMoney());
            //判断剩余金额是否未0
            if (product.getBalance()==0){
                product.setFinishTime(bid.getBidTime());
                //把产品指定为满标
                product.setState(2);
            }
            //更新剩余金额
            productService.updateByPrimaryKeySelective(product);
            //重写查询最新产品数据
            product = productService.queryByPrimaryKey(productId);
            //查询最新用户可用资金
            balance = balanceService.queryByUserId(user.getUserId());
            modelMap.addAttribute("product",product);
            String finish = DateUtil.addDate(product.getPublishTime(), product.getPeriod()*30);
            modelMap.addAttribute("balance",balance);
            modelMap.addAttribute("finish",finish);
            return "particular";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("投资失败");
        }
    }
}
