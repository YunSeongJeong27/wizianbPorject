package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.EvManagementRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class EvManagementServiceImpl implements EvManagementService {

    private final EvManagementRepository evManagementRepository;
    // 평가결과등록 테이블 전체정보
    @Override
    public ToastUiResponseDto evResultInfo(){
        List<EvalResults> evResultList=evManagementRepository.evResultInfo();
        HashMap<String, Object> resultMap= new HashMap<>();
        resultMap.put("contents",evResultList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto evSubResultInfo(String rcrtNo){
        List<EvalResults> evSubResultList=evManagementRepository.evSubResultInfo(rcrtNo);
        HashMap<String, Object> resultMap= new HashMap<>();
        resultMap.put("contents",evSubResultList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
    //점수 업데이트
    @Override
    public ToastUiResponseDto updateScore(JsonNode jn){

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        JsonNode jnArr=  jn.get("updatedRows");
        for (int i=0; i<jnArr.size(); i++ ) {

            String aplyNo =  jnArr.get(i).get("aplyNo").asText();
            String rcrtNo = jnArr.get(i).get("rcrtNo").asText();
            int ev1Score = Integer.parseInt(jnArr.get(i).get("ev1Score").asText());
            int ev2Score = Integer.parseInt(jnArr.get(i).get("ev2Score").asText());
            int ev3Score = Integer.parseInt(jnArr.get(i).get("ev3Score").asText());
            EvalResults evalResultDto= EvalResults.builder()
                    .aplyNo(aplyNo)
                    .rcrtNo(rcrtNo)
                    .ev1Score(ev1Score)
                    .ev2Score(ev2Score)
                    .ev3Score(ev3Score)
                    .build();
            evManagementRepository.updateScore(evalResultDto);
        }
        return ToastUiResponseDto.builder().data(resultMap).build();
    }
}
