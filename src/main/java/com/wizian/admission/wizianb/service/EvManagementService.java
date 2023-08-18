package com.wizian.admission.wizianb.service;

import dto.ToastUiResponseDto;

import java.util.List;


public interface EvManagementService {
    ToastUiResponseDto evResultInfo();

    ToastUiResponseDto evSubResultInfo(String rcrtNo);
}
