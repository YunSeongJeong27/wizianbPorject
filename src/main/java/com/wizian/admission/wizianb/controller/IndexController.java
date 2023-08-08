package com.wizian.admission.wizianb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("hello","하이헬로우 안녕");
        return "/index";
    }

    @GetMapping("/test")
    public String test(){
        return "/side";
    }

    @GetMapping("/nth")
    public String nth(){
        return "nthInfo";
    }

    @GetMapping("/apply")
    public String applyForm() { return "/application/application_add";}
}
