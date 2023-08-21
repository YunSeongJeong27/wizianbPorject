package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.PassManagement;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PassManagementService {

   List<PassManagement> courseSelect(String termDiv, String courseDiv);
   ToastUiResponseDto findNthList(String termDiv, String courseDiv, String rcrtNo);
   ToastUiResponseDto findPassList(String rcrtNo);
   ToastUiResponseDto findDocPass(String rcrtNo);
   ToastUiResponseDto findFnlPass(String rcrtNo);
   ToastUiResponseDto updateDocPass(JsonNode jn);
   ToastUiResponseDto updateFnlPass(JsonNode jn);
}
