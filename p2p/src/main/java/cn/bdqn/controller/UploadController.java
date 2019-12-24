package cn.bdqn.controller;

import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.UserService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/upLoad")
@SessionAttributes(value = {"user"})
public class UploadController {


    @Autowired
    private UserService userService;

    @RequestMapping("/up")
    @ResponseBody
    public Map<String,Object> upload(@SessionAttribute("user")User user, HttpServletRequest request, MultipartFile file, ModelMap modelMap) throws Exception {
        Map<String,Object> map = new HashMap<>();
        try {
            //获得上传路径
            String path = request.getServletContext().getRealPath("/upload/");
            File file1 = new File(path);
            if (!file1.exists()) {
                file1.mkdirs();
            }
            //获得文件的名字
            String originalFilename = file.getOriginalFilename();
            //UUID获得唯一标识
            originalFilename = UUID.randomUUID().toString().replaceAll("-", "") + "_"+originalFilename;
            //上传
            file.transferTo(new File(file1, originalFilename));
            //更新用户头像路径
            user.setUserImg(originalFilename);
            //更新用户信息
            userService.updateByPrimaryKeySelective(user);
            //更新最新的session用户信息
            modelMap.addAttribute("user",user);
            map.put("query",true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("query",false);
            return map;
        }
    }

}
