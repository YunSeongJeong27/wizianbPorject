package com.wizian.admission.wizianb.service;



import com.wizian.admission.wizianb.dto.ToastUiResponseDto;

import java.util.List;


public interface EvManagementService {
    ToastUiResponseDto evResultInfo();

    ToastUiResponseDto evSubResultInfo(String rcrtNo);
}
