package cn.bdqn.domain;

import java.math.BigDecimal;

/**
 * 散标表
 */
public class Scattered {

    //散标id
    private Integer scId;

    //散标发起人
    private User user;

    //借款钱数
    private BigDecimal rentMoney;

    //剩余钱数
    private BigDecimal residueMoney;

    //还款周期
    private Integer periods;

    //利率
    private double rate;

    //散标状态
    private Integer state;

    //说明
    private String annotation;

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getRentMoney() {
        return rentMoney;
    }

    public void setRentMoney(BigDecimal rentMoney) {
        this.rentMoney = rentMoney;
    }

    public BigDecimal getResidueMoney() {
        return residueMoney;
    }

    public void setResidueMoney(BigDecimal residueMoney) {
        this.residueMoney = residueMoney;
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

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation == null ? null : annotation.trim();
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}