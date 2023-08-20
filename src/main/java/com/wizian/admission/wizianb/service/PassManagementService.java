package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

@Service
public interface PassManagementService {

   ToastUiResponseDto findAll();
   ToastUiResponseDto findByRcrtNo(String rcrtNo);
   ToastUiResponseDto updateDocPass(JsonNode jn);
   ToastUiResponseDto updateFnlPass(JsonNode jn);
}
