package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.ApplicationWrite;

import java.util.List;

public interface ApplicationWriteRepository {

    List<ApplicationWrite> entrySelMaster();
    List<ApplicationWrite> entrySelSchdl();

    String selectInfoHead(String entryRcrtNo);
    List<ApplicationWrite> selectInfoContent(String entryRcrtNo, String msgDiv);

    String emailCheck(String email);
    String passwordCheck(String email, String password);

    String findId(String name, String birth);
}
