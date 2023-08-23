package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import com.wizian.admission.wizianb.repository.ApplicationIntroRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
@RequiredArgsConstructor
public class ApplicationIntroServiceImpl implements ApplicationIntroService{

    private final ApplicationIntroRepository applicationIntroRepository;


    @Override
    public ApplicationIntroduce findItem(String rcrtNo) {

        applicationIntroRepository.findItem(rcrtNo);


        return null;
    }
}
