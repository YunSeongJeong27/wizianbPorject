package com.wizian.admission.wizianb.service;

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
public class IntroduceServiceImpl implements IntroduceService{

    private final IntroduceRepository introduceRepository;
    @Override
    public ToastUiResponseDto getIntroduceItems(String rcrtNo) {
        List<Introduce> introduceItemsList = introduceRepository.findAll(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", introduceItemsList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
}
