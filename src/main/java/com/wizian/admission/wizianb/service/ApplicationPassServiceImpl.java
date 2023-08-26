package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.NoticeMessage;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.domain.Schedule;
import com.wizian.admission.wizianb.repository.ApplicationPassRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class ApplicationPassServiceImpl implements ApplicationPassService {

    private final ApplicationPassRepository applicationPassRepository;

    @Override
    public List<Recruitment> courseList(String email) {
        return applicationPassRepository.courseList(email);
    }

    @Override
    public ApplicationInfo findApplication(String email, String rcrtNo) {
        return applicationPassRepository.findApplication(email, rcrtNo);
    }

    @Override
    public NoticeMessage findNoticeMessage(String docPass, String fnlPass, String rcrtNo) {
        String code = "";

        if(docPass != null && docPass.equals("Y")){
            if(fnlPass == null) code = "20";                    // 면접 안내
            else if(fnlPass.equals("Y")) code = "30";           // 최종합격자 안내
        }
        return applicationPassRepository.findNoticeMessage(code, rcrtNo);
    }

    @Override
    public Schedule findSchedule(String rcrtNo, String schdlName) {
        return applicationPassRepository.findSchedule(rcrtNo, schdlName);
    }


    @Override
    public Recruitment findCourse(String rcrtNo) {
        return applicationPassRepository.findCourse(rcrtNo);
    }

    @Override
    public void pledgeSave(String rcrtNo, String aplyNo, String aplyStsDiv) {
        applicationPassRepository.pledgeSave(rcrtNo, aplyNo, aplyStsDiv);
    }
}

