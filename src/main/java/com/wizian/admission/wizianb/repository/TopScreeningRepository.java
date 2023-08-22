package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.RecruitmentStatus;
import com.wizian.admission.wizianb.domain.SchdlName;
import com.wizian.admission.wizianb.domain.TopScreeningInfo;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;

import java.util.List;

public interface TopScreeningRepository {
    List<TopScreeningInfo> nthInfo(String termDiv,
                                   String courseDiv, String courseName,
                                   RecruitmentStatus StatusPreparing, RecruitmentStatus StatusPrepared,
                                    SchdlName schdlRecruitment, SchdlName schdlAnnouncement);
}
