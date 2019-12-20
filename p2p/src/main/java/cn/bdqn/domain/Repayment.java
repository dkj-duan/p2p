package cn.bdqn.domain;

import java.util.Date;

public class Repayment {

    //还款id
    private Integer repId;

    //散标对象
    private Scattered scattered;

    //还款日
    private Date dueTime;

    //下一还款日
    private Date nexTime;

    //实际还款日
    private Date practicalTime;

    //还款金额
    private Double repayMoney;

    //剩余还款金额
    private Double surplusMonry;

    //还款日id
    private Integer repayUserId;

    //借款人对象
    private User payeeUser;

    //还款剩余期数
    private Integer periods;

    //还款状态
    private Integer state;

    public Integer getRepId() {
        return repId;
    }

    public void setRepId(Integer repId) {
        this.repId = repId;
    }

    public Date getDueTime() {
        return dueTime;
    }

    public void setDueTime(Date dueTime) {
        this.dueTime = dueTime;
    }

    public Date getNexTime() {
        return nexTime;
    }

    public void setNexTime(Date nexTime) {
        this.nexTime = nexTime;
    }

    public Date getPracticalTime() {
        return practicalTime;
    }

    public void setPracticalTime(Date practicalTime) {
        this.practicalTime = practicalTime;
    }

    public Double getRepayMoney() {
        return repayMoney;
    }

    public void setRepayMoney(Double repayMoney) {
        this.repayMoney = repayMoney;
    }

    public Double getSurplusMonry() {
        return surplusMonry;
    }

    public void setSurplusMonry(Double surplusMonry) {
        this.surplusMonry = surplusMonry;
    }

    public Integer getRepayUserId() {
        return repayUserId;
    }

    public void setRepayUserId(Integer repayUserId) {
        this.repayUserId = repayUserId;
    }

    public Scattered getScattered() {
        return scattered;
    }

    public void setScattered(Scattered scattered) {
        this.scattered = scattered;
    }

    public User getPayeeUser() {
        return payeeUser;
    }

    public void setPayeeUser(User payeeUser) {
        this.payeeUser = payeeUser;
    }

    public Integer getPeriods() {
        return periods;
    }

    public void setPeriods(Integer periods) {
        this.periods = periods;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}