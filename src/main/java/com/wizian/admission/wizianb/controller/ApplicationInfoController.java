package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import com.wizian.admission.wizianb.service.ApplicationWriteService;
import com.wizian.admission.wizianb.service.MailSendService;
import com.wizian.admission.wizianb.service.RecruitmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationInfoController {

    private final ApplicationInfoService applicationInfoService;
    private final MailSendService mailSendService;
    private final PasswordEncoder passwordEncoder;
    private final RecruitmentService recruitmentService;

    //기본정보
    @GetMapping("/userInfo/{rcrtNo}")
    public String userInfo(@PathVariable("rcrtNo")String rcrtNo, Model model,HttpSession session){

        model.addAttribute("title","기본정보");
       // Object rcrtNo = session.getAttribute("rcrtNo");
       // model.addAttribute("courseName", applicationInfoService.courseName(rcrtNo));

        model.addAttribute("rcrtNo",rcrtNo);

        if(session.getAttribute("login")!=null){

            ApplicationInfo member = (ApplicationInfo) session.getAttribute("login");
            ApplicationInfo appInfo = applicationInfoService.findAppInfo(member.getLoginId(), rcrtNo);
            Recruitment rcrtInfo = recruitmentService.findRcrtInfo(rcrtNo);

            model.addAttribute("appInfo",appInfo);
            model.addAttribute("member",member);
            model.addAttribute("rcrtInfo",rcrtInfo);
            return "/application/applicationInfoAfterLogin";
        }else{
            Recruitment rcrtInfo = recruitmentService.findRcrtInfo(rcrtNo);
            model.addAttribute("rcrtInfo",rcrtInfo);
            return "/application/applicationInfo";
        }
    }


    /*지원서작성,회원가입*/
    @PostMapping("/application/join")
    public ResponseEntity<String> setAplyInfo(@ModelAttribute ApplicationInfo applicationInfo,
                                              @RequestParam("pictureUrl") MultipartFile file) {
        try {
            applicationInfoService.join(applicationInfo, file);
            return ResponseEntity.ok("success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred: " + e.getMessage());
        }
    }



    /*메일인증*/
    @PostMapping(value = "/api/mailcheck",consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> mailCheck(@RequestBody HashMap<String,Object> member){

        String username = (String) member.get("username");
        if(applicationInfoService.existByEmail(username)){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("");
        }else{
            String authNum = mailSendService.joinEmail(username);

            return ResponseEntity.status(HttpStatus.OK).body(authNum);
        }
    }


    /* 현재비밀번호 체크*/
    @PostMapping(value = "/pwCheck")
    @ResponseBody
    public int pwCheck(@RequestParam("password")String password,@RequestParam("inputPassword")String inputPassword){

        if(passwordEncoder.matches(inputPassword,password)){
            return 1;
        }else {
            return 0;
        }
    }

    /*비밀번호 변경*/
    @PostMapping("/updatePassword")
    public String setPassword(@RequestParam("loginId")String loginId,@RequestParam("newPw")String newPw){
        applicationInfoService.savePassword(loginId, newPw);
        return "/application/applicationInfoAfterLogin";
    }
}
