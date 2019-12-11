package cn.bdqn.domain;


/**
 * 资金表
 */

public class Balance {
    //资金id
    private Integer id;

    //用户对象
    private User user;

    //可用资金
    private Double money;

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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}