package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.NoticeMessage;
import com.wizian.admission.wizianb.domain.Recruitment;

import java.util.List;

public interface ApplicationPassRepository {

    List<Recruitment> courseList(String email);
    ApplicationInfo findApplication(String email, String rcrtNo);
    NoticeMessage findNoticeMessage(String code, String rcrtNo);

    Recruitment findCourse(String rcrtNo);

}
