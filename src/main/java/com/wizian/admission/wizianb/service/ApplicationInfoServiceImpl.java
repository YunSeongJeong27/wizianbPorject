package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.repository.ApplicationInfoRepository;
import com.wizian.admission.wizianb.utill.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class ApplicationInfoServiceImpl implements ApplicationInfoService {

    private final ApplicationInfoRepository applicationInfoRepository;
    private final PasswordEncoder passwordEncoder;
    private final ImageService imageService;


    /*지원서처음작성*/
    @Override
    @Transactional
    public ApplicationInfo join(ApplicationInfo applicationInfo, MultipartFile file) throws IOException {
        // 이메일 중복 여부 체크
        boolean isDuplicateEmail = applicationInfoRepository.existsByEmail(applicationInfo.getEmail());

        if (isDuplicateEmail) {
            return applicationInfoRepository.findByEmail(applicationInfo.getEmail());
        }

        ApplicationInfo appInfo = new ApplicationInfo();
        appInfo.setAplyNo(applicationInfo.getAplyNo());
        appInfo.setRcrtNo(applicationInfo.getRcrtNo());
        appInfo.setCourseDiv(applicationInfo.getCourseDiv());
        appInfo.setNameKor(applicationInfo.getNameKor());
        appInfo.setNameEng(applicationInfo.getNameEng());
        appInfo.setBirthday(applicationInfo.getBirthday());
        appInfo.setGender(applicationInfo.getGender());
        appInfo.setEmail(applicationInfo.getEmail());
        appInfo.setZipcode(applicationInfo.getZipcode());
        appInfo.setAddrLocal(applicationInfo.getAddrLocal());
        appInfo.setAddrDetail(applicationInfo.getAddrDetail());
        appInfo.setTelLocal(applicationInfo.getTelLocal());
        appInfo.setHpLocal(applicationInfo.getHpLocal());

        // 파일 업로드와 저장
        int newFileName = imageService.saveStoreImage(file);
        appInfo.setPicFileNo(newFileName);

        //일단, 멤버번호를 임의로 nameEng로 설정
        appInfo.setMemId(applicationInfo.getNameEng());
        appInfo.setPw(passwordEncoder.encode(applicationInfo.getPw()));
        appInfo.setLoginId(applicationInfo.getEmail());

        // member 테이블에 저장
        applicationInfoRepository.saveMember(appInfo);
        applicationInfoRepository.save(appInfo);

        // entry_apply_master 테이블에 저장
        return appInfo;
    }

    @Override
    public ApplicationInfo appInfo(String email) {
       return applicationInfoRepository.findByEmail(email);
    }

    @Override
    public ApplicationInfo findMember(String memId) {
        return applicationInfoRepository.findByMemId(memId);
    }


}

