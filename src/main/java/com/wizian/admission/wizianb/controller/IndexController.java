package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.annotation.CurrentUser;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(){
        return "/index";
    }

    //회원페이지이동
    @GetMapping("/userPage")
    public String userPage(){
        return "redirect:/app";}
    //관리자페이지로 이동
    @GetMapping("/adminPage")
    public String adminPage(){
        return "redirect:/admin";}
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
    @GetMapping("/apply_ex")
    public String apply_ex(){return "/admin/nthApply_ex";}
    @GetMapping("/apply")
    public String apply(){return "/admin/nthApply";}
    @GetMapping("/interviewPass")
    public String interviewPass(){return "/admin/nthInterviewPass";}
    @GetMapping("/applicationPass")
    public String applicationPass(){return "/admin/nthApplicationPass";}

    @GetMapping("/finalPass")
    public String finalPass() { return "/admin/nthFinal";}
    @GetMapping("/nthEvResults")
    public String evaluationResults() { return "/admin/nthEvResults";}

    @GetMapping("/test11")
    public String test(){return "/sign_up";}

}