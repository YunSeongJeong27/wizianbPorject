package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationIntroduce;
import com.wizian.admission.wizianb.repository.ApplicationIntroRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
@RequiredArgsConstructor
public class ApplicationIntroServiceImpl implements ApplicationIntroService {

    private final ApplicationIntroRepository applicationIntroRepository;


    @Override
    public List<ApplicationIntroduce> findItem(String rcrtNo) {
        return applicationIntroRepository.findItem(rcrtNo);
    }

    @Override
    public ApplicationIntroduce saveAnswer(ApplicationIntroduce appIntro) {

        ApplicationIntroduce aplyintro = new ApplicationIntroduce();
        aplyintro.setAplyNo(appIntro.getAplyNo());
        aplyintro.setRcrtNo(appIntro.getRcrtNo());
        aplyintro.setItemNo(appIntro.getItemNo());
        aplyintro.setAnswer(appIntro.getAnswer());


        applicationIntroRepository.saveAnswer(aplyintro.getItemNo(), aplyintro.getAplyNo(), aplyintro.getRcrtNo(), aplyintro.getAnswer());

        return aplyintro;
    }

    @Override
    public List<ApplicationIntroduce> findAnswerInfo(String aplyNo) {
        return applicationIntroRepository.findAnswerInfo(aplyNo);
    }


    @Override
    public void updateAnswer(ApplicationIntroduce appIntro) {

        ApplicationIntroduce aplyIntro2 = ApplicationIntroduce.builder()
                .answer(appIntro.getAnswer())
                .aplyNo(appIntro.getAplyNo())
                .rcrtNo(appIntro.getRcrtNo())
                .itemNo(appIntro.getItemNo())
                .build();

        applicationIntroRepository.updateAnswer(aplyIntro2);
    }

    @Override
    public Boolean existsByAplyNo(String aplyNo, String rcrtNo) {
        return applicationIntroRepository.existsByAplyNo(aplyNo, rcrtNo);
    }
}
