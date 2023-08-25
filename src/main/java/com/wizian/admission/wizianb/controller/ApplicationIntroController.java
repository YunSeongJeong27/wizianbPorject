package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import com.wizian.admission.wizianb.service.ApplicationIntroService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationIntroController {

    private final ApplicationIntroService applicationIntroService;

    @GetMapping("/userIntroduce/{rcrtNo}/{aplyNo}")
    public String introduce(@PathVariable("rcrtNo")String rcrtNo,@PathVariable("aplyNo")String aplyNo, Model model){

        List<ApplicationIntroduce> appIntro = applicationIntroService.findAnswerInfo(aplyNo);
        List<ApplicationIntroduce> introduceList = applicationIntroService.findItem(rcrtNo);

        if(appIntro.get(0).getAnswer()!=null){

            List<ApplicationIntroduce> answer = applicationIntroService.findAnswerInfo(aplyNo);
            model.addAttribute("introduceList",answer);
            model.addAttribute("aplyNo",aplyNo);
            return "/application/applicationIntroduce";

        }else{
            model.addAttribute("introduceList",introduceList);
            model.addAttribute("aplyNo",aplyNo);
            return "/application/applicationIntroduce";
        }
    }

    @PostMapping("/saveIntro")
    public String saveAnswer(Model model,
                             @RequestParam("aplyNo")String[] aplyNos,
                             @RequestParam("rcrtNo")String[] rcrtNos,
                             @RequestParam("itemNo")int[] itemNos,
                             @RequestParam("answer")String[] answers) {

        List<ApplicationIntroduce> answerListAll = new ArrayList<>();

        for (int i=0;i<aplyNos.length;i++) {
            ApplicationIntroduce answerList = new ApplicationIntroduce();
            answerList.setAplyNo(aplyNos[i]);
            answerList.setRcrtNo(rcrtNos[i]);
            answerList.setItemNo(itemNos[i]);
            answerList.setAnswer(answers[i]);
            applicationIntroService.saveAnswer(answerList);
            answerListAll.add(applicationIntroService.saveAnswer(answerList));
        }

        model.addAttribute("introduceList",answerListAll);
        return "/application/applicationIntroduce";
    }
}
