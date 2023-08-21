package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;

import java.util.List;

public interface ApplicationInfoRepository {

    void save(ApplicationInfo applicationInfo);
    void saveMember(ApplicationInfo applicationInfo);

    List<ApplicationInfo> findAll();

    Boolean existsByEmail(String email);

    ApplicationInfo findByEmail(String email);


}
