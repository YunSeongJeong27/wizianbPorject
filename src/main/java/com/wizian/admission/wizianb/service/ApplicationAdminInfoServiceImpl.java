package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.ApplicationAdminInfoRepository;
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
public class ApplicationAdminInfoServiceImpl implements ApplicationAdminInfoService{

    private final ApplicationAdminInfoRepository applicationAdminInfoRepository;

    @Override
    public ToastUiResponseDto peopleList(String rcrtNo) {

        List<ApplicationInfo> coursePeopleList = applicationAdminInfoRepository.coursePeopleList(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", coursePeopleList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
}
