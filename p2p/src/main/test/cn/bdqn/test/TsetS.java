package cn.bdqn.test;

import cn.bdqn.domain.Storage;
import cn.bdqn.domain.User;
import cn.bdqn.service.StorageService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

public class TsetS {

    @Test
    public void testSp()throws Exception{

        ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
        StorageService storageService = ac.getBean("storageService", StorageService.class);
        User user = new User();
        user.setUserId(1);
        Storage storage = new Storage();
        storage.setUser(user);
        storage.setStorageTime(new Date());
        storage.setState("1");
        storage.setAnnotation("aq");
        storage.setMoney(100.00);
        storage.setOrderNumber("12345");
        storageService.save(storage);
    }
}
