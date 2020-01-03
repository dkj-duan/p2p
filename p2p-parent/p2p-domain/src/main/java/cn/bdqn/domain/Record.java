package cn.bdqn.domain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 还款记录表
 */
public class Record {

    //还款记录id
    private Integer reId;

    //还款人id
    private User repayUser;

    //收款对象
    private User user;

    //散标id
    private Integer scId;

    //还款金额
    private BigDecimal repayMoney;

    //还款时间
    private Date repayTime;

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public Integer getReId() {
        return reId;
    }

    public void setReId(Integer reId) {
        this.reId = reId;
    }

    public User getRepayUser() {
        return repayUser;
    }

    public void setRepayUser(User repayUser) {
        this.repayUser = repayUser;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getRepayMoney() {
        return repayMoney;
    }

    public void setRepayMoney(BigDecimal repayMoney) {
        this.repayMoney = repayMoney;
    }

    public Date getRepayTime() {
        return repayTime;
    }

    public void setRepayTime(Date repayTime) {
        this.repayTime = repayTime;
    }
}