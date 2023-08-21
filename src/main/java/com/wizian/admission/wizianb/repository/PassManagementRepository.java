package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.PassManagement;
import com.wizian.admission.wizianb.domain.Recruitment;

import java.util.List;

public interface PassManagementRepository {

    List<PassManagement> courseSelect(String termDiv, String courseDiv);

    List<Recruitment> findNthList(String termDiv, String courseDiv, String rcrtNo);
    List<PassManagement> findPassList(String rcrtNo);

    List<PassManagement> findDocPass(String rcrtNo);
    List<PassManagement> findFnlPass(String rcrtNo);

    void updateDocPass(PassManagement data);
    void updateFnlPass(PassManagement data);

}
