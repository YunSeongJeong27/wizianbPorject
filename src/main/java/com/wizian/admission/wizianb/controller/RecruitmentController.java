package com.wizian.admission.wizianb.controller;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.service.RecruitmentService;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


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

    @PutMapping("/recruitment/save")
    public ResponseEntity<?> saveRecruitment(@RequestBody JsonNode recruitment) {
        List<ToastUiResponseDto> response = new ArrayList<>();
        if(recruitment.get("createdRows") != null){
            JsonNode insertRows = recruitment.get("createdRows");
            ToastUiResponseDto insert = recruitmentService.insertRecruitment(insertRows);
            response.add(insert);
        }
        if (recruitment.get("updatedRows") != null){
            JsonNode updateRows = recruitment.get("updatedRows");
            ToastUiResponseDto update = recruitmentService.updateRecruitment(updateRows);
            response.add(update);
        }
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/recruitment/delete")
    public ResponseEntity<ToastUiResponseDto> deleteRecruitment(){
        return null;
    }
}