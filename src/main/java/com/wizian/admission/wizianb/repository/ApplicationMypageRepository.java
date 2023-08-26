package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationMypage;

import java.util.List;

public interface ApplicationMypageRepository {
    List<ApplicationMypage> getCourseNameList(String memberId);

    List<String> getApplyNo(String memberId);

    List<ApplicationMypage> getApplyMkList(String applyNo);

    ApplicationMypage getApplyMasterList(String rcrtNo, String applyNo);

    ApplicationMypage getApplyAcdm(String rcrtNo, String applyNo);

    ApplicationMypage getApplyCareer(String rcrtNo, String applyNo);

    List<ApplicationMypage> getApplyIntroList(String rcrtNo, String applyNo);

    Boolean updateStatus(String areaDiv, String rcrtNo, String applyNo, String statusDiv);

    List<String> statusDivList(String rcrtNo, String applyNo);
}
