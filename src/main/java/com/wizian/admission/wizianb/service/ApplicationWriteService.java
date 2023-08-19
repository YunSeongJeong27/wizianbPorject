package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationWrite;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ApplicationWriteService {

    public List<ApplicationWrite> entrySelMaster();
    public List<ApplicationWrite> entrySelSchdl();

    public String selectInfoHead(String entryRcrtNo);
    public List<ApplicationWrite> selectInfoContent(String entryRcrtNo, String msgDiv);

    public String emailCheck(String email);
    public String passwordCheck(String email, String password);
}
