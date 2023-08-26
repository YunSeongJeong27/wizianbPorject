package com.wizian.admission.wizianb.repository;


import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ApplicationIntroRepository {

    List<ApplicationIntroduce> findItem(String rcrtNo);

    void saveAnswer(int itemNo,String aplyNo,String rcrtNo,String answer);

    List<ApplicationIntroduce> findAnswerInfo(String aplyNo);

    void updateAnswer(ApplicationIntroduce applicationIntroduce);

    Boolean existsByAplyNo(String aplyNo,String rcrtNo);
}
