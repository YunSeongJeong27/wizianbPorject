package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.ApplicationInfoRepository;
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
public class ApplicationInfoServiceImpl implements ApplicationInfoService {

    private final ApplicationInfoRepository applicationInfoRepository;

    @Override
    public List<ApplicationInfo> findByMemIdAndRcrtNo(String memId, String rcrtNo) {
        return applicationInfoRepository.findByMemIdAndRcrtNo(memId,rcrtNo);
    }

    @Override
    public ApplicationInfo join(ApplicationInfo applicationInfo) {

        /*중복검증?*/

        return applicationInfoRepository.save(applicationInfo);
    }

    @Override
    public ToastUiResponseDto findByRcrtNo(String rcrtNo){
        List<ApplicationInfo> applicationInfoList = applicationInfoRepository.findByRcrtNo(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", applicationInfoList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
}
