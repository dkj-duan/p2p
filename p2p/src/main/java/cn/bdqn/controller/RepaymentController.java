package cn.bdqn.controller;

import cn.bdqn.domain.*;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.*;
import cn.bdqn.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;

@Controller
@RequestMapping("/repayment/")
public class RepaymentController {

    @Autowired
    private RepaymentService repaymentService;
    @Autowired
    private LoanService loanService;
    @Autowired
    private ScatteredService scatteredService;
    @Autowired
    private UserService userService;
    @Autowired
    private BalanceService balanceService;

    @RequestMapping("/addRepayment")
    public String addRepayment(@SessionAttribute("user") User user, ModelMap modelMap, Repayment repayment, Integer loanMoney, Integer scId) throws Exception {

        try {
            //获得还款人对象
            User repayUser = userService.queryByPrimaryKey(repayment.getRepayUserId());
            //新增散标投注表
            Loan loan = new Loan();
            //出借的钱数
            loan.setLoanMoney(new BigDecimal(loanMoney));
            //出借人人对象
            loan.setUser(user);
            //借款人id
            loan.setLoanUserId(repayment.getRepayUserId());
            //获得散标对象
            Scattered scattered = scatteredService.queryByPrimaryKey(scId);
            //散标id
            loan.setScattered(scattered);
            //添加散标投标对象
            loanService.insert(loan);

            //更新借款人可用资金
            Balance repayBalance = balanceService.queryByUserId(repayUser.getUserId());
            //增加借款的金额
            repayBalance.setMoney(repayBalance.getMoney().add(new BigDecimal(loanMoney)));
            //更新借款人金额
            balanceService.updateByPrimaryKey(repayBalance);
            //根据放款人id查询账户可用金额
            Balance balance = balanceService.queryByUserId(user.getUserId());
            //减去借出去的金额
            balance.setMoney(balance.getMoney().subtract(new BigDecimal(loanMoney)));
            //更新账户可用金额
            balanceService.updateByPrimaryKey(balance);

            //查询账户最新余额
            balance = balanceService.queryByUserId(user.getUserId());

            //添加还款对象
            //1.计算还款日
            Date dueTime = DateUtil.string2Date(new Date(), 30);
            repayment.setDueTime(dueTime);
            //2.计算下一还款日
            Date nexTime = DateUtil.string2Date(dueTime, 30);
            repayment.setNexTime(nexTime);
            //添加散标对象
            repayment.setScattered(scattered);

            //计算每月还款钱数
            Double yue = scattered.getRate() / 100 / 12;//获得每月的利率
            //获得总共的利息
            BigDecimal interest = new BigDecimal(loanMoney * yue * scattered.getPeriods());
            //计算每个月要还的钱
            DecimalFormat df = new DecimalFormat("0.00");
             //总共要还的钱
            BigDecimal sum = new BigDecimal(df.format(interest.add(new BigDecimal(loanMoney))));
            System.out.println(sum);
            BigDecimal yueSum = new BigDecimal(df.format(sum.divide(new BigDecimal(scattered.getPeriods()),2,BigDecimal.ROUND_HALF_UP)));
            //添加放款人id
            repayment.setPayeeUser(user);
            repayment.setRepayUserId(scattered.getUser().getUserId());
            //每月的还款数
            repayment.setRepayMoney(yueSum);
            //剩余还款数
            repayment.setSurplusMonry(sum);
            //还款状态
            repayment.setState(1);
            //添加还款对象
            repaymentService.insert(repayment);

            //更新散标对象
            scattered.setResidueMoney(scattered.getResidueMoney().subtract(new BigDecimal(loanMoney)));
            //判断是否有剩余金额
            if (scattered.getResidueMoney().compareTo(BigDecimal.ZERO)==0){
                scattered.setState(2);
            }
            //更新剩余金额
            scatteredService.updateByPrimaryKeySelective(scattered);
            //查询当前散标的最新状态
            scattered = scatteredService.queryByPrimaryKey(scId);

            modelMap.addAttribute("scattered",scattered);
            modelMap.addAttribute("balance",balance);

            return "scatteredUI";

        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }
}
