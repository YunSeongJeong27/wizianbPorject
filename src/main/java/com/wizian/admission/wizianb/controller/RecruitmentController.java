package com.wizian.admission.wizianb.controller;


import com.wizian.admission.wizianb.service.RecruitmentService;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Slf4j
@Controller
@RequiredArgsConstructor
public class RecruitmentController {

    private final RecruitmentService recruitmentService;

    @GetMapping("/recruitment/list")
    public ResponseEntity<ToastUiResponseDto> allRecruitmentList() {
        ToastUiResponseDto recruitmentList = recruitmentService.findAll();
        return ResponseEntity.ok(recruitmentList);
    }

    @PostMapping("/recruitment/insert")
    public ResponseEntity<ToastUiResponseDto> insertRecruitment(){
        return null;
    }
}