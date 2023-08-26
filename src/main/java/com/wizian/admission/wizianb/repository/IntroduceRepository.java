package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.Introduce;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IntroduceRepository {

    List<Introduce> findAll(String rcrtNo);

    int insertIntroduceItem(Introduce introduceItem);

    int updateIntroduceItem(Introduce introduceItem, String rcrtNo);

    List<Introduce> findItem(String rcrtNo);

    void saveAnswer(int itemNo,String aplyNo,String rcrtNo,String answer);

    List<Introduce> findAnswerInfo(String aplyNo);

    void updateAnswer(String answer,String aplyNo,String rcrtNo,int itemNo);

    Boolean existsByAplyNo(String aplyNo,String rcrtNo);

    int updateIntroduceItem(Introduce introduceItem);
}
