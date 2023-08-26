package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

@Service
public interface IntroduceService {

    ToastUiResponseDto getIntroduceItems(String rcrtNo);

    ToastUiResponseDto insertIntroduceItems(JsonNode introduceItems, String rcrtNo);
    ToastUiResponseDto updateIntroduceItems(JsonNode introduceItems, String rcrtNo);
}
