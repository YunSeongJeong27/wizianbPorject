package com.wizian.admission.wizianb.service;

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





}
