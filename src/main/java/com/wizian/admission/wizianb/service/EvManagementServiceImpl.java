package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.domain.RecruitmentStatus;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.EvManagementRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class EvManagementServiceImpl implements EvManagementService {

    private final EvManagementRepository evManagementRepository;

    //검색 리스트들
    @Override
    public Map<String, List<EvalResults>> searchList(){
        Map<String, List<EvalResults>> searchInfo= new HashMap<>();
        searchInfo.put("courseDivList",evManagementRepository.searchCourseDivInfo()); //과정구분
        searchInfo.put("courseNameList",evManagementRepository.searchCourseNameInfo()); //과정명
        return searchInfo;
    }


    // 평가결과등록 테이블 전체정보
    @Override
    public ToastUiResponseDto evResultInfo(String termDiv,
                                           String courseDiv,String courseName){


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

        List<EvalResults> evResultList=evManagementRepository.evResultInfo(termDiv, courseDiv, courseName,
                RecruitmentStatus.진행중,RecruitmentStatus.완료);
        HashMap<String, Object> resultMap= new HashMap<>();
        resultMap.put("contents",evResultList);
        resultMap.put("pagination", "");
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto evSubResultInfo(String rcrtNo){
        List<EvalResults> evSubResultList=evManagementRepository.evSubResultInfo(rcrtNo);
        HashMap<String, Object> resultMap= new HashMap<>();
        resultMap.put("contents",evSubResultList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
    //점수 업데이트
    @Override
    public ToastUiResponseDto updateScore(JsonNode jn){

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        JsonNode jnArr=  jn.get("updatedRows");
        for (int i=0; i<jnArr.size(); i++ ) {
            System.out.println(jnArr.get(i).get("nameKor").asText());
            System.out.println(jnArr.get(i).get("note").isNull());

            String aplyNo =  jnArr.get(i).get("aplyNo").asText();
            String rcrtNo = jnArr.get(i).get("rcrtNo").asText();
            int ev1Score = Integer.parseInt(jnArr.get(i).get("ev1Score").asText());
            int ev2Score = Integer.parseInt(jnArr.get(i).get("ev2Score").asText());
            int ev3Score = Integer.parseInt(jnArr.get(i).get("ev3Score").asText());
            String note = (jnArr.get(i).get("note").isNull() ? "" : jnArr.get(i).get("note").asText());
            EvalResults evalResultDto= EvalResults.builder()
                    .aplyNo(aplyNo)
                    .rcrtNo(rcrtNo)
                    .ev1Score(ev1Score)
                    .ev2Score(ev2Score)
                    .ev3Score(ev3Score)
                    .note(note)
                    .build();
            evManagementRepository.updateScore(evalResultDto);
        }
        return ToastUiResponseDto.builder().data(resultMap).build();
    }

    @Override
    public void statusComplete(String rcrtNo){
        evManagementRepository.statusComplete(rcrtNo,RecruitmentStatus.완료);
    }

    @Override
    public void statusPrepared(String rcrtNo){
        evManagementRepository.statusPrepared(rcrtNo,RecruitmentStatus.진행중);
    }




}
