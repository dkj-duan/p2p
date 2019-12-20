package cn.bdqn.test;

import cn.bdqn.domain.Earnings;
import cn.bdqn.domain.Storage;
import cn.bdqn.domain.User;
import cn.bdqn.mapper.EarningsMapper;
import cn.bdqn.service.StorageService;
import cn.bdqn.utils.DateUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;
import java.util.logging.SocketHandler;

public class TsetS {

    @Test
    public void testSp()throws Exception{

        ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
        EarningsMapper earningsMapper = ac.getBean("earningsMapper", EarningsMapper.class);
        List<Earnings>  earnings = earningsMapper.selectByTypeAndUserId(1,19);
        System.out.println(earnings);
    }


    @Test
    public void date2String()throws Exception{

        System.out.println(DateUtil.date2String(new Date()).equals("2019-12-20"));
    }
}
