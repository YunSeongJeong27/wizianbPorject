package com.wizian.admission.wizianb.controller;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
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

    //모집기수정보 리스트 불러오기
    @GetMapping("/recruitment/list")
    public ResponseEntity<ToastUiResponseDto> allRecruitmentList() {
        ToastUiResponseDto recruitmentList = recruitmentService.findAll();
        return ResponseEntity.ok(recruitmentList);
    }
    //모집기수정보 검색한 리스트 불러오기
    @GetMapping("/recruitment/list/{rcrtNo}/{courseDiv}")
    public ResponseEntity<ToastUiResponseDto> searchRecruitmentList(@PathVariable String rcrtNo, @PathVariable String courseDiv) {
        ToastUiResponseDto recruitmentList = recruitmentService.findAll();
        return ResponseEntity.ok(recruitmentList);
    }
    //모집기수정보 저장
    @PutMapping("/recruitment/save")
    public ResponseEntity<?> saveRecruitment(@RequestBody JsonNode recruitment) {
        List<ToastUiResponseDto> response = new ArrayList<>();

        //신규 입력
        if(recruitment.get("createdRows") != null){
            JsonNode insertRows = recruitment.get("createdRows");
            ToastUiResponseDto insert = recruitmentService.insertRecruitment(insertRows);
            response.add(insert);
        }
        // 기존정보 업데이트
        if (recruitment.get("updatedRows") != null){
            JsonNode updateRows = recruitment.get("updatedRows");
            ToastUiResponseDto update = recruitmentService.updateRecruitment(updateRows);
            response.add(update);
        }
        return ResponseEntity.ok(response);
    }

    //모집기수정보 삭제
    @DeleteMapping("/recruitment/delete")
    public ResponseEntity<ToastUiResponseDto> deleteRecruitment(){
        return null;
    }
}