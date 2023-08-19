package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.repository.ApplicationInfoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class ApplicationInfoServiceImpl implements ApplicationInfoService {

    private final ApplicationInfoRepository applicationInfoRepository;
    private final PasswordEncoder passwordEncoder;


    @Override
    public ApplicationInfo join(ApplicationInfo applicationInfo) {

        /*이메일중복검증?*/

        String encodedPassword = passwordEncoder.encode(applicationInfo.getPw());
        applicationInfo.setPw(encodedPassword);

        return applicationInfoRepository.save(applicationInfo);
    }
}
