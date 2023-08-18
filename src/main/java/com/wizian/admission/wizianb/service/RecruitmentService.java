package com.wizian.admission.wizianb.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

@Service
public interface RecruitmentService {

    ToastUiResponseDto findAll();

    ToastUiResponseDto insertRecruitment(JsonNode recruitment);
}
