package cn.bdqn.test;

import cn.bdqn.domain.Storage;
import cn.bdqn.domain.User;
import cn.bdqn.service.StorageService;
import cn.bdqn.utils.DateUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.logging.SocketHandler;

public class TsetS {

    @Test
    public void testSp()throws Exception{

        System.out.println(DateUtil.addDate(new Date(),360));

    }
}
