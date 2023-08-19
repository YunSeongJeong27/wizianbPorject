package com.wizian.admission.wizianb.service;



import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;

import java.util.List;


public interface EvManagementService {
    ToastUiResponseDto evResultInfo();
    ToastUiResponseDto evSubResultInfo(String rcrtNo);
    ToastUiResponseDto updateScore(JsonNode jn);


}
