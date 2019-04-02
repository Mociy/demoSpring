package com.example.demo.project;

import com.example.demo.DemoApplication;
import com.example.demo.service.imp.MyintService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = DemoApplication.class)
public class MySpringControllerTest {

    @Autowired
   private MyintService myintService;
    @Test
    public void getAll() {
        System.out.println(myintService.queryAll().get(0).getContent());
    }

    @Test
    public void getpage() {
    }

    @Test
    public void getNews() {
    }
}