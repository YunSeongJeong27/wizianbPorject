package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.*;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.ApplicationAdminInfoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class ApplicationAdminInfoServiceImpl implements ApplicationAdminInfoService{

    private final ApplicationAdminInfoRepository applicationAdminInfoRepository;

    @Override
    public ToastUiResponseDto peopleList(String rcrtNo) {
        List<ApplicationInfo> coursePeopleList = applicationAdminInfoRepository.coursePeopleList(rcrtNo);
        System.out.println(coursePeopleList);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", coursePeopleList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto peopleDetails(String rcrtNo, String aplyNo) {
        ApplicationInfo peopleDetails = applicationAdminInfoRepository.peopleDetails(rcrtNo, aplyNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", peopleDetails);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto getEducation(String rcrtNo, String aplyNo) {
        List<Education> infoEducation = applicationAdminInfoRepository.getEducationInfo(rcrtNo, aplyNo);
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", infoEducation);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateEducation(String rcrtNo, String aplyNo, JsonNode inputRows) {
        HashMap<String, Object> resultMap = new HashMap<>();
        for (JsonNode row : inputRows) {
            Education infoEducation = Education.builder()
                    .rcrtNo(rcrtNo)
                    .aplyNo(aplyNo)
                    .orgName(row.get("orgName").asText())
                    .startDate(row.get("startDate").asText())
                    .endDate(row.get("endDate").asText())
                    .gradeDiv(row.get("gradeDiv").asText())
                    .gradeStatusDiv(row.get("gradeStatusDiv").asText())
                    .orgName(row.get("orgName").asText())
                    .deptName(row.get("deptName").asText())
                    .build();
            applicationAdminInfoRepository.updateEducationInfo(infoEducation);
        }
        resultMap.put("message", "저장되었습니다.");
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto getCareers(String rcrtNo, String aplyNo) {
        List<Careers> infoCareers = applicationAdminInfoRepository.getCareersInfo(rcrtNo, aplyNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", infoCareers);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateCareers(String rcrtNo, String aplyNo, JsonNode inputRows) {
        HashMap<String, Object> resultMap = new HashMap<>();
        for (JsonNode row : inputRows) {
            Careers infoCareers = Careers.builder()
                    .rcrtNo(rcrtNo)
                    .aplyNo(aplyNo)
                    .startDate(row.get("startDate").asText())
                    .endDate(row.get("endDate").asText())
                    .plcName(row.get("plcName").asText())
                    .plcJob(row.get("plcJob").asText())
                    .note(row.get("note").asText())
                    .build();
            applicationAdminInfoRepository.updateCareersInfo(infoCareers);
        }
        resultMap.put("message", "저장되었습니다.");
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public List<Introduce> getIntroduce(String rcrtNo, String aplyNo) {
        return applicationAdminInfoRepository.getIntroduceList(rcrtNo, aplyNo);
    }

    @Override
    public List<SubmissionDocuments> getSubmissionDoc(String rcrtNo, String aplyNo) {
        return applicationAdminInfoRepository.getSubmissionDocList(rcrtNo, aplyNo);
    }


}
