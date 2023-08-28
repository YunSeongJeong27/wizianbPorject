package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.dto.UserAccountDto;
import com.wizian.admission.wizianb.domain.Careers;
import com.wizian.admission.wizianb.domain.Education;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
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

    /*학력사항 리스트*/
    @Override
    public List<Education> educationList(String aplyNo, String rcrtNo) {
        return applicationInfoRepository.educationList(aplyNo, rcrtNo);
    }

    /* 학력사항 저장 */
    @Override
    public void saveEducation(Education edu) {
        String[] acdmSeq = edu.getAcdmSeq().split(",");
        String[] startDate = edu.getStartDate().split(",");
        String[] endDate = edu.getEndDate().split(",");
        String[] gradeDiv = edu.getGradeDiv().split(",");
        String[] gradeStatusDiv = edu.getGradeStatusDiv().split(",");
        String[] orgName = edu.getOrgName().split(",");
        String[] deptName = edu.getDeptName().split(",");

        for(int i=0; i<startDate.length; i++){
            Education data = new Education();

            data.setRcrtNo(edu.getRcrtNo());
            data.setAplyNo(edu.getAplyNo());
            data.setStartDate(startDate[i]);
            data.setEndDate(endDate[i]);
            data.setGradeDiv(gradeDiv[i]);
            data.setGradeStatusDiv(gradeStatusDiv[i]);
            data.setOrgName(orgName[i]);
            data.setDeptName(deptName[i]);

            if(i < acdmSeq.length) {
                data.setAcdmSeq(acdmSeq[i]);
                applicationInfoRepository.updateEducation(data);       // 수정
            }
            else applicationInfoRepository.saveEducation(data);        // 신규
        }
    }

    @Override
    public List<Careers> careerList(String aplyNo, String rcrtNo) {
        return applicationInfoRepository.careerList(aplyNo, rcrtNo);
    }

    @Override
    public void saveCareer(Careers career) {
        String[] careerSeq = career.getCareerSeq().split(",");
        String[] startDate = career.getStartDate().split(",");
        String[] endDate = career.getEndDate().split(",");
        String[] plcName = career.getPlcName().split(",");
        String[] plcJob = career.getPlcJob().split(",");
        String[] note = career.getNote().split(",");

        for(int i=0; i<startDate.length; i++){
            Careers data = new Careers();

            data.setRcrtNo(career.getRcrtNo());
            data.setAplyNo(career.getAplyNo());
            data.setStartDate(startDate[i]);
            data.setEndDate(endDate[i]);
            data.setPlcName(plcName[i]);
            data.setPlcJob(plcJob[i]);
            data.setNote(note[i]);

            if(i < careerSeq.length) {
                data.setCareerSeq(careerSeq[i]);
                applicationInfoRepository.updateCareer(data);       // 수정
            }
            else applicationInfoRepository.saveCareer(data);         // 신규
        }
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

