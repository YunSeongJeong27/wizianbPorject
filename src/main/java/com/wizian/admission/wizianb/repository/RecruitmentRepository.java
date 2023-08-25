package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.Recruitment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecruitmentRepository {
    List<Recruitment> findAll();

    List<Recruitment> searchList(String rcrtNo, String courseDiv);

    int insert(Recruitment insertRows);

    int update(Recruitment updateRows);

    String findRcrtNo(String rcrtNo);

    Recruitment findRcrtInfo(String rcrtNo);
}
