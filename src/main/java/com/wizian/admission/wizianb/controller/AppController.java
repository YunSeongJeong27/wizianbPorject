package com.wizian.admission.wizianb.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AppController {

    @GetMapping("/checked")
    public String checked(HttpSession session, Model model){
        System.out.println(session.getAttribute("login"));
        model.addAttribute("title","마이페이지");
        return "/application/applicationChecked";
    }

    @GetMapping("/pass")
    public String pass(Model model){
        model.addAttribute("title", "합격자발표");
        return "/application/applicationPass";
    }
    @GetMapping("/pledge")
    public String pledge(Model model){
        model.addAttribute("title","등록서약/포기");
        return "/application/applicationPledge";
    }

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
