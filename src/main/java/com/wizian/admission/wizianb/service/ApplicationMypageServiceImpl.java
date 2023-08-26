package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationMypage;
import com.wizian.admission.wizianb.repository.ApplicationMypageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
@RequiredArgsConstructor
public class ApplicationMypageServiceImpl implements ApplicationMypageService{
    private final ApplicationMypageRepository applicationMypageRepository;

    @Override
    public List<ApplicationMypage> getCourseNameList(String memberId) {
        return applicationMypageRepository.getCourseNameList(memberId);
    }

    @Override
    public List<String> getApplyNo(String memberId) {
        return applicationMypageRepository.getApplyNo(memberId);
    }

    @Override
    public List<ApplicationMypage> getApplyMkList(String applyNo) {
        return applicationMypageRepository.getApplyMkList(applyNo);
    }

    @Override
    public List<ApplicationMypage> getApplyMasterList(String rcrtNo, String applyNo) {
        return applicationMypageRepository.getApplyMasterList(rcrtNo, applyNo);
    }
}
