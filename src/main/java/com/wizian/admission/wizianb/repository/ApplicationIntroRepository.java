package com.wizian.admission.wizianb.repository;


import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ApplicationIntroRepository {

    List<ApplicationIntroduce> findItem(String rcrtNo);

    ApplicationIntroduce saveAnswer(ApplicationIntroduce appIntro);


}
