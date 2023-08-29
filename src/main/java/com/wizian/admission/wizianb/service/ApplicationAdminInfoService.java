package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Introduce;
import com.wizian.admission.wizianb.domain.SubmissionDocuments;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface ApplicationAdminInfoService {

    ToastUiResponseDto peopleList(String rcrtNo);

    ToastUiResponseDto peopleDetails(String rcrtNo, String aplyNo);

    ToastUiResponseDto getEducation(String rcrtNo, String aplyNo);

    ToastUiResponseDto updateEducation(String rcrtNo, String aplyNo, JsonNode inputRows);

    ToastUiResponseDto getCareers(String rcrtNo, String aplyNo);

    ToastUiResponseDto updateCareers(String rcrtNo, String aplyNo, JsonNode inputRows);

    List<Introduce> getIntroduce(String rcrtNo, String aplyNo);

    List<SubmissionDocuments> getSubmissionDoc(String rcrtNo, String aplyNo);
}
