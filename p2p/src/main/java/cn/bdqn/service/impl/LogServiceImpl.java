package cn.bdqn.service.impl;

import cn.bdqn.domain.Balance;
import cn.bdqn.domain.Earnings;
import cn.bdqn.domain.Repayment;
import cn.bdqn.domain.User;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.EarningsService;
import cn.bdqn.service.LogService;
import cn.bdqn.service.RepaymentService;
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

    @Autowired
    private RepaymentService repaymentService;

    List<Earnings> earnings = new ArrayList<>();

    //查询还款记录
    List<Repayment> repayments = new ArrayList<>();
    @Scheduled(cron = "0 0 0 * * ? ")
    public void updateEarnings()throws Exception {
        //查询没有获得收益的订单
        earnings = earningsService.queryByEarningsState();
        //查询需要还款的信息
        repayments = repaymentService.queryByState();
        //循环遍历未还款的信息
        for (int i=0;i<repayments.size();i++){
            //判断今天是否等于还款日期
            Repayment repayment = repayments.get(i);
            if (DateUtil.date2String(new Date()).equals(DateUtil.date2String(repayment.getDueTime()))){
                //放款人对象
                User user = repayment.getPayeeUser();
                //获得放款人可用资金
                Balance balance = balanceService.queryByUserId(user.getUserId());
                //获得还款人可用资金
                Balance repayBalance = balanceService.queryByUserId(repayment.getRepayUserId());
                //判断还款人资金是否充足
                if (repayBalance.getMoney().compareTo(repayment.getRepayMoney())==1){
                    //更换还款日
                    repayment.setDueTime(repayment.getNexTime());;
                    //计算下次还款日期
                    repayment.setNexTime(DateUtil.string2Date(repayment.getNexTime(),30));
                    //添加实际还款日
                    repayment.setPracticalTime(new Date());
                    //计算剩余金额
                    repayment.setSurplusMonry(repayment.getSurplusMonry().subtract(repayment.getRepayMoney()));
                    //计算剩余期数
                    repayment.setPeriods(repayment.getPeriods()-1);
                    if (repayment.getPeriods()==0){
                        //更新还款状态
                        repayment.setState(2);
                    }
                    //更新双方可用资金
                    //更新放款人可用资金
                    balance.setMoney(balance.getMoney().add(repayment.getRepayMoney()));
                    balanceService.updateByPrimaryKey(balance);
                    //更新还款人可用资金
                    repayBalance.setMoney(repayBalance.getMoney().subtract(repayment.getRepayMoney()));
                    balanceService.updateByPrimaryKey(repayBalance);
                }else {
                    System.out.println("还款人用户资金不足~");
                }
            }else {
                System.out.println("没到还款日期~");
            }
        }
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
    public void updateEarnings2()throws Exception {
        //查询没有获得收益的订单
        earnings = earningsService.queryByEarningsState();
        //查询需要还款的信息
        repayments = repaymentService.queryByState();
        //循环遍历未还款的信息
        for (int i=0;i<repayments.size();i++){
            //判断今天是否等于还款日期
            Repayment repayment = repayments.get(i);
            if (DateUtil.date2String(new Date()).equals(DateUtil.date2String(repayment.getDueTime()))){
                //放款人对象
                User user = repayment.getPayeeUser();
                //获得放款人可用资金
                Balance balance = balanceService.queryByUserId(user.getUserId());
                //获得还款人可用资金
                Balance repayBalance = balanceService.queryByUserId(repayment.getRepayUserId());
                //判断还款人资金是否充足
                if (repayBalance.getMoney().compareTo(repayment.getRepayMoney())==1){
                    //更换还款日
                    repayment.setDueTime(repayment.getNexTime());;
                    //计算下次还款日期
                    repayment.setNexTime(DateUtil.string2Date(repayment.getNexTime(),30));
                    //添加实际还款日
                    repayment.setPracticalTime(new Date());
                    //计算剩余金额
                    repayment.setSurplusMonry(repayment.getSurplusMonry().subtract(repayment.getRepayMoney()));
                    //计算剩余期数
                    repayment.setPeriods(repayment.getPeriods()-1);
                    if (repayment.getPeriods()==0){
                        //更新还款状态
                        repayment.setState(2);
                    }
                    repaymentService.updateByPrimaryKey(repayment);
                    //更新双方可用资金
                    //更新放款人可用资金
                    balance.setMoney(balance.getMoney().add(repayment.getRepayMoney()));
                    balanceService.updateByPrimaryKey(balance);
                    //更新还款人可用资金
                    repayBalance.setMoney(repayBalance.getMoney().subtract(repayment.getRepayMoney()));
                    balanceService.updateByPrimaryKey(repayBalance);
                }else {
                    System.out.println("还款人用户资金不足~");
                }
            }else {
                System.out.println("没到还款日期~");
            }
        }
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
