package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationMypage;

import java.util.List;

public interface ApplicationMypageRepository {
    List<ApplicationMypage> getCourseNameList(String memberId);

    List<String> getApplyNo(String memberId);

    List<ApplicationMypage> getApplyMkList(String applyNo);

    List<ApplicationMypage> getApplyMasterList(String rcrtNo, String applyNo);
}
