package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.Careers;
import com.wizian.admission.wizianb.domain.Education;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public interface ApplicationInfoService {

   ApplicationInfo join(ApplicationInfo applicationInfo, MultipartFile file) throws IOException;
   ApplicationInfo findByLoginId(String loginId);
   ApplicationInfo savePassword(String loginId,String password);
   String courseName(Object rcrtNo);
   String emailCheck(String email);
   String passwordCheck(String email);
   Boolean existByEmail(String email);
   ApplicationInfo saveLastLogin(String loginId);
   ApplicationInfo findAppInfo(String loginId,String rcrtNo);
   String memberMemId(String email);
   List<ApplicationInfo> memberAll(String memberMemId);

   List<Education> educationList(String aplyNo, String rcrtNo);
   void saveEducation(Education edu);

   List<Careers> careerList(String aplyNo, String rcrtNo);
   void saveCareer(Careers career);

}
