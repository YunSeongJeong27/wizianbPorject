package com.wizian.admission.wizianb.service;


import com.wizian.admission.wizianb.domain.Recruitment;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RecruitmentService {

    List<Recruitment> findAll();
}
