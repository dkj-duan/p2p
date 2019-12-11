package cn.bdqn.domain;

import java.util.Date;

/**
 * 投标收益表
 */
public class Earnings {
    //收益id
    private Integer id;
    //用户对象
    private User user;

    //产品对象
    private Product product;

    //投标对象
    private Bid bid;

    //收益时间
    private Date earningsTime;

    //收益金额
    private Double earningsMoney;

    //收益状态
    private Integer earningsState;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Bid getBid() {
        return bid;
    }

    public void setBid(Bid bid) {
        this.bid = bid;
    }

    public Date getEarningsTime() {
        return earningsTime;
    }

    public void setEarningsTime(Date earningsTime) {
        this.earningsTime = earningsTime;
    }

    public Double getEarningsMoney() {
        return earningsMoney;
    }

    public void setEarningsMoney(Double earningsMoney) {
        this.earningsMoney = earningsMoney;
    }

    public Integer getEarningsState() {
        return earningsState;
    }

    public void setEarningsState(Integer earningsState) {
        this.earningsState = earningsState;
    }
}