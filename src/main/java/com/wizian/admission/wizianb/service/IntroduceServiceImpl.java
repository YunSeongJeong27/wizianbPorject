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

    @Override
    public List<Introduce> findItem(String rcrtNo) {
        return introduceRepository.findItem(rcrtNo);
    }

    @Override
    public Introduce saveAnswer(Introduce appIntro) {

        Introduce aplyintro = new Introduce();
        aplyintro.setAplyNo(appIntro.getAplyNo());
        aplyintro.setRcrtNo(appIntro.getRcrtNo());
        aplyintro.setItemNo(appIntro.getItemNo());
        aplyintro.setAnswer(appIntro.getAnswer());

        introduceRepository.saveAnswer(aplyintro.getItemNo(), aplyintro.getAplyNo(), aplyintro.getRcrtNo(), aplyintro.getAnswer());

        return aplyintro;
    }

    @Override
    public List<Introduce> findAnswerInfo(String aplyNo) {
        return introduceRepository.findAnswerInfo(aplyNo);
    }


    @Override
    public Introduce updateAnswer(Introduce appIntro) {

        Introduce aplyIntro = new Introduce();
        aplyIntro.setAnswer(appIntro.getAnswer());
        aplyIntro.setAplyNo(appIntro.getAplyNo());
        aplyIntro.setRcrtNo(appIntro.getRcrtNo());
        aplyIntro.setItemNo(appIntro.getItemNo());

        introduceRepository.updateAnswer(appIntro.getAnswer(),appIntro.getAplyNo(),appIntro.getRcrtNo(),appIntro.getItemNo());
        return aplyIntro;
    }

    @Override
    public Boolean existsByAplyNo(String aplyNo, String rcrtNo) {
        return introduceRepository.existsByAplyNo(aplyNo,rcrtNo);
    }

}
