package cn.bdqn.domain;

import java.util.Date;

/**
 *投标记录表
 */
public class Bid {
    //投标记录id
    private Integer id;

    //产品对象
    private Integer productId;

    //用户对象
    private User user;

    //投标金额
    private Double bidMoney;

    //投标时间
    private Date bidTime;

    //投标状态
    private Integer bidState;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Double getBidMoney() {
        return bidMoney;
    }

    public void setBidMoney(Double bidMoney) {
        this.bidMoney = bidMoney;
    }

    public Date getBidTime() {
        return bidTime;
    }

    public void setBidTime(Date bidTime) {
        this.bidTime = bidTime;
    }

    public Integer getBidState() {
        return bidState;
    }

    public void setBidState(Integer bidState) {
        this.bidState = bidState;
    }
}