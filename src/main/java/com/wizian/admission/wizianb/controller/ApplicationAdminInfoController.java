package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.ApplicationAdminInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
public class ApplicationAdminInfoController {

    private final ApplicationAdminInfoService applicationAdminInfoService;
    @GetMapping("/admin/apply/{rcrtNo}/peopleList")
    public ResponseEntity<ToastUiResponseDto> peopleList(@PathVariable String rcrtNo){
        return ResponseEntity.ok(applicationAdminInfoService.peopleList(rcrtNo));
    }
}
