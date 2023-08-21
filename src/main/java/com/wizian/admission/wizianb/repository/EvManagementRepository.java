package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.EvalResults;

import java.util.List;

public interface EvManagementRepository {

    List<EvalResults> searchCourseDivInfo();
    List<EvalResults> searchCourseNameInfo();
    List<EvalResults> evResultInfo(String termDiv,
                                   String courseDiv,String courseName);
    List<EvalResults> evSubResultInfo(String rcrtNo);
    void updateScore(EvalResults evalResultDto);
}
