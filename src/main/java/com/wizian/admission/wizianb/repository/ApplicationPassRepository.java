package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.NoticeMessage;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.domain.Schedule;

import java.util.List;

public interface ApplicationPassRepository {

    List<Recruitment> courseList(String email);
    ApplicationInfo findApplication(String email, String rcrtNo);
    NoticeMessage findNoticeMessage(String code, String rcrtNo);
    Schedule findSchedule(String rcrtNo, String schdlName);

    Recruitment findCourse(String rcrtNo);
    void pledgeSave(String rcrtNo, String aplyNo, String aplyStsDiv);

}
