package com.wizian.admission.wizianb.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//마이페이지
@Controller
public class Test_ApplicationJSP {
    @GetMapping("/app1")
    public String test1(Model model){

        return "/application/applicationChecked";
    }

    //원서작성페이지
    @GetMapping("/app2")
    public String test2(){

        return "/application/applicationWrite";
    }



    //합격자발표페이지
    @GetMapping("/app3")
    public String test3(){

        return "/application/applicationPass";
    }

    @GetMapping("/app4")
    public String test4(){

        return "/application/applicationPledge";
    }


    @GetMapping("/app5")
    public String test5(){

        return "/application/applicationEdu";
    }


    }




