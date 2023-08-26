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

        if (!appIntro.isEmpty()) {
            ApplicationIntroduce firstIntro = appIntro.get(0);
            if (firstIntro.getAnswer() != null) {
                // answer 컬럼이 값이 있는 경우에 대한 처리
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
        //일단, 출력될 자기소개서 문항이 없다면
        model.addAttribute("introduceList",introduceList);
        model.addAttribute("aplyNo",aplyNo);
        return "/application/applicationIntroduce";
    }

    @PostMapping("/saveIntro")
    public String saveAnswer(Model model,
                             @RequestParam("aplyNo") String[] aplyNos,
                             @RequestParam("rcrtNo") String[] rcrtNos,
                             @RequestParam("itemNo") int[] itemNos,
                             @RequestParam("answer") String[] answers){

        Boolean existByAply = applicationIntroService.existsByAplyNo(aplyNos[0],rcrtNos[0]);
        List<ApplicationIntroduce> answerListAll = new ArrayList<>();
        //저장
        if(!existByAply){

            for (int i = 0; i < itemNos.length; i++) {
                ApplicationIntroduce answerList = new ApplicationIntroduce();
                answerList.setAplyNo(aplyNos[i]);
                answerList.setRcrtNo(rcrtNos[i]);
                answerList.setItemNo(itemNos[i]);
                answerList.setAnswer(answers[i]);
                applicationIntroService.saveAnswer(answerList);
                answerListAll.add(answerList);
            }
            model.addAttribute("introduceList", answerListAll);

            return "redirect:/userIntroduce/"+rcrtNos[0]+"/"+aplyNos[0];
        }else{
            //수정
            List<ApplicationIntroduce> introInfo = applicationIntroService.findAnswerInfo(aplyNos[0]);

            for(int i=0;i< introInfo.size();i++){
                ApplicationIntroduce answerList = new ApplicationIntroduce();
                answerList.setAplyNo(aplyNos[i]);
                answerList.setRcrtNo(rcrtNos[i]);
                answerList.setItemNo(itemNos[i]);
                answerList.setAnswer(answers[i]);
                applicationIntroService.updateAnswer(answerList);
                answerListAll.add(answerList);
            }
            model.addAttribute("introduceList", answerListAll);
            return "redirect:/userIntroduce/"+rcrtNos[0]+"/"+aplyNos[0];

        }
    }
}
