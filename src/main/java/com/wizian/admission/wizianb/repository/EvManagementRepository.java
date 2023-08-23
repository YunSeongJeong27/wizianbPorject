package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.EvalResults;
import com.wizian.admission.wizianb.domain.RecruitmentStatus;

import java.util.List;

public interface EvManagementRepository {

    List<EvalResults> searchCourseDivInfo();
    List<EvalResults> searchCourseNameInfo();
    List<EvalResults> evResultInfo(String termDiv,
                                   String courseDiv, String courseName,
                                   RecruitmentStatus StatusPrepared, RecruitmentStatus StatusCompleted);
    List<EvalResults> evSubResultInfo(String rcrtNo);
    void updateScore(EvalResults evalResultDto);

    void statusComplete(String rcrtNo,RecruitmentStatus StatusCompleted);
    void statusPrepared(String rcrtNo,RecruitmentStatus StatusPrepared);

}
