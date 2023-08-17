package com.wizian.admission.wizianb.controller;


import com.wizian.admission.wizianb.service.RecruitmentService;
import dto.ToastUiResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Slf4j
@Controller
@RequiredArgsConstructor
public class RecruitmentController {

    private final RecruitmentService recruitmentService;

    @GetMapping("/recruitment/view")
    public ResponseEntity<ToastUiResponseDto> view() {
        ToastUiResponseDto recruitmentList = recruitmentService.findAll();
        log.debug("resultList :: " + recruitmentList);
        return ResponseEntity.ok(recruitmentList);
    }
}