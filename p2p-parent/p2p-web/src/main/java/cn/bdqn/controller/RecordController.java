package cn.bdqn.controller;

import cn.bdqn.domain.Record;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.RecordService;
import net.sf.jsqlparser.statement.execute.Execute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/record/")
public class RecordController {

    @Autowired
    private RecordService recordService;

    @RequestMapping("/addRecord")
    public String addUiRecord(ModelMap modelMap,Integer scId)throws Exception{
        try {
            modelMap.addAttribute("scId",scId);
            return "record";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }
    }

    @RequestMapping("/addUiRepayRecord")
    public String addUiRepayRecord(ModelMap modelMap,Integer scId)throws Exception{
        try {
            modelMap.addAttribute("scId",scId);
            return "repayRecord";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }
    }
    @RequestMapping("/selectRecord")
    @ResponseBody
    public List<Record> selectRecord(@SessionAttribute("user") User user, Integer scId)throws Exception{

        try {
            //根据用户查询
            List<Record> records =  recordService.queryByUserIdAndScId(user.getUserId(),scId);
            return records;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }

    }

    @RequestMapping("/selectRepayRecord")
    @ResponseBody
    public List<Record> selectRepayRecord(@SessionAttribute("user")User repayUser,Integer scId)throws Exception{
        try {
            List<Record> records = recordService.queryByRepayUserIdAndScId(repayUser.getUserId(),scId);
            return records;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }
    }
}
