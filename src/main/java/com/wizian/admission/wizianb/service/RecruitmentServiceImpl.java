package com.wizian.admission.wizianb.service;


import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.repository.RecruitmentRepository;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
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
public class RecruitmentServiceImpl implements RecruitmentService {

    private final RecruitmentRepository recruitmentRepository;

    @Override
    public ToastUiResponseDto findAll() {
        List<Recruitment> recruitmentList = recruitmentRepository.findAll();

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", recruitmentList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
}
