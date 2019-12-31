package cn.bdqn.controller;


import cn.bdqn.domain.Balance;
import cn.bdqn.domain.Scattered;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.BalanceService;
import cn.bdqn.service.ScatteredService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * 散标
 */
@Controller
@RequestMapping("/scattered/")
@SessionAttributes(value ={"mess"})
public class ScatteredController {

    @Autowired
    private ScatteredService scatteredService;

    @Autowired
    private BalanceService balanceService;

    /**
     * 分页查询全部散标
     * @param modelMap
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectAll")
    public String selectAll(ModelMap modelMap,String pageNum)throws Exception{
        try {
            if (pageNum==null){
                pageNum="1";
            }
            //开启分页
            PageHelper.startPage(Integer.parseInt(pageNum),6);
            PageInfo<Scattered> products = new PageInfo<>(scatteredService.queryAll());
            modelMap.addAttribute("products",products);
            return "scattered";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }

    /**
     * 根基散标id查询
     * @param scId
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectByScId")
    public String selectByScId(@SessionAttribute("user") User user, Integer scId, ModelMap modelMap)throws Exception{

        try {
            //根据id查询散标信息
            Scattered scattered = scatteredService.queryByPrimaryKey(scId);
            //根据用户id查询用户可用金额
            Balance balance = balanceService.queryByUserId(user.getUserId());
            modelMap.addAttribute("scattered",scattered);
            modelMap.addAttribute("balance",balance);
            return "scatteredUI";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }


    /**
     * 添加散标对象
     * @param user
     * @param modelMap
     * @param scattered
     * @return
     * @throws Exception
     */
    @RequestMapping("/insert")
    public String insert(@SessionAttribute("user")User user,ModelMap modelMap,Scattered scattered)throws Exception{

        try{
            //封装对象
            scattered.setUser(user);
            scattered.setRate(10.8);
            scattered.setResidueMoney(scattered.getRentMoney());
            scatteredService.insertSelective(scattered);
            modelMap.addAttribute("mess","恭喜您，申请成功~");
            return "redirect:/product//selectAll";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误");
        }
    }
}
