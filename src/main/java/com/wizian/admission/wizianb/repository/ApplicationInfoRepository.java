package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;

import java.util.List;

public interface ApplicationInfoRepository {

    List<ApplicationInfo> findAplyInfoByMemIdAndRcrtNo(String memId,String rcrtNo);
}
