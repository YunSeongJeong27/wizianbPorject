package com.wizian.admission.wizianb.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.EvManagementService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@RequiredArgsConstructor
public class EvManagementController {

    private final EvManagementService evManagementService;

    //조회리스트들정보
    @GetMapping("/eval/result/searchlist")
    public ResponseEntity<Map<String, List<EvalResults>>>  searchList(){
        return ResponseEntity.ok(evManagementService.searchList());
    }

    //평가결과등록 필요한 모든정보 다가져오기
    @GetMapping("/eval/result/info/{termDiv}/{courseDiv}/{courseName}")
    public ResponseEntity<ToastUiResponseDto> evResultInfo(@PathVariable String termDiv,@PathVariable String courseDiv,
                                                           @PathVariable String courseName){
        return ResponseEntity.ok(evManagementService.evResultInfo(termDiv, courseDiv, courseName));
    }

    //서브 테이블 정보
    @GetMapping("/eval/result/subinfo/{rcrtNo}")
    public ResponseEntity<ToastUiResponseDto> evResultSubInfo(@PathVariable String rcrtNo){
        return ResponseEntity.ok(evManagementService.evSubResultInfo(rcrtNo));
    }
    //점수저장
    @PutMapping("/eval/result/updatescore")
    public ResponseEntity<ToastUiResponseDto> updateScore(@RequestBody JsonNode jn){
        return ResponseEntity.ok(evManagementService.updateScore(jn));
    }

    //완료버튼
    @PutMapping("/eval/result/statuscomplete/{rcrtNo}")
    public ResponseEntity<String> statusComplete(@PathVariable String rcrtNo){
        evManagementService.statusComplete(rcrtNo);
        return ResponseEntity.ok("statuscomplete!!");
    }

    //완료취소버튼
    @PutMapping("/eval/result/statusprepared/{rcrtNo}")
    public ResponseEntity<String> statusPrepared(@PathVariable String rcrtNo){
        evManagementService.statusPrepared(rcrtNo);
        return ResponseEntity.ok("statusprepared!!");
    }


}
