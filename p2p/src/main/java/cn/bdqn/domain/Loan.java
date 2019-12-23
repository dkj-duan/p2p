package cn.bdqn.domain;

import java.math.BigDecimal;

/**
 * 散标投资表
 */
public class Loan {
    //id
    private Integer loanId;

    //借款人id
    private Integer loanUserId;

    //还款人对象
    private User dueUser;

    //出借用户
    private User user;

    //散标对象
    private Scattered scattered;

    //借出的钱数
    private BigDecimal loanMoney;


    public User getDueUser() {
        return dueUser;
    }

    public void setDueUser(User dueUser) {
        this.dueUser = dueUser;
    }

    public Integer getLoanId() {
        return loanId;
    }

    public void setLoanId(Integer loanId) {
        this.loanId = loanId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Scattered getScattered() {
        return scattered;
    }

    public void setScattered(Scattered scattered) {
        this.scattered = scattered;
    }

    public BigDecimal getLoanMoney() {
        return loanMoney;
    }

    public void setLoanMoney(BigDecimal loanMoney) {
        this.loanMoney = loanMoney;
    }
    public Integer getLoanUserId() {
        return loanUserId;
    }

    public void setLoanUserId(Integer loanUserId) {
        this.loanUserId = loanUserId;
    }
}