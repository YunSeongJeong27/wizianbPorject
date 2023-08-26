package com.wizian.admission.wizianb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {

    @GetMapping("userEdu")
    public String userEdu(Model model){
        model.addAttribute("title","학력사항");
        return "/application/applicationEdu";
    }
    @GetMapping("userExp")
    public String userExp(Model model){
        model.addAttribute("title","경력사항");
        return "/application/applicationExp";
    }
    @GetMapping("userIntroduce")
    public String userIntroduce(Model model){
        model.addAttribute("title","자기소개서");
        return "/application/applicationIntroduce";
    }



    @GetMapping("test")
    public String test(){
        return "/application/applicationLogin";
    }
}
