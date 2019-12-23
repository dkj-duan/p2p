package cn.bdqn.controller;


import cn.bdqn.domain.Loan;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequestMapping("/loan/")
public class LoanController {

    @Autowired
    private LoanService loanService;

    @RequestMapping("/selectByScId")
    @ResponseBody
    public List<Loan> selectByScId(Integer scId)throws Exception{

        try {
            List<Loan> loans = loanService.queryByScId(scId);
            return loans;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }

    /**
     * 根据userid查询
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectByUserId")
    @ResponseBody
    public List<Loan> selectByUserId(@SessionAttribute("user")User user)throws Exception{

        try {
            List<Loan> loans = loanService.queryByUserId(user.getUserId());
            return loans;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }
}
