package com.wizian.admission.wizianb.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recruitment")
public class RecruitmentController {

    @GetMapping("/view")
    public ResponseEntity<?> view(){
        return ResponseEntity.ok("view");
    }
}
