package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import com.wizian.admission.wizianb.service.ApplicationWriteService;
import com.wizian.admission.wizianb.service.MailSendService;
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
    private final ApplicationWriteService applicationWriteService;

    //기본정보
    @GetMapping("/userInfo")
    public String userInfo(HttpServletRequest request, Model model,HttpSession session){
        model.addAttribute("title","기본정보");
       // Object rcrtNo = session.getAttribute("rcrtNo");
       // model.addAttribute("courseName", applicationInfoService.courseName(rcrtNo));

        //일단,테스트용 rcrtNo 임의로 값 보내기
        model.addAttribute("rcrtNo","10-001");
//        model.addAttribute("courseDiv",courseDiv);

        if(session.getAttribute("login")!=null){
            ApplicationInfo appInfo = (ApplicationInfo) session.getAttribute("loginId");
            //비밀번호 받아와야해서.
            ApplicationInfo member = applicationInfoService.findMember(appInfo.getMemId());

            model.addAttribute("appInfo",appInfo);
            model.addAttribute("member",member);
            return "/application/applicationInfoAfterLogin";
        }else{

            return "/application/applicationInfo";
        }
    }


    /*지원서작성,회원가입*/
    @PostMapping("/application/join")
    public String setAplyInfo(@ModelAttribute ApplicationInfo applicationInfo, @RequestParam("pictureUrl") MultipartFile file,Model model) throws IOException {

        applicationInfoService.join(applicationInfo,file);

        return "/application/applicationInfoAfterLogin";
    }


    /*메일인증*/
    @PostMapping(value = "/api/mailcheck",consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> mailCheck(@RequestBody HashMap<String,Object> member){

        String username = (String) member.get("username");
        String authNum = mailSendService.joinEmail(username);

        return ResponseEntity.status(HttpStatus.OK).body(authNum);
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
