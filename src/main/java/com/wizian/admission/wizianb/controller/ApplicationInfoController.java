package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import com.wizian.admission.wizianb.service.MailSendService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationInfoController {

    private final ApplicationInfoService applicationInfoService;
    private final MailSendService mailSendService;

    //기본정보
    @GetMapping("/userInfo")
    public String userInfo(HttpServletRequest request, Model model){
        model.addAttribute("title","기본정보");
        return "/application/applicationInfo";
    }

    @PostMapping("/application/join")
    public ApplicationInfo setAplyInfo(@ModelAttribute ApplicationInfo applicationInfo){
        return applicationInfoService.join(applicationInfo);
    }


    /*메일인증*/
    @PostMapping(value = "/api/mailcheck",consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> mailCheck(@RequestBody HashMap<String,Object> member){

        String username = (String) member.get("username");
        String authNum = mailSendService.joinEmail(username);

        return ResponseEntity.status(HttpStatus.OK).body(authNum);
    }


}
