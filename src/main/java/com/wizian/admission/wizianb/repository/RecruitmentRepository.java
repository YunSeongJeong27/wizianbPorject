package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.Recruitment;

import java.util.List;

public interface RecruitmentRepository {
    List<Recruitment> findAll();

    int insert(Recruitment insertRows);

    int update(Recruitment updateRows);

    String findRcrtNo(String rcrtNo);
}
