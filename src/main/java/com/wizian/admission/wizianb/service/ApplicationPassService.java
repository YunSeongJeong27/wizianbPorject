package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.NoticeMessage;
import com.wizian.admission.wizianb.domain.Recruitment;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface ApplicationPassService {
        List<Recruitment> courseList(String email);
        ApplicationInfo findApplication(String email, String rcrtNo);
        NoticeMessage findNoticeMessage(String docPass, String fnlPass, String rcrtNo);

        Recruitment findCourse(String rcrtNo);
        void pledgeSave(String rcrtNo, String aplyNo, String aplyStsDiv);

}
