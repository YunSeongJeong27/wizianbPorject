package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.EvalResults;

import java.util.List;

public interface EvManagementRepository {
    List<EvalResults> evResultInfo();
    List<EvalResults> evSubResultInfo(String rcrtNo);
}
