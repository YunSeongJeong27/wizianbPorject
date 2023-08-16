package com.wizian.admission.wizianb.controller;


import com.wizian.admission.wizianb.service.RecruitmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recruitment")
public class RecruitmentController {

    private final RecruitmentService recruitmentService;

    @GetMapping("/view")
    public ResponseEntity<?> view(){
        return ResponseEntity.ok(recruitmentService.findAll());
    }
}
