package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.ApplicationWrite;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class ApplicationWriteController {

    private final ApplicationWriteService applicationWriteService;
    private final PasswordEncoder passwordEncoder;
    private final ApplicationInfoService applicationInfoService;
    private final MailSendService mailSendService;

    //모집 전형
    @GetMapping("/app")
    public String entryWrite(Model model) {
        model.addAttribute("title", "모집전형선택");
        model.addAttribute("entrySelMaster", applicationWriteService.entrySelMaster());
        model.addAttribute("entrySelSchdl", applicationWriteService.entrySelSchdl());
        return "/application/applicationWrite";
    }

    //전형 정보
    @PostMapping("/selectInfo")
    public String SelectInfo(HttpServletRequest request, HttpSession session, Model model) {
        model.addAttribute("title", "전형 정보");
        String entryRcrtNo = request.getParameter("entryRcrtNo");
        session.setAttribute("rcrtNo", entryRcrtNo);
        model.addAttribute("rcrtNo", entryRcrtNo);
        model.addAttribute("courseName", applicationWriteService.selectInfoHead(entryRcrtNo));

        //msg_div(전형안내문 등록 테이블 >> 안내문 종류 코드) 변경 시 수정
        //모집전형 안내문
        String msgDiv = "10";
        model.addAttribute("content", applicationWriteService.selectInfoContent(entryRcrtNo, msgDiv));

        String courseDiv = request.getParameter("courseDiv");
        model.addAttribute("courseDiv", courseDiv);
        return "/application/applicationSelectInfo";
    }

    //로그인
    @GetMapping("/login")
    public String getLogin(HttpServletRequest request) {
        return "/application/applicationLogin";
    }

    @PostMapping("/login")
    public String postLogin(HttpServletRequest request, Model model, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (email.isEmpty()) {
            model.addAttribute("text", "아이디를 입력해주세요.");
            return "/application/applicationLogin";
        } else if (password.isEmpty()) {
            model.addAttribute("text", "비밀번호를 입력해주세요.");
            return "/application/applicationLogin";
        }

        String emailCheck = applicationWriteService.emailCheck(email);
        String passwordCheck = applicationWriteService.passwordCheck(email, password);


        if (emailCheck == null || passwordCheck == null) {
            model.addAttribute("text", "아이디 또는 비밀번호가 틀렸습니다.");
            return "/application/applicationLogin";
        } else if (passwordEncoder.matches(password, passwordCheck)) {


            //객체 찾아서 반환
            ApplicationInfo appInfo = applicationInfoService.appInfo(email);
            ApplicationInfo member = applicationInfoService.findMember(appInfo.getMemId());

            //객체저장
            session.setAttribute("loginId",appInfo);
            session.setAttribute("login",member);
            model.addAttribute("appInfo", appInfo);
            model.addAttribute("member", member);

            return "/application/applicationWrite";
        } else {
            model.addAttribute("text", "아이디 또는 비밀번호가 틀렸습니다.");
            return "/application/applicationLogin";
        }
    }

    @PostMapping("/login/findId")
    @ResponseBody
    public ApplicationWrite findId(@RequestBody ApplicationWrite applicationWrite){
        String name = applicationWrite.getUserName();
        String birth = applicationWrite.getBirthday();

        String check = applicationWriteService.findId(name, birth);

        if(check != null){
            applicationWrite.setText("회원님의 아이디는 ["+check+"]입니다.");
        }else{
            applicationWrite.setText("존재하지 않는 회원입니다.");
        }

        // Ajax 호출 결과를 리턴
        return applicationWrite;
    }

    /*메일인증*/
    @PostMapping(value = "/api/findPwMailcheck",consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> mailCheck(@RequestBody HashMap<String,Object> member){

        String username = (String) member.get("username");
        String authNum = mailSendService.joinEmail(username);

        return ResponseEntity.status(HttpStatus.OK).body(authNum);
    }

    /* 현재비밀번호 체크*/
    @PostMapping("/login/findPwNumCheck")
    @ResponseBody
    public ApplicationWrite pwNumCheck(@RequestBody ApplicationWrite applicationWrite){
        String email = applicationWrite.getEmail();
        String findPw = applicationWriteService.findPw(email);

        if(findPw != null){
            applicationWrite.setText("비밀번호는 ["+findPw+"]입니다.");
        }else{
            applicationWrite.setText("존재하지 않는 회원입니다.");
        }
        return applicationWrite;
    }
}
