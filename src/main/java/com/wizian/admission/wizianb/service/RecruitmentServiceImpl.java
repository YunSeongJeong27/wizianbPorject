package com.wizian.admission.wizianb.service;


import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.repository.RecruitmentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class RecruitmentServiceImpl implements RecruitmentService {

    private final RecruitmentRepository recruitmentRepository;

    @Override
    public List<Recruitment> findAll() {
        return recruitmentRepository.findAll();
    }
}
