package com.wizian.admission.wizianb.controller;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Introduce;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.IntroduceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class IntroduceController {

    private final IntroduceService introduceService;

    @GetMapping("/admin/{rcrtNo}/introduce")
    public ResponseEntity<ToastUiResponseDto> getIntroduceItems(@PathVariable String rcrtNo){
        ToastUiResponseDto introduceItemsList = introduceService.getIntroduceItems(rcrtNo);
        return ResponseEntity.ok(introduceItemsList);
    }
    @PutMapping("/admin/{rcrtNo}/introduce")
    public ResponseEntity<?> saveIntroduceItems(@RequestBody JsonNode introduce, @PathVariable String rcrtNo){
        List<ToastUiResponseDto> response = new ArrayList<>();

        //신규 입력
        if(introduce.get("createdRows") != null){
            JsonNode insertRows = introduce.get("createdRows");
            ToastUiResponseDto insert = introduceService.insertIntroduceItems(insertRows, rcrtNo);
            response.add(insert);
        }
        // 기존정보 업데이트
        if (introduce.get("updatedRows") != null){
            JsonNode updateRows = introduce.get("updatedRows");
            ToastUiResponseDto update = introduceService.updateIntroduceItems(updateRows, rcrtNo);
            response.add(update);
        }
        return ResponseEntity.ok(response);
    }


    //사용자 자기소개서
    @GetMapping("/userIntroduce/{rcrtNo}/{aplyNo}")
    public String introduce(@PathVariable("rcrtNo")String rcrtNo,@PathVariable("aplyNo")String aplyNo, Model model){

        List<Introduce> appIntro = introduceService.findAnswerInfo(aplyNo);
        List<Introduce> introduceList = introduceService.findItem(rcrtNo);

        if (!appIntro.isEmpty()) {
            Introduce firstIntro = appIntro.get(0);
            if (firstIntro.getAnswer() != null) {
                // answer 컬럼이 값이 있는 경우에 대한 처리
                List<Introduce> answer = introduceService.findAnswerInfo(aplyNo);
                model.addAttribute("introduceList",answer);
                model.addAttribute("aplyNo",aplyNo);
                model.addAttribute("rcrtNo",rcrtNo);
                return "/application/applicationIntroduce";
            }else{
                model.addAttribute("introduceList",introduceList);
                model.addAttribute("aplyNo",aplyNo);
                model.addAttribute("rcrtNo",rcrtNo);
                return "/application/applicationIntroduce";
            }
        }
        //일단, 출력될 자기소개서 문항이 없다면
        model.addAttribute("introduceList",introduceList);
        model.addAttribute("aplyNo",aplyNo);
        model.addAttribute("rcrtNo",rcrtNo);
        return "/application/applicationIntroduce";
    }

    @PostMapping("/saveIntro")
    public String saveAnswer(Model model,
                             @RequestParam("aplyNo") String[] aplyNos,
                             @RequestParam("rcrtNo") String[] rcrtNos,
                             @RequestParam("itemNo") int[] itemNos,
                             @RequestParam("answer") String[] answers){

        Boolean existByAply = introduceService.existsByAplyNo(aplyNos[0],rcrtNos[0]);
        List<Introduce> answerListAll = new ArrayList<>();
        //저장
        if(!existByAply){

            for (int i = 0; i < itemNos.length; i++) {
                Introduce answerList = new Introduce();
                answerList.setAplyNo(aplyNos[i]);
                answerList.setRcrtNo(rcrtNos[i]);
                answerList.setItemNo(itemNos[i]);
                answerList.setAnswer(answers[i]);
                introduceService.saveAnswer(answerList);
                answerListAll.add(answerList);
            }
            model.addAttribute("introduceList", answerListAll);

            return "redirect:/userIntroduce/"+rcrtNos[0]+"/"+aplyNos[0];
        }else{
            //수정
            List<Introduce> introInfo = introduceService.findAnswerInfo(aplyNos[0]);

            for(int i=0;i< introInfo.size();i++){
                Introduce answerList = new Introduce();
                answerList.setAplyNo(aplyNos[i]);
                answerList.setRcrtNo(rcrtNos[i]);
                answerList.setItemNo(itemNos[i]);
                answerList.setAnswer(answers[i]);
                introduceService.updateAnswer(answerList);
                answerListAll.add(answerList);
            }
            model.addAttribute("introduceList", answerListAll);
            return "redirect:/userIntroduce/"+rcrtNos[0]+"/"+aplyNos[0];

        }
    }

}
