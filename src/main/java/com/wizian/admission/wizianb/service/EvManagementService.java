package com.wizian.admission.wizianb.service;



import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;

import java.util.List;
import java.util.Map;


public interface EvManagementService {
    Map<String, List<EvalResults>> searchList();
    ToastUiResponseDto evResultInfo(String termDiv,
                                    String courseDiv,String courseName);
    ToastUiResponseDto evSubResultInfo(String rcrtNo);
    ToastUiResponseDto updateScore(JsonNode jn);
    void statusComplete(String rcrtNo);
    void statusPrepared(String rcrtNo);




}
