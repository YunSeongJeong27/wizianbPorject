package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.Recruitment;

import java.util.List;

public interface RecruitmentRepository {
    List<Recruitment> findAll();
}
