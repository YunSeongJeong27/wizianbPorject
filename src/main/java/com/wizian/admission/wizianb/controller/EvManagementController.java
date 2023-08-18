package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.EvManagementService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
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

    @PostMapping("/eval/result/update")
    public ResponseEntity<String> updateScore(@RequestBody List<EvalResults> changes){

        for (EvalResults changedColumn : changes) {
            EvalResults evalResultDto=new EvalResults();
            String aplyNo = changedColumn.getAplyNo();
            String rcrtNo = changedColumn.getRcrtNo();
            int ev1Score = changedColumn.getEv1Score();
            int ev2Score = changedColumn.getEv2Score();
            int ev3Score = changedColumn.getEv3Score();
            evalResultDto.setAplyNo(aplyNo);
            evalResultDto.setRcrtNo(rcrtNo);
            evalResultDto.setEv1Score(ev1Score);
            evalResultDto.setEv2Score(ev2Score);
            evalResultDto.setEv3Score(ev3Score);
            System.out.println("ㄱ고고고고"+evalResultDto.getAplyNo());
            evManagementService.updateScore(evalResultDto);
        }

        return ResponseEntity.ok("Value updated successfully");
    }



}
