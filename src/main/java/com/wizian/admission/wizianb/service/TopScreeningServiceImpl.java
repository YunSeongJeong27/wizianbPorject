package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.domain.RecruitmentStatus;
import com.wizian.admission.wizianb.domain.SchdlName;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.EvManagementRepository;
import com.wizian.admission.wizianb.repository.TopScreeningRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class TopScreeningServiceImpl implements TopScreeningService {

    private final TopScreeningRepository topScreeningRepository;

    @Override
    public ToastUiResponseDto nthInfo(String termDiv,
                               String courseDiv, String courseName){
        if (termDiv.equals("nullTermDiv")) {
            termDiv = "%%";
        } else {
            termDiv = "%" + termDiv + "%";
        }

        if (courseDiv.equals("nullCourseDiv")) {
            courseDiv = "%%";
        } else {
            courseDiv = "%" + courseDiv + "%";
        }

        if (courseName.equals("nullCourseName")) {
            courseName = "%%";
        } else {
            courseName = "%" + courseName + "%";
        }

        List<TopScreeningInfo> nthInfo=topScreeningRepository.nthInfo(termDiv, courseDiv, courseName,
                RecruitmentStatus.준비중,RecruitmentStatus.진행중,
                SchdlName.모집,SchdlName.최종합격자발표);

        //발표일자
        for(TopScreeningInfo nl: nthInfo){
            nl.formatterPeriod(
                    nl.getRecruitStartDate(),nl.getRecruitEndDate(),
                    nl.getAnnouncementStartDate(),nl.getAnnouncementEndDate()
            );
        }
        HashMap<String, Object> resultMap= new HashMap<>();
        resultMap.put("contents",nthInfo);
        resultMap.put("pagination", "");
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }




}
