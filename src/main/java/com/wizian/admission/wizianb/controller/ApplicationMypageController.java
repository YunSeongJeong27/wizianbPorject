package com.wizian.admission.wizianb.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationMypageController {

    private final ApplicationInfoService applicationInfoService;

    @GetMapping("/checked")
    public String check(HttpSession session, Model model){
        model.addAttribute("title","마이페이지");
        session.getAttribute("loginMemberAll");
        return null;
    }
}