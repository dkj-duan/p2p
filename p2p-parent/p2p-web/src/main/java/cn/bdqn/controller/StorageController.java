package cn.bdqn.controller;


import cn.bdqn.domain.Balance;
import cn.bdqn.domain.Storage;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.StorageService;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping("/alipay/")
public class StorageController {

    @Autowired
    private StorageService storageService;
    @Autowired
    private BalanceService balanceService;


    @RequestMapping("/addPayment")
    public String payment(String WIDout_trade_no, String WIDsubject, BigDecimal WIDtotal_amount, String WIDbody, ModelMap modelMap) throws Exception {
        try {
            //订单
            modelMap.addAttribute("WIDout_trade_no", WIDout_trade_no);
            //订单名称
            modelMap.addAttribute("WIDsubject", WIDsubject);
            //金额
            modelMap.addAttribute("WIDtotal_amount", WIDtotal_amount);
            //商品描述
            modelMap.addAttribute("WIDbody", WIDbody);

            return "alipay.trade.page.pay";

        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException("网络出错了");
        }

    }

    /**
     * 打开充值页面
     *
     * @param money
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/addUlAlipay")
    public String addUlAlipay(String money, ModelMap modelMap) throws Exception {

        try {
            modelMap.addAttribute("money", money);
            return "alipay";
        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException("出错了");
        }

    }


    @RequestMapping("/selectByUsrId")
    @ResponseBody
    public List<Storage> selectByUserId(Integer userId) throws Exception {
        try {
            //根据用户id查询用户充值记录
            List<Storage> storages = storageService.queryByUserId(userId);
            return storages;
        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException("查询出错");
        }
    }

    @RequestMapping(value = "/alipayReturnNotice")
    public String alipayReturnNotice(@SessionAttribute("user")User user, HttpServletRequest request, ModelMap mv,String body) throws Exception {

        try{
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        if (signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            Storage storage = storageService.queryByOrderNumber(trade_no);
            if (storage == null) {
                storage = new Storage();
                storage.setUser(user);
                storage.setState("已充值");
                storage.setStorageTime(new Date());
                storage.setAnnotation(body);
                storage.setMoney(new BigDecimal(total_amount));
                storage.setOrderNumber(trade_no);
                System.out.println(storage);
                storageService.save(storage);
                //根据用户id查询用户可用资金
                Balance balance = balanceService.queryByUserId(user.getUserId());
                //更新可用资金
                balance.setUser(user);
                balance.setMoney(balance.getMoney().add(storage.getMoney()));
                balanceService.updateByPrimaryKey(balance);
            }
        } else {

        }
        return "forward:/user//selectById";
        }catch (Exception e){
            e.printStackTrace();
            return "forward:/user//selectById";
        }
    }


//    @RequestMapping(value = "/alipayNotifyUrl")
//    @ResponseBody
//    public String alipayNotifyNotice(HttpServletRequest request, HttpServletRequest response) throws Exception {
//
//        try {
//        //获取支付宝POST过来反馈信息
//        Map<String, String> params = new HashMap<String, String>();
//        Map<String, String[]> requestParams = request.getParameterMap();
//        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
//            String name = (String) iter.next();
//            String[] values = (String[]) requestParams.get(name);
//            String valueStr = "";
//            for (int i = 0; i < values.length; i++) {
//                valueStr = (i == values.length - 1) ? valueStr + values[i]
//                        : valueStr + values[i] + ",";
//            }
//            System.out.println(valueStr);
//            //乱码解决，这段代码在出现乱码时使用
////			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
//            params.put(name, valueStr);
//        }
//
//        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
//
//        //——请在这里编写您的程序（以下代码仅作参考）——
//
//		/* 实际验证过程建议商户务必添加以下校验：
//		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
//		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
//		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
//		4、验证app_id是否为该商户本身。
//		*/
//        if (signVerified) {//验证成功
//            //商户订单号
//            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
//
//            //支付宝交易号
//            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
//
//            //交易状态
//            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
//
//            //付款金额
//            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
//
//            //订单描述
//            //String body = new String(request.getParameter("body").getBytes("ISO-8859-1"), "UTF-8");
//
//            if (trade_status.equals("TRADE_FINISHED")) {
//                System.out.println("失败");
//                //判断该笔订单是否在商户网站中已经做过处理
//                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//                //如果有做过处理，不执行商户的业务程序
//
//                //注意： 尚自习的订单没有退款功能, 这个条件判断是进不来的, 所以此处不必写代码
//                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
//            } else if (trade_status.equals("TRADE_SUCCESS")) {
//                System.out.println("成功");
//                //判断该笔订单是否在商户网站中已经做过处理
//                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//                //如果有做过处理，不执行商户的业务程序
//
//                //注意：
//                //付款完成后，支付宝系统发送该交易状态通知
//
//                // 修改叮当状态，改为 支付成功，已付款; 同时新增支付流水
//
//
//            } else {//验证失败
//                System.out.println("失败飒飒飒");
//            }
//        }
//        return "success";
//        }catch (Exception e){
//            e.printStackTrace();
//            return "success";
//        }
//    }
}

