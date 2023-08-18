package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationInfoController {

    private final ApplicationInfoService applicationInfoService;

    /*접수바로가기>기존회원작성> 기존입력정보가 있으면 받아오기*/
    @GetMapping("/application/info")
    public List<ApplicationInfo> getAplyInfo(@RequestParam("memId") String memId,@RequestParam("rcrtNo") String rcrtNo){
        return applicationInfoService.findByMemIdAndRcrtNo(memId, rcrtNo);

    }
    @PostMapping("/application/join")
    public ApplicationInfo setAplyInfo(@ModelAttribute ApplicationInfo applicationInfo){
        return applicationInfoService.join(applicationInfo);
    }



    // 서류전형 결과 출력
    @GetMapping("/recruitment/application_list")
    public ResponseEntity<ToastUiResponseDto> applicationPassList(@RequestParam("rcrtNo") String rcrtNo){
        ToastUiResponseDto applicationInfoList = applicationInfoService.findByRcrtNo(rcrtNo);
        return ResponseEntity.ok(applicationInfoList);
    }

}
