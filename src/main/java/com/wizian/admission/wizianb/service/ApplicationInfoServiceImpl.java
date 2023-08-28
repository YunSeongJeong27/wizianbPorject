package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.dto.UserAccountDto;
import com.wizian.admission.wizianb.repository.ApplicationInfoRepository;
import com.wizian.admission.wizianb.utill.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class ApplicationInfoServiceImpl implements ApplicationInfoService, UserDetailsService {

    private final ApplicationInfoRepository applicationInfoRepository;
    private final PasswordEncoder passwordEncoder;
    private final ImageService imageService;


    /*지원서작성*/
    @Override
    @Transactional
    public ApplicationInfo join(ApplicationInfo applicationInfo, MultipartFile file) throws IOException {
        // 이메일 중복 여부 체크
        boolean isDuplicateEmail = applicationInfoRepository.existsByEmail(applicationInfo.getEmail());
        boolean isDuplicateApp = applicationInfoRepository.existsByApp(applicationInfo.getEmail(),applicationInfo.getRcrtNo());

        // aplyNo 자동등록
        String maxAplyNo = applicationInfoRepository.findMax();
        int nextNumber = 1;

        if (maxAplyNo != null) {
            String lastNumberPart = maxAplyNo.substring(4); // Skip the 'aply' prefix
            nextNumber = Integer.parseInt(lastNumberPart) + 1;
        }
        String newAplyNo = "APLY" + String.format("%04d", nextNumber); // ex: aply0001

        // mem_id가져와서 저장해야됨.
        String memId = applicationInfoRepository.memberMemId(applicationInfo.getEmail());

        //1.기존회원이고,등록된 지원서가 없다면 새로운 지원서 등록해라.
        if (isDuplicateEmail) {
            if(!isDuplicateApp){
                ApplicationInfo appInfo = new ApplicationInfo();

                appInfo.setAplyNo(newAplyNo);
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
                appInfo.setMemId(memId);

                // 파일 업로드와 저장
                int newFileName = imageService.saveImage(file);
                appInfo.setPicFileNo(newFileName);

                applicationInfoRepository.save(appInfo);

                return appInfo;
            }else{
                //2.기존회원이고,등록된 지원서가 있다면 업데이트만 해라.
                ApplicationInfo appInfo = applicationInfoRepository.findAppInfo(applicationInfo.getEmail(), applicationInfo.getRcrtNo());

                appInfo.setNameKor(applicationInfo.getNameKor());
                appInfo.setNameEng(applicationInfo.getNameEng());
                appInfo.setBirthday(applicationInfo.getBirthday());
                appInfo.setGender(applicationInfo.getGender());
                appInfo.setZipcode(applicationInfo.getZipcode());
                appInfo.setAddrLocal(applicationInfo.getAddrLocal());
                appInfo.setAddrDetail(applicationInfo.getAddrDetail());
                appInfo.setTelLocal(applicationInfo.getTelLocal());
                appInfo.setHpLocal(applicationInfo.getHpLocal());

                // 파일 업로드와 저장
                int newFileName = imageService.saveImage(file);
                appInfo.setPicFileNo(newFileName);

                applicationInfoRepository.updateAppInfo(appInfo);

                return appInfo;
            }
        }
        //3.신규회원이라면, 회원가입과 동시진행.
        ApplicationInfo appInfo = new ApplicationInfo();
        appInfo.setAplyNo(newAplyNo);
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
        int newFileName = imageService.saveImage(file);
        appInfo.setPicFileNo(newFileName);

        String uuid = UUID.randomUUID().toString();
        appInfo.setMemId(uuid);
        appInfo.setPw(passwordEncoder.encode(applicationInfo.getPw()));
        appInfo.setLoginId(applicationInfo.getEmail());

        // member 테이블에 저장
        applicationInfoRepository.saveMember(appInfo);
        // entry_apply_master 테이블에 저장
        applicationInfoRepository.save(appInfo);

        return appInfo;
    }

    public Boolean existByEmail(String email){
        return applicationInfoRepository.existsByEmail(email);
    }

    @Override
    public List<ApplicationInfo> memberAll(String memberMemId) {
        return applicationInfoRepository.memberAll(memberMemId);
    }

    @Override
    public String memberMemId(String email) {
        return applicationInfoRepository.memberMemId(email);
    }

    @Override
    public ApplicationInfo saveLastLogin(String loginId) {

        ApplicationInfo memInfo = applicationInfoRepository.findByLoginId(loginId);

        /*최근접속일자 등록*/
        LocalDateTime currentDate = LocalDateTime.now();
        applicationInfoRepository.saveLastLogin(currentDate,memInfo.getLoginId());

        return memInfo;
    }

    @Override
    public ApplicationInfo findAppInfo(String loginId, String rcrtNo) {
        return applicationInfoRepository.findAppInfo(loginId,rcrtNo);
    }

    @Override
    public ApplicationInfo findByLoginId(String memId) {
        return applicationInfoRepository.findByLoginId(memId);
    }

    /*비밀번호변경*/
    @Override
    public ApplicationInfo savePassword(String loginId,String password) {

        ApplicationInfo memberInfo =  applicationInfoRepository.findByLoginId(loginId);
        String newPassword = passwordEncoder.encode(password);

        LocalDateTime currentDate = LocalDateTime.now();
        applicationInfoRepository.savePassword(loginId,newPassword,currentDate);

        return memberInfo;
    }

    @Override
    public String courseName(Object rcrtNo) {
        return applicationInfoRepository.courseName(rcrtNo);
    }

    @Override
    public String emailCheck(String email) {
        return applicationInfoRepository.emailCheck(email);
    }

    @Override
    public String passwordCheck(String email) {
        return applicationInfoRepository.passwordCheck(email);
    }


    @Override
    public void login(ApplicationInfo member) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
                new UserAccountDto(member),
                member.getPw(),
                List.of(new SimpleGrantedAuthority("ROLE_USER")));
        SecurityContextHolder.getContext().setAuthentication(token);
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        ApplicationInfo member = applicationInfoRepository.findByLoginId(username);
        if (member == null) {
            throw new UsernameNotFoundException(username);
        }
        return new UserAccountDto(member);
    }
}

