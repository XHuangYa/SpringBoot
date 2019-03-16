package com.bakery.application;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OmsApplicationTests {

    @Autowired
    UserDAO userDAO;
    @Test
    public void contextLoads() {
        List<User> users = userDAO.select();
        System.out.println(users+"-----");
    }

}
