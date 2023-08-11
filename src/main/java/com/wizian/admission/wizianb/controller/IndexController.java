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

    @GetMapping("/admin")
    public String admin(){return "/admin/index";}

    @GetMapping("/info")
    public String info(){
        return "/admin/nthInfo";
    }
    @GetMapping("/mozip")
    public String mozip(){return "/admin/nthMozip"; }
    @GetMapping("/notice")
    public String notice(){return "/admin/nthNotice"; }
    @GetMapping("/monhang")
    public String monhang(){return "/admin/nthMonhang"; }
    @GetMapping("/apply")
    public String apply(){return "/admin/nthApply";}

    @GetMapping("/apply1")
    public String applyForm() { return "/application/applicationIntroduce";}

}