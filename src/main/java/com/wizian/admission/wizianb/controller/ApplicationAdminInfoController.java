package com.wizian.admission.wizianb.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.ApplicationAdminInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class ApplicationAdminInfoController {

    private final ApplicationAdminInfoService applicationAdminInfoService;
    @GetMapping("/admin/apply/{rcrtNo}/peopleList")
    public ResponseEntity<ToastUiResponseDto> peopleList(@PathVariable String rcrtNo){
        return ResponseEntity.ok(applicationAdminInfoService.peopleList(rcrtNo));
    }

    @GetMapping("/admin/apply/{aplyNo}/peopleDetails")
    public ResponseEntity<ToastUiResponseDto> peopleDetails(@PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.peopleDetails(aplyNo));
    }

    @GetMapping("/admin/apply/{aplyNo}/education")
    public ResponseEntity<ToastUiResponseDto> getEducation(@PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.getEducation(aplyNo));
    }

    @PutMapping("/admin/apply/{aplyNo}/education")
    public ResponseEntity<ToastUiResponseDto> updateEducation(@PathVariable String aplyNo, @RequestBody JsonNode inputRows){
        return ResponseEntity.ok(applicationAdminInfoService.updateEducation(aplyNo, inputRows));
    }

    @GetMapping("/admin/apply/{aplyNo}/careers")
    public ResponseEntity<ToastUiResponseDto> getCareers(@PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.getCareers(aplyNo));
    }

    @PutMapping("/admin/apply/{aplyNo}/careers")
    public ResponseEntity<ToastUiResponseDto> updateCareers(@PathVariable String aplyNo, @RequestBody JsonNode inputRows){
        return ResponseEntity.ok(applicationAdminInfoService.updateCareers(aplyNo, inputRows));
    }
}
