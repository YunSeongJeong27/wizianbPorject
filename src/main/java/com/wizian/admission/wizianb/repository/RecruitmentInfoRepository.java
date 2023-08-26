package com.wizian.admission.wizianb.repository;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;

import java.util.List;

public interface RecruitmentInfoRepository {
    List<TopScreeningInfo> selectedSchdlnameList(String rcrtNo);
    //변경버튼
    void insertschdl(String rcrtNo,String schdlName,String statusDiv);
    //변경버튼
    void updateSchdl(String schdlSeq,String schdlName,String statusDiv);
    TopScreeningInfo newCourseNameInfo(String courseName);
    void nthInfoSave(String rcrtNo,String schdlName,String statusDiv);
    List<TopScreeningInfo>  subInfoList(String rcrtNo);

    int subInfoInsert (TopScreeningInfo recruitVo);
    int subInfoUpdate (TopScreeningInfo recruitVo);


}
