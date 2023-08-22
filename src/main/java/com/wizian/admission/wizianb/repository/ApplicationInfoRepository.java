package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;

import java.util.Date;
import java.util.List;

public interface ApplicationInfoRepository {

    void save(ApplicationInfo applicationInfo);
    void saveMember(ApplicationInfo applicationInfo);

    Boolean existsByEmail(String email);

    ApplicationInfo findByEmail(String email);

    ApplicationInfo findByMemId(String memId);

    ApplicationInfo findByLoginId(String loginId);
    void savePassword(String loginId, String password);





}
