package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationAdminInfoRepository {

    List<ApplicationInfo> coursePeopleList(String rcrtNo);
}
