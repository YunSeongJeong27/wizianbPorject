package com.wizian.admission.wizianb.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.PassManagement;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.PassManagementService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PassMnagementController {

    private final PassManagementService passManagementService;

    // 조회
    @GetMapping("/pass/courseSelect")
    @ResponseBody
    public List<PassManagement> courseSelect(@RequestParam("termDiv") String termDiv, @RequestParam("courseDiv") String courseDiv){
        return passManagementService.courseSelect(termDiv, courseDiv);
    }

    @GetMapping("/pass/nthList")
    public ResponseEntity<ToastUiResponseDto> findNthList(@RequestParam("termDiv") String termDiv, @RequestParam("courseDiv") String courseDiv, @RequestParam("rcrtNo") String rcrtNo){
        ToastUiResponseDto passList = passManagementService.findNthList(termDiv, courseDiv, rcrtNo);
        return ResponseEntity.ok(passList);
    }

    // 최종 합격 리스트
    @GetMapping("/pass/passList")
    public ResponseEntity<ToastUiResponseDto> findPassList(@RequestParam("rcrtNo") String rcrtNo){
        ToastUiResponseDto passList = passManagementService.findPassList(rcrtNo);
        return ResponseEntity.ok(passList);
    }

    // 서류 합격 사정 리스트 출력
    @GetMapping("/pass/listDocPass")
    public ResponseEntity<ToastUiResponseDto> findDocPass(@RequestParam("rcrtNo") String rcrtNo){
        ToastUiResponseDto passList = passManagementService.findDocPass(rcrtNo);
        return ResponseEntity.ok(passList);
    }
    // 면접 합격 사정 리스트 출력
    @GetMapping("/pass/listFnlPass")
    public ResponseEntity<ToastUiResponseDto> findFnlPass(@RequestParam("rcrtNo") String rcrtNo){
        ToastUiResponseDto passList = passManagementService.findFnlPass(rcrtNo);
        return ResponseEntity.ok(passList);
    }

    // 서류 선발 결과 저장
    @PutMapping("/pass/updateDocPass")
    public ResponseEntity<ToastUiResponseDto> updateDocPass(@RequestBody JsonNode passUpdateList) {
        return ResponseEntity.ok(passManagementService.updateDocPass(passUpdateList));
    }
    // 면접 선발 결과 저장
    @PutMapping("/pass/updateFnlPass")
    public ResponseEntity<ToastUiResponseDto> updateFnlPass(@RequestBody JsonNode passUpdateList) {
        return ResponseEntity.ok(passManagementService.updateFnlPass(passUpdateList));
    }


    @PostMapping("/pass/sendMail")
    public ResponseEntity.BodyBuilder sendMail(@RequestBody JsonNode data){
        passManagementService.sendPassMail(data);
        return ResponseEntity.ok();
    }
}
