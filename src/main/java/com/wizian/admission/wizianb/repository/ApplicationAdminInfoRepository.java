package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationAdminInfoRepository {

    List<ApplicationInfo> coursePeopleList(String rcrtNo);

    ApplicationInfo peopleDetails(String rcrtNo, String aplyNo);

    List<Education> getEducationInfo(String rcrtNo, String aplyNo);

    void updateEducationInfo(Education education);

    List<Careers> getCareersInfo(String rcrtNo, String aplyNo);

    void updateCareersInfo(Careers careers);

    List<Introduce> getIntroduceList(String rcrtNo, String aplyNo);

    List<SubmissionDocuments> getSubmissionDocList(String rcrtNo, String aplyNo);
}
