package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.annotation.CurrentUser;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.Careers;
import com.wizian.admission.wizianb.domain.Education;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
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

import javax.servlet.http.HttpSession;
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
    public String userInfo(@PathVariable("rcrtNo")String rcrtNo, Model model){

        model.addAttribute("title","기본정보");
       // Object rcrtNo = session.getAttribute("rcrtNo");
       // model.addAttribute("courseName", applicationInfoService.courseName(rcrtNo));

        model.addAttribute("rcrtNo",rcrtNo);

            Recruitment rcrtInfo = recruitmentService.findRcrtInfo(rcrtNo);
            model.addAttribute("rcrtInfo",rcrtInfo);
            return "/application/applicationInfo";

    }
    @GetMapping("/signin/userInfo/{rcrtNo}")
    public String userInfoSignIn(@PathVariable String rcrtNo, Model model){
        //안되서 일단 임시방편
        return "/application/applicationLogin";

    }

    /*지원서작성,회원가입*/
    @PostMapping("/application/join")
    public ResponseEntity<String> setAplyInfo(@ModelAttribute ApplicationInfo applicationInfo,
                                              @RequestParam("pictureUrl") MultipartFile file,HttpSession session,Model model) {
        try {
            applicationInfoService.join(applicationInfo, file);

            String memberMemId = applicationInfoService.memberMemId(applicationInfo.getEmail());
            ApplicationInfo member = applicationInfoService.findByLoginId(applicationInfoService.emailCheck(applicationInfo.getEmail()));

            //최근접속시간등록
            applicationInfoService.saveLastLogin(applicationInfo.getEmail());

            //객체저장
            session.setAttribute("memberId", memberMemId);
            session.setAttribute("login", member);
            model.addAttribute("member", member);

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

    /*학력사항*/
    @GetMapping("/userEdu/{rcrtNo}/{aplyNo}")
    public String userEdu(@PathVariable("rcrtNo")String rcrtNo,@PathVariable("aplyNo")String aplyNo, Model model){

        List<Education> eduList = applicationInfoService.educationList(aplyNo, rcrtNo);
        Recruitment rcrtInfo = recruitmentService.findRcrtInfo(rcrtNo);
        if(eduList.isEmpty()) eduList.add(new Education());

        model.addAttribute("rcrtNo",rcrtNo);
        model.addAttribute("aplyNo",aplyNo);
        model.addAttribute("eduList", eduList);
        model.addAttribute("courseName",rcrtInfo.getCourseName());
        model.addAttribute("title","학력사항");
        return "/application/applicationEdu";
    }

    /*학력사항 저장*/
    @PostMapping("/userEdu/{rcrtNo}/{aplyNo}")
    public String saveEducation(Education edu){
        applicationInfoService.saveEducation(edu);
        return "redirect:/userExp/"+edu.getRcrtNo()+"/"+edu.getAplyNo();
    }


    /*경력사항*/
    @GetMapping("/userExp/{rcrtNo}/{aplyNo}")
    public String userExp(@PathVariable("rcrtNo")String rcrtNo,@PathVariable("aplyNo")String aplyNo,  Model model){

        List<Careers> expList = applicationInfoService.careerList(aplyNo, rcrtNo);
        Recruitment rcrtInfo = recruitmentService.findRcrtInfo(rcrtNo);
        if(expList.isEmpty()) expList.add(new Careers());

        model.addAttribute("rcrtNo",rcrtNo);
        model.addAttribute("aplyNo",aplyNo);
        model.addAttribute("expList", expList);
        model.addAttribute("courseName",rcrtInfo.getCourseName());
        model.addAttribute("title","학력사항");
        return "/application/applicationExp";
    }

    /*경력사항 저장*/
    @PostMapping("/userExp/{rcrtNo}/{aplyNo}")
    public String saveCareer(Careers career){
        applicationInfoService.saveCareer(career);
        return "redirect:/userIntroduce/"+career.getRcrtNo()+"/"+career.getAplyNo();
    }
}
