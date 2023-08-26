package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationMypage;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ApplicationMypageService {
    public List<ApplicationMypage> getCourseNameList(String memberId);

    public List<String> getApplyNo(String memberId);

    public List<ApplicationMypage> getApplyMkList(String applyNo);

    public List<ApplicationMypage> getApplyMasterList(String rcrtNo, String applyNo);
}

