package cn.bdqn.controller;


import cn.bdqn.domain.Product;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 产品信息控制器
 */
@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 根据类型分页查询
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectAll")
    public String selectAllProduct(ModelMap modelMap) throws Exception{
        try{

            //开启分页
            PageHelper.startPage(1,5);
            //类型1U享
            PageInfo<Product> products1 = new PageInfo<>(productService.queryByAll(1));
            //开启分页
            PageHelper.startPage(1,5);
            //类型2薪享
            PageInfo<Product> products2 = new PageInfo<>(productService.queryByAll(2));
            //放在作用域中
            modelMap.addAttribute("products1",products1);
            modelMap.addAttribute("products2",products2);
            return "p2p";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络异常");
        }
    }

    /**
     * 根据类型查看
     * @param type
     * @param modelMap
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectByType")
    public String selectByType(Integer type,ModelMap modelMap,String pageNum)throws Exception{
        try{
            if (pageNum==null){
                pageNum = "1";
            }
            PageHelper.startPage(Integer.parseInt(pageNum),6);
            PageInfo<Product> products = new PageInfo<>(productService.queryByAll(type));
            modelMap.addAttribute("products",products);
            modelMap.addAttribute("type",type);
            return "UEnjoy";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络异常!");
        }
    }

    /**
     * 跳转到产品详细信息页面
     * @param id
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectById")
    public String selectById(Integer id,ModelMap modelMap)throws Exception{

        try {
            //根据id查询产品信息
            Product product = productService.queryByPrimaryKey(id);
            modelMap.addAttribute("product",product);
            return "particular";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出现错误~");
        }

    }
}
