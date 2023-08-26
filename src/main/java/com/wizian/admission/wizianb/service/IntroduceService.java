package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Introduce;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IntroduceService {

    ToastUiResponseDto getIntroduceItems(String rcrtNo);
    ToastUiResponseDto insertIntroduceItems(JsonNode introduceItems, String rcrtNo);
    ToastUiResponseDto updateIntroduceItems(JsonNode introduceItems, String rcrtNo);


    List<Introduce> findItem(String rcrtNo);
    Introduce saveAnswer(Introduce appIntro);
    List<Introduce> findAnswerInfo(String aplyNo);
    Introduce updateAnswer(Introduce applicationIntroduce);
    Boolean existsByAplyNo(String aplyNo,String rcrtNo);
}
