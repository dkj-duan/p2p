package cn.bdqn.service.impl;

import cn.bdqn.domain.Balance;
import cn.bdqn.domain.Earnings;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.EarningsService;
import cn.bdqn.service.LogService;
import cn.bdqn.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("logService")
public class LogServiceImpl implements LogService {

    @Autowired
    private EarningsService earningsService;

    @Autowired
    private BalanceService balanceService;

    List<Earnings> earnings = new ArrayList<>();

    @Scheduled(cron = "0 0 0 * * ? ")
    public void updateEarnings() {
        //查询没有获得收益的订单
        earnings = earningsService.queryByEarningsState();
        for (int i=0;i<earnings.size();i++){
            //判断收益时间是否等于今天
            if (DateUtil.date2String(new Date()).equals(DateUtil.date2String(earnings.get(i).getEarningsTime()))){
                //更新收益状态
                earningsService.updateEarningsState(earnings.get(i).getId());
                Balance balance = new Balance();
                //获得对象
                balance.setUser(earnings.get(i).getUser());
                //获得收益钱数
                balance.setMoney(earnings.get(i).getEarningsMoney());
                //更新可用资金
                balanceService.updateMoney(balance);
                System.out.println("发放收益成功~");
            }
        }
    }

    @Scheduled(initialDelay = 9000,fixedDelay = 24*60*60*60)
    public void updateEarnings2() {
        //查询没有获得收益的订单
        earnings = earningsService.queryByEarningsState();
        for (int i=0;i<earnings.size();i++){
            //判断收益时间是否等于今天
            if (DateUtil.date2String(new Date()).equals(DateUtil.date2String(earnings.get(i).getEarningsTime()))){
                //更新收益状态
                earningsService.updateEarningsState(earnings.get(i).getId());
                Balance balance = new Balance();
                //获得对象
                balance.setUser(earnings.get(i).getUser());
                //获得收益钱数
                balance.setMoney(earnings.get(i).getEarningsMoney());
                System.out.println(balance);
                //更新可用资金
                balanceService.updateMoney(balance);
                System.out.println("发放收益成功~");
            }else {
                System.out.println("没到收益日期");
            }
        }
    }
}
