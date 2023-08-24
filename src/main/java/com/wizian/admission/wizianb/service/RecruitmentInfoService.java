package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.TopScreeningInfo;

import java.util.List;

public interface RecruitmentInfoService {
    List<TopScreeningInfo> selectedSchdlnameList(String rcrtNo);
    void insertschdl(String rcrtNo,String schdlName,String statusDiv);
    void updateSchdl(String schdlSeq,String schdlName,String statusDiv);

}
