package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.Careers;
import com.wizian.admission.wizianb.domain.Education;
import com.wizian.admission.wizianb.domain.Introduce;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationAdminInfoRepository {

    List<ApplicationInfo> coursePeopleList(String rcrtNo);

    ApplicationInfo peopleDetails(String aplyNo);

    List<Education> getEducationInfo(String aplyNo);

    void updateEducationInfo(Education education);

    List<Careers> getCareersInfo(String aplyNo);

    void updateCareersInfo(Careers careers);

    List<Introduce> getIntroduceList(String aplyNo);
}
