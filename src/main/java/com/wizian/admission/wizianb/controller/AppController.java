package com.wizian.admission.wizianb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AppController {
    @GetMapping("/userEdu/{rcrtNo}/{aplyNo}")
    public String userEdu(@PathVariable("rcrtNo")String rcrtNo,@PathVariable("aplyNo")String aplyNo, Model model){
        model.addAttribute("rcrtNo",rcrtNo);
        model.addAttribute("aplyNo",aplyNo);
        model.addAttribute("title","학력사항");
        return "/application/applicationEdu";
    }
    @GetMapping("/userExp/{rcrtNo}/{aplyNo}")
    public String userExp(@PathVariable("rcrtNo")String rcrtNo,@PathVariable("aplyNo")String aplyNo,  Model model){
        model.addAttribute("rcrtNo",rcrtNo);
        model.addAttribute("aplyNo",aplyNo);
        model.addAttribute("title","경력사항");
        return "/application/applicationExp";
    }
    @GetMapping("/userIntroduce")
    public String userIntroduce(Model model){
        model.addAttribute("title","자기소개서");
        return "/application/applicationIntroduce";
    }



    @GetMapping("test")
    public String test(){
        return "/application/applicationLogin";
    }

}
