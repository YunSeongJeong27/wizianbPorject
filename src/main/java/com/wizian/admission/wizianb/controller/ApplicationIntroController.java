package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import com.wizian.admission.wizianb.service.ApplicationIntroService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationIntroController {

    ApplicationIntroService applicationIntroService;

    @GetMapping("/userIntroduce/{rcrtNo}")
    public String introduce(@PathVariable("rcrtNo")String rcrtNo, Model model){

        List<ApplicationIntroduce> introduceList = applicationIntroService.findItem(rcrtNo);
        model.addAttribute("introduceList",introduceList);

        return "/application/applicationIntroduce";
    }
}
