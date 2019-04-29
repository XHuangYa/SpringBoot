package com.bakery.application;

import com.bakery.application.service.PersonService;
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
    PersonService personService;
    @Test
    public void Test(){
        List<person> p=personService.select();
        System.out.println(p+"---");
    }


}
