package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.PassManagement;

import java.util.List;

public interface PassManagementRepository {

    List<PassManagement> findAll();

    List<PassManagement> findByRcrtNo(String rcrtNo);

    void updateDocPass(PassManagement data);

    void updateFnlPass(PassManagement data);

}
