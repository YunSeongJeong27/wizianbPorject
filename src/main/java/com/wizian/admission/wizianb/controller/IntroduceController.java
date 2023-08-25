package com.wizian.admission.wizianb.controller;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.IntroduceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
}
