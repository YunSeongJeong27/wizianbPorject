package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.service.ApplicationInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class ApplicationMypage {

    private final ApplicationInfoService applicationInfoService;

    @GetMapping("/checked")
    public String checked(HttpSession session, Model model){
        Object rcrtNo = session.getAttribute("rcrtNo");
        model.addAttribute("courseName", applicationInfoService.courseName(rcrtNo));

        //세션에서 member의 memId 찾기
        //entry_apply_master에서 rcrtNo 찾기
        //entry_sel_master에서 courseName 긁어오기
        //entry_apply_master
        Object applyMaster = session.getAttribute("login");
        System.out.println(applyMaster);



        model.addAttribute("title","마이페이지");
        return "/application/applicationChecked";
    }

}
