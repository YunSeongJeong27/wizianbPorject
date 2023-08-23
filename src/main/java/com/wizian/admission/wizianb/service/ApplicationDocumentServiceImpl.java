package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationDocument;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.repository.ApplicationDocRepository;
import com.wizian.admission.wizianb.utill.FileService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@Component
@RequiredArgsConstructor
public class ApplicationDocumentServiceImpl implements ApplicationDocumentService {

    private final FileService fileService;
    private final ApplicationDocRepository applicationDocRepository;


    @Override
    public ApplicationDocument saveFile(ApplicationDocument applicationDocument, MultipartFile file) throws IOException {

        ApplicationDocument appFile = new ApplicationDocument();
        int newFileName = fileService.saveFile(file);

        appFile.setFileNo(newFileName);
        appFile.setDocSeq(applicationDocument.getDocSeq());
        appFile.setDocDiv(applicationDocument.getDocDiv());
        appFile.setAcdmSeq(applicationDocument.getAcdmSeq());
        appFile.setCareerSeq(applicationDocument.getCareerSeq());
        appFile.setAplyNo(applicationDocument.getAplyNo());

        applicationDocRepository.saveFile(appFile);

        return appFile;
    }
}
