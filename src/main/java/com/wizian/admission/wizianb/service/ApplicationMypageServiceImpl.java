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
    public ApplicationMypage getApplyMasterList(String rcrtNo, String applyNo) {
        return applicationMypageRepository.getApplyMasterList(rcrtNo, applyNo);
    }

    @Override
    public ApplicationMypage getApplyAcdm(String rcrtNo, String applyNo) {
        return applicationMypageRepository.getApplyAcdm(rcrtNo, applyNo);
    }

    @Override
    public ApplicationMypage getApplyCareer(String rcrtNo, String applyNo) {
        return applicationMypageRepository.getApplyCareer(rcrtNo, applyNo);
    }

    @Override
    public List<ApplicationMypage> getApplyIntroList(String rcrtNo, String applyNo) {
        return applicationMypageRepository.getApplyIntroList(rcrtNo, applyNo);
    }

    @Override
    public boolean updateStatus(String areaDiv, String rcrtNo, String applyNo, String statusDiv) {
        return applicationMypageRepository.updateStatus(areaDiv, rcrtNo, applyNo, statusDiv);
    }

    @Override
    public List<String> statusDivList(String rcrtNo, String applyNo) {
        return applicationMypageRepository.statusDivList(rcrtNo, applyNo);
    }
}
