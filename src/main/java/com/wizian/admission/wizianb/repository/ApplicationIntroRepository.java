package com.wizian.admission.wizianb.repository;


import com.wizian.admission.wizianb.domain.ApplicationIntroduce;

public interface ApplicationIntroRepository {

    ApplicationIntroduce findItem(String rcrtNo);


}
