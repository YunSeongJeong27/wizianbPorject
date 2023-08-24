package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import com.wizian.admission.wizianb.service.ApplicationIntroService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationIntroController {

    private final ApplicationIntroService applicationIntroService;

    @GetMapping("/userIntroduce/{rcrtNo}")
    public String introduce(@PathVariable("rcrtNo")String rcrtNo, Model model){

        List<ApplicationIntroduce> introduceList = applicationIntroService.findItem(rcrtNo);
        model.addAttribute("introduceList",introduceList);

        return "/application/applicationIntroduce";
    }


    @PostMapping("/saveIntro")
    public String saveAnswer(HttpServletRequest request, Model model) {
        List<ApplicationIntroduce> appIntroList = new ArrayList<>();

        Enumeration<String> parameterNames = request.getParameterNames();
        ApplicationIntroduce appIntro = new ApplicationIntroduce();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("answer")) {
                String indexStr = paramName.substring("answer".length());
                int index = Integer.parseInt(indexStr);

                String answer = request.getParameter(paramName);
                appIntro.setAnswer(answer);

                appIntroList.add(appIntro);
            }else if(paramName.equals("rcrtNo")){
                String rcrtNo = request.getParameter(paramName);
                appIntro.setRcrtNo(rcrtNo);
            }else if(paramName.equals("aplyNo")){
                String aplyNo = request.getParameter(paramName);
                appIntro.setAplyNo(aplyNo);
            } else if (paramName.equals("itemNo")) {
                int itemNo = Integer.parseInt(request.getParameter(paramName));
                appIntro.setItemNo(itemNo);
                applicationIntroService.saveAnswer(appIntro);
            }
        }

        return "/application/applicationIntroduce";
    }
}
