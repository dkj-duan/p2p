package cn.bdqn.domain;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 *  充值记录表
 */
@Component
public class Storage {
    //充值id
    private Integer id;

    //用户对象
    private User user;

    //充值订单号
    private String orderNumber;

    //充值状态
    private String state;

    //充值金额
    private Double money;

    //充值时间
    private Date storageTime;

    //充值说明
    private String annotation;

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

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getStorageTime() {
        return storageTime;
    }

    public void setStorageTime(Date storageTime) {
        this.storageTime = storageTime;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    @Override
    public String toString() {
        return "Storage{" +
                "id=" + id +
                ", user=" + user +
                ", orderNumber='" + orderNumber + '\'' +
                ", state='" + state + '\'' +
                ", money=" + money +
                ", storageTime=" + storageTime +
                ", annotation='" + annotation + '\'' +
                '}';
    }
}