package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import com.wizian.admission.wizianb.service.MailSendService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.print.attribute.standard.Media;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationInfoController {

    private final ApplicationInfoService applicationInfoService;
    private final MailSendService mailSendService;

    /*접수바로가기>기존회원작성> 기존입력정보가 있으면 받아오기*/
    @GetMapping("/application/info")
    public List<ApplicationInfo> getAplyInfo(@RequestParam("memId") String memId,@RequestParam("rcrtNo") String rcrtNo){
        return applicationInfoService.findByMemIdAndRcrtNo(memId, rcrtNo);

    }
    @PostMapping("/application/join")
    public ApplicationInfo setAplyInfo(@ModelAttribute ApplicationInfo applicationInfo){
        return applicationInfoService.join(applicationInfo);
    }


    /*메일인증테스트*/
    @PostMapping(value = "/api/mailcheck",consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> mailCheck(@RequestBody HashMap<String,Object> member){

        String username = (String) member.get("username");
        String authNum = mailSendService.joinEmail(username);

        return ResponseEntity.status(HttpStatus.OK).body(authNum);
    }

    // 서류전형 결과 출력
    @GetMapping("/recruitment/application_list")
    public ResponseEntity<ToastUiResponseDto> applicationPassList(@RequestParam("rcrtNo") String rcrtNo){
        ToastUiResponseDto applicationInfoList = applicationInfoService.findByRcrtNo(rcrtNo);
        return ResponseEntity.ok(applicationInfoList);
    }

}
