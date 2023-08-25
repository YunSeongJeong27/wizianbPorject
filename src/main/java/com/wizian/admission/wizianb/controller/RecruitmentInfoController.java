package com.wizian.admission.wizianb.controller;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
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
    public  ResponseEntity<String> insertSchdl( String rcrtNo,String schdlName,String statusDiv){
        recruitmentInfoService.insertschdl(rcrtNo,schdlName,statusDiv);
        return ResponseEntity.ok("insertschdl!");
    }


    //변경버튼:전형일정,상태 update
    @PutMapping("/recruitmentinfo/updateschdl")
    public  ResponseEntity<String> updateSchdl(String schdlSeq,String schdlName,String statusDiv){
        recruitmentInfoService.updateSchdl(schdlSeq,schdlName,statusDiv);
        return ResponseEntity.ok("updateschdl!");
    }

    //신규 과정명선택시 정보들
    @GetMapping("/recruitmentinfo/newcoursenameinfo/{courseName}")
    public ResponseEntity<TopScreeningInfo> newCourseNameInfo(@PathVariable String courseName){
        return ResponseEntity.ok(recruitmentInfoService.newCourseNameInfo(courseName));
    }
    //저장 버튼
    @PutMapping("/recruitmentinfo/nthinfosave")
    public ResponseEntity<String> nthInfoSave(String rcrtNo,String schdlName,String statusDiv ){
        recruitmentInfoService.nthInfoSave( rcrtNo, schdlName, statusDiv);
        return ResponseEntity.ok("nthinfosave!!");
    }
    @DeleteMapping("/recruitmentinfo/deletenthinfo") //일단대기
    public ResponseEntity<ToastUiResponseDto> deleteNthInfo(@RequestBody JsonNode jn){
        System.out.println("1111");
        System.out.println(jn.toString());

        return ResponseEntity.ok(recruitmentInfoService.deleteNthInfo(jn));
    }

}
