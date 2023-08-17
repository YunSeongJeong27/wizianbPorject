package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.repository.ApplicationInfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
