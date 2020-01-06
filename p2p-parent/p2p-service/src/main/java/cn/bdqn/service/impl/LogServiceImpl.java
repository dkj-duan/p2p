package cn.bdqn.service.impl;

import cn.bdqn.domain.*;
import cn.bdqn.service.*;
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

    @Autowired
    private RecordService recordService;

    @Autowired
    private UserService userService;

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
            //还款记录对象
            Record record = new Record();
            if (DateUtil.date2String(new Date()).equals(DateUtil.date2String(repayment.getDueTime()))){
                //放款人对象
                User user = repayment.getPayeeUser();
                //获得还款人对象
                User repayUser = userService.queryByPrimaryKey(repayment.getRepayUserId());
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

                    //添加还款钱数
                    record.setRepayMoney(repayment.getRepayMoney());
                    //添加还款对象
                    record.setRepayUser(repayUser);
                    //添加收款人
                    record.setUser(user);
                    //添加散标id
                    record.setScId(repayment.getScattered().getScId());
                    //添加还款时间
                    record.setRepayTime(repayment.getPracticalTime());
                    //添加还款记录
                    recordService.insert(record);
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
            //还款记录对象
            Record record = new Record();
            if (DateUtil.date2String(new Date()).equals(DateUtil.date2String(repayment.getDueTime()))){
                //放款人对象
                User user = repayment.getPayeeUser();
                //获得还款人对象
                User repayUser = userService.queryByPrimaryKey(repayment.getRepayUserId());
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
                    if(repayment.getPeriods()==1){
                        repayment.setRepayMoney(repayment.getSurplusMonry());
                    }
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

                    //添加还款钱数
                    record.setRepayMoney(repayment.getRepayMoney());
                    //添加还款对象
                    record.setRepayUser(repayUser);
                    //添加收款人
                    record.setUser(user);
                    //添加散标id
                    record.setScId(repayment.getScattered().getScId());
                    //添加还款时间
                    record.setRepayTime(repayment.getPracticalTime());
                    //添加还款记录
                    recordService.insert(record);
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
