package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.RecruitmentInfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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

}
