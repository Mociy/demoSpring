package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
public class Test {
    @RequestMapping("/two")
    public String name(){
        System.out.println(1111);
        return "hello";
    }
}
