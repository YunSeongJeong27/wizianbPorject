package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ApplicationInfoService {

   List<ApplicationInfo> findByMemIdAndRcrtNo(String memId,String rcrtNo);

   ApplicationInfo join(ApplicationInfo applicationInfo);
}
