package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Introduce;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface ApplicationAdminInfoService {

    ToastUiResponseDto peopleList(String rcrtNo);

    ToastUiResponseDto peopleDetails(String aplyNo);

    ToastUiResponseDto getEducation(String aplyNo);

    ToastUiResponseDto updateEducation(String aplyNo, JsonNode inputRows);

    ToastUiResponseDto getCareers(String aplyNo);

    ToastUiResponseDto updateCareers(String aplyNo, JsonNode inputRows);

    List<Introduce> getIntroduce(String aplyNo);

}
