package cn.bdqn.domain;

/**
 * 散标投资表
 */
public class Loan {
    //id
    private Integer loanId;

    //投标用户
    private User user;

    //散标对象
    private Scattered scattered;

    //借出的钱数
    private Double loanMoney;

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

    public Double getLoanMoney() {
        return loanMoney;
    }

    public void setLoanMoney(Double loanMoney) {
        this.loanMoney = loanMoney;
    }
}