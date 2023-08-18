package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.EvManagementService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class EvManagementController {

    private final EvManagementService evManagementService;

    //평가결과등록 필요한 모든정보 다가져오기
    @GetMapping("/eval/result/info")
    public ResponseEntity<ToastUiResponseDto> evResultInfo(){

        ToastUiResponseDto evResultList=evManagementService.evResultInfo();

        return new ResponseEntity<>(evResultList, HttpStatus.OK);
    }

    @GetMapping("/eval/result/subinfo/{rcrtNo}")
    public ResponseEntity<ToastUiResponseDto> evResultSubInfo(@PathVariable String rcrtNo){

        ToastUiResponseDto evSubResultList=evManagementService.evSubResultInfo(rcrtNo);

        return new ResponseEntity<>(evSubResultList, HttpStatus.OK);
    }




}
