package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public interface ApplicationInfoRepository {

    void save(ApplicationInfo applicationInfo);
    void saveMember(ApplicationInfo applicationInfo);
    String findMax();
    Boolean existsByEmail(String email);
    Boolean existsByApp(String email,String rcrtNo);
    ApplicationInfo findByLoginId(String loginId);
    void savePassword(String loginId, String password, LocalDateTime date);
    String courseName(Object rcrtNo);
    String emailCheck(String email);
    String passwordCheck(String email);
    String memberMemId(String email);
    List<ApplicationInfo> memberAll(String memberMemId);
    void saveLastLogin(LocalDateTime date,String loginId);
    ApplicationInfo findAppInfo(String loginId,String rcrtNo);
    void updateAppInfo(ApplicationInfo applicationInfo);

}
