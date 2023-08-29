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

    @GetMapping("/admin/apply/{rcrtNo}/{aplyNo}/peopleDetails")
    public ResponseEntity<ToastUiResponseDto> peopleDetails(@PathVariable String rcrtNo,@PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.peopleDetails(rcrtNo, aplyNo));
    }

    @GetMapping("/admin/apply/{rcrtNo}/{aplyNo}/education")
    public ResponseEntity<ToastUiResponseDto> getEducation(@PathVariable String rcrtNo,@PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.getEducation(rcrtNo, aplyNo));
    }

    @PutMapping("/admin/apply/{rcrtNo}/{aplyNo}/education")
    public ResponseEntity<ToastUiResponseDto> updateEducation(@PathVariable String rcrtNo,@PathVariable String aplyNo, @RequestBody JsonNode inputRows){
        return ResponseEntity.ok(applicationAdminInfoService.updateEducation(rcrtNo, aplyNo, inputRows));
    }

    @GetMapping("/admin/apply/{rcrtNo}/{aplyNo}/careers")
    public ResponseEntity<ToastUiResponseDto> getCareers(@PathVariable String rcrtNo,@PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.getCareers(rcrtNo, aplyNo));
    }

    @PutMapping("/admin/apply/{rcrtNo}/{aplyNo}/careers")
    public ResponseEntity<ToastUiResponseDto> updateCareers(@PathVariable String rcrtNo,@PathVariable String aplyNo, @RequestBody JsonNode inputRows){
        return ResponseEntity.ok(applicationAdminInfoService.updateCareers(rcrtNo,aplyNo, inputRows));
    }

    @GetMapping("/admin/apply/{rcrtNo}/{aplyNo}/introduce")
    public ResponseEntity<?> getIntroduce(@PathVariable String rcrtNo, @PathVariable String aplyNo){
        return ResponseEntity.ok(applicationAdminInfoService.getIntroduce(rcrtNo,aplyNo));
    }

    @GetMapping("/admin/apply/{rcrtNo}/{aplyNo}/submissionDoc")
    public ResponseEntity<?> getSubmissionDoc(@PathVariable String rcrtNo, @PathVariable String aplyNo){
        System.out.println("getSubmissionDoc");
        return ResponseEntity.ok(applicationAdminInfoService.getSubmissionDoc(rcrtNo,aplyNo));
    }
}
