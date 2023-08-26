package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Introduce;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.IntroduceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class IntroduceServiceImpl implements IntroduceService {

    private final IntroduceRepository introduceRepository;

    @Override
    public ToastUiResponseDto getIntroduceItems(String rcrtNo) {
        List<Introduce> introduceItemsList = introduceRepository.findAll(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", introduceItemsList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto insertIntroduceItems(JsonNode introduceItems, String rcrtNo) {
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = 0;
        for (JsonNode row : introduceItems) {
            Introduce introduceItem = Introduce.builder()
                    .itemName(row.get("itemName").asText())
                    .maxChar(row.get("maxChar").asInt())
                    .itemExpl(row.get("itemExpl").asText())
                    .build();
            result = introduceRepository.insertIntroduceItem(introduceItem, rcrtNo);
        }
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateIntroduceItems(JsonNode introduceItems, String rcrtNo) {
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = 0;
        for (JsonNode row : introduceItems) {
            Introduce introduceItem = Introduce.builder()
                    .itemNo(row.get("itemNo").asInt())
                    .itemName(row.get("itemName").asText())
                    .maxChar(row.get("maxChar").asInt())
                    .itemExpl(row.get("itemExpl").asText())
                    .build();
            result = introduceRepository.updateIntroduceItem(introduceItem, rcrtNo);
        }
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
}
