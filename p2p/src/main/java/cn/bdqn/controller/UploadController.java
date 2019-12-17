package cn.bdqn.controller;

import cn.bdqn.exception.MyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@RequestMapping("/upLoad")
public class UploadController {


    @RequestMapping("/up")
    @ResponseBody
    public void upload(HttpServletRequest request, MultipartFile touXiang)throws Exception{

        try{
            //获得上传路径
            String path = request.getServletContext().getRealPath("/upload/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }

        }catch (Exception e){
            throw new MyException("文件上传失败~");
        }
    }
}
