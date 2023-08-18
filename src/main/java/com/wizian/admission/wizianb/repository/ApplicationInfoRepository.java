package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;

import java.util.List;

public interface ApplicationInfoRepository {

    List<ApplicationInfo> findByMemIdAndRcrtNo(String memId,String rcrtNo);
    ApplicationInfo save(ApplicationInfo applicationInfo);




    // 서류전형 합격 결과
    List<ApplicationInfo> findByRcrtNo(String rcrtNo);
}
