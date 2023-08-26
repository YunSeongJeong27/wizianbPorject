package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationMypage;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ApplicationMypageService {
    public List<ApplicationMypage> getCourseNameList(String memberId);

    public List<String> getApplyNo(String memberId);

    public List<ApplicationMypage> getApplyMkList(String applyNo);

    public ApplicationMypage getApplyMasterList(String rcrtNo, String applyNo);

    public ApplicationMypage getApplyAcdm(String rcrtNo, String applyNo);

    public ApplicationMypage getApplyCareer(String rcrtNo, String applyNo);

    public List<ApplicationMypage> getApplyIntroList(String rcrtNo, String applyNo);

    public boolean updateStatus(String areaDiv, String rcrtNo, String applyNo, String statusDiv);

    public List<String> statusDivList(String rcrtNo, String applyNo);
}

