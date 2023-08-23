package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import org.springframework.stereotype.Service;


@Service
public interface ApplicationIntroService {

        ApplicationIntroduce findItem(String rcrtNo);

}
