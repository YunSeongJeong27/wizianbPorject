package com.wizian.admission.wizianb.controller;


import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.IntroduceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Slf4j
@Controller
@RequiredArgsConstructor
public class IntroduceController {
    private final IntroduceService introduceService;
    @GetMapping("/admin/{rcrtNo}/introduce")
    public ResponseEntity<ToastUiResponseDto> getIntroduceItem(@PathVariable String rcrtNo){
        ToastUiResponseDto introduceItemsList = introduceService.getIntroduceItems(rcrtNo);
        return ResponseEntity.ok(introduceItemsList);
    }
}
