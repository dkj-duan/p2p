package cn.bdqn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * 验证码
 */
@Controller
public class CheckCodeServlet {

    private static final long serialVersionUID = -8030863139248720433L;

    private static int WIDTH = 120;

    private static int HEIGHT = 30;

    @RequestMapping("/checkCodeServlet")
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 1、首先要有一张画布
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

        // 2、画笔
        Graphics graphics = image.getGraphics();

        // 2.1 背景
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, WIDTH, HEIGHT);

        // 2.3 验证的数字和字母
        String[] arrs = {"0" , "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9"};

        int x = 20;

        // 主要是为了组装验证码
        StringBuffer sb = new StringBuffer();
        for(int i = 0 ; i < 4 ; i++){
            int index = new Random().nextInt(arrs.length);

            String str = arrs[index];

            graphics.setColor(Color.darkGray);
            graphics.setFont(Font.getFont("宋体"));
            graphics.drawString(str, x * i + 5, 23);

            sb.append(str);
        }

//        // 2.4干扰线
//        for(int i = 0 ; i < 10 ; i++){
//
//            int x1 = new Random().nextInt(WIDTH);
//            int y1 = new Random().nextInt(HEIGHT);
//            int x2 = new Random().nextInt(WIDTH);
//            int y2 = new Random().nextInt(HEIGHT);
//
//            graphics.setColor(Color.GREEN);
//            graphics.drawLine(x1, y1, x2, y2);
//        }

        // 3、将生成好的验证码保存到session中
        HttpSession session = req.getSession();
        session.setAttribute("checkCode", sb.toString());

        // 4、返回给浏览器
        resp.setContentType("image/jpeg");
        resp.setDateHeader("expires", -1);
        resp.setHeader("Cache-Control", "no-cache");
        resp.setHeader("Pragma", "no-cache");
        ImageIO.write(image,"jpg",resp.getOutputStream());
    }
}
