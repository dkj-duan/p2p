package cn.bdqn.controller;


import cn.bdqn.domain.*;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.BidService;
import cn.bdqn.service.EarningsService;
import cn.bdqn.service.ProductService;
import cn.bdqn.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
    //收益表
    @Autowired
    private EarningsService earningsService;

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
            balance.setMoney(balance.getMoney().subtract(bid.getBidMoney()));
            //更新金额
            balanceService.updateMoney(balance);

            //根据产品id查询产品
            Product product = productService.queryByPrimaryKey(productId);
            //减去投资金额
            product.setBalance(product.getBalance().subtract(bid.getBidMoney()));
            //判断剩余金额是否未0
            if (product.getBalance().compareTo(BigDecimal.ZERO)==0){
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

            //添加收益
            Earnings earnings = new Earnings();
            earnings.setUser(user);
            earnings.setProductId(productId);
            earnings.setBidId(bid.getId());
            String dateString = DateUtil.addDate(product.getPublishTime(),(product.getPeriod()*30));
            earnings.setEarningsTime(new SimpleDateFormat("yyyy-MM-dd").parse(dateString));

            //月利率
            Double yue = product.getRate()/100/12;
            //利息
            BigDecimal bigDecimal = bid.getBidMoney().multiply(new BigDecimal(yue + "")).multiply(new BigDecimal(product.getPeriod()));
            //计算收益
            DecimalFormat df = new DecimalFormat("0.00");
            //精确到小数点后两位
            earnings.setEarningsMoney(new BigDecimal(df.format(bigDecimal.add(bid.getBidMoney()))));
            earnings.setEarningsState(1);
            //添加收益
            earningsService.insert(earnings);
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

    @RequestMapping("/ajax")
    @ResponseBody
    public List<Bid> selectAjax(Integer productId)throws Exception{

        try {

            //根据产品id查询产品投资人
            List<Bid> bids = bidService.queryByProductId(productId);
            return bids;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出现错误~");
        }

    }
}
