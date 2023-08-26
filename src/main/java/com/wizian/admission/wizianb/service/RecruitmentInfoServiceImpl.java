package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.domain.RecruitmentStatus;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.RecruitmentInfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RecruitmentInfoServiceImpl implements RecruitmentInfoService{

    private  final RecruitmentInfoRepository recruitmentInfoRepository;
    @Override
    public List<TopScreeningInfo> selectedSchdlnameList(String rcrtNo){
        return recruitmentInfoRepository.selectedSchdlnameList(rcrtNo);
    }

    @Override
    public void insertschdl(String rcrtNo,String schdlName,String statusDiv){
        if(schdlName.equals("unselected")){
            schdlName="";
        }
        if(statusDiv.equals("unselected")){
            statusDiv="";
        }
        recruitmentInfoRepository.insertschdl(rcrtNo,schdlName,statusDiv);
    }

    @Override
    public void updateSchdl(String schdlSeq,String schdlName,String statusDiv){
        if(schdlName.equals("unselected")){
            schdlName="";
        }
        if(statusDiv.equals("unselected")){
            statusDiv="";
        }
        recruitmentInfoRepository.updateSchdl(schdlSeq,schdlName,statusDiv);
    }

    @Override
    public  TopScreeningInfo newCourseNameInfo(String courseName){
        return recruitmentInfoRepository.newCourseNameInfo(courseName);
    }
    @Override
    public void nthInfoSave(String rcrtNo,String schdlName,String statusDiv ){
        if(schdlName.equals("unselected")){
            schdlName="";
        }
        if(statusDiv.equals("unselected")){
            statusDiv="";
        }
        System.out.println("getRcrtNo: "+rcrtNo);
        recruitmentInfoRepository.nthInfoSave(rcrtNo, schdlName, statusDiv);
    }
    @Override
    public ToastUiResponseDto deleteNthInfo(JsonNode jn){
        return null;
    }
    @Override
    public ToastUiResponseDto subInfo(String rcrtNo){
        List<TopScreeningInfo> subInfoList=recruitmentInfoRepository.subInfoList(rcrtNo);
        HashMap<String, Object> resultMap= new HashMap<>();
        resultMap.put("contents",subInfoList);
        resultMap.put("pagination", "");
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto subInfoInsert (JsonNode jn,String rcrtNo){
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = 0;
        for (JsonNode row : jn) {
            String startDate=row.get("startDate").asText();
            String endDate=row.get("endDate").asText();
            if(row.get("startDate").asText().isEmpty()){
                startDate=null;
                System.out.println("startDate: "+startDate);
            }
            if(row.get("endDate").asText().isEmpty()){
                endDate= null;
            }
            TopScreeningInfo recruitVo = TopScreeningInfo.builder()
                    .rcrtNo(rcrtNo)
                    .schdlName(row.get("schdlName").asText())
                    .startDate(startDate)
                    .endDate(endDate)
                    .statusDiv(row.get("statusDiv").asText())
                    .build();
            result = recruitmentInfoRepository.subInfoInsert(recruitVo);
        }
        resultMap.put("message", "입력하신" + result + " 건의 모집전형이 저장되었습니다.");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();

    }

    @Override
    public ToastUiResponseDto subInfoUpdate (JsonNode jn,String rcrtNo){
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = 0;
        for (JsonNode row : jn) {
            TopScreeningInfo recruitVo = TopScreeningInfo.builder()
                    .rcrtNo(rcrtNo)
                    .schdlSeq(Integer.parseInt(row.get("schdlSeq").asText()))
                    .schdlName(row.get("schdlName").asText())
                    .startDate(row.get("startDate").asText())
                    .endDate(row.get("endDate").asText())
                    .statusDiv(row.get("statusDiv").asText())
                    .build();
            result = recruitmentInfoRepository.subInfoUpdate(recruitVo);
        }
        resultMap.put("message", "입력하신" + result + " 건의 모집전형이 저장되었습니다.");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

}
