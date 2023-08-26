package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;

import java.util.List;

public interface RecruitmentInfoService {
    List<TopScreeningInfo> selectedSchdlnameList(String rcrtNo);
    void insertschdl(String rcrtNo,String schdlName,String statusDiv);
    void updateSchdl(String schdlSeq,String schdlName,String statusDiv);
    TopScreeningInfo newCourseNameInfo(String courseName);
    void nthInfoSave(String rcrtNo,String schdlName,String statusDiv );

    ToastUiResponseDto deleteNthInfo(JsonNode jn);
    ToastUiResponseDto subInfo(String rcrtNo);

}
