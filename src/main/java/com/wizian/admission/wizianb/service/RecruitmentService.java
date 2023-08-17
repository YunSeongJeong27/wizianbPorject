package com.wizian.admission.wizianb.service;


import dto.ToastUiResponseDto;
import org.springframework.stereotype.Service;

@Service
public interface RecruitmentService {

    ToastUiResponseDto findAll();
}
