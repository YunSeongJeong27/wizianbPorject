package com.wizian.admission.wizianb.controller;


import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.service.RecruitmentInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class RecruitmentInfoController {

    private final RecruitmentInfoService recruitmentInfoService;

    //선택된 전형일정 정보들
    @GetMapping("/recruitmentinfo/schdlnamelist/{rcrtNo}")
    public ResponseEntity<List<TopScreeningInfo>>  selectedSchdlnameList(@PathVariable String rcrtNo){
        return  ResponseEntity.ok(recruitmentInfoService.selectedSchdlnameList(rcrtNo));
    }

    //변경버튼:insert
    @PutMapping("/recruitmentinfo/insertschdl")
    public  ResponseEntity<String> insertSchdl(@RequestParam String rcrtNo,String schdlName,String statusDiv){
        recruitmentInfoService.insertschdl(rcrtNo,schdlName,statusDiv);
        return ResponseEntity.ok("insertschdl!");
    }


    //변경버튼:전형일정,상태 update
    @PutMapping("/recruitmentinfo/updateschdl")
    public  ResponseEntity<String> updateSchdl(@RequestParam String schdlSeq,String schdlName,String statusDiv){
        recruitmentInfoService.updateSchdl(schdlSeq,schdlName,statusDiv);
        return ResponseEntity.ok("updateschdl!");
    }


}
