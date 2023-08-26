package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationWrite;
import com.wizian.admission.wizianb.repository.ApplicationWriteRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class ApplicationWriteServiceImpl implements ApplicationWriteService {

    private final ApplicationWriteRepository applicationWriteRepository;

    @Override
    public List<ApplicationWrite> entrySelMaster() {
        return applicationWriteRepository.entrySelMaster();
    }

    @Override
    public List<ApplicationWrite> entrySelSchdl(){
        return applicationWriteRepository.entrySelSchdl();
    }

    @Override
    public String selectInfoHead(String entryRcrtNo) {
        return applicationWriteRepository.selectInfoHead(entryRcrtNo);
    }

    @Override
    public List<ApplicationWrite> selectInfoContent(String entryRcrtNo, String msgDiv) {
        return applicationWriteRepository.selectInfoContent(entryRcrtNo, msgDiv);
    }

//    @Override
//    public String emailCheck(String email) {
//        return applicationWriteRepository.emailCheck(email);
//    }
//
//    @Override
//    public String passwordCheck(String email, String password) {
//        return applicationWriteRepository.passwordCheck(email, password);
//    }

    @Override
    public String findId(String name, String birth) {
        return applicationWriteRepository.findId(name, birth);
    }

    @Override
    public String findPw(String email) {
        return applicationWriteRepository.findPw(email);
    }

}
