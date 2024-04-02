package com.study.springboot.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@Slf4j
public class HelloController {

    @RequestMapping({"/hello", "/"})
    public String hello(HttpServletRequest request) {
        return "Hello World at " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}