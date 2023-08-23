package com.wizian.admission.wizianb.service;

import com.wizian.admission.wizianb.domain.ApplicationDocument;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public interface ApplicationDocumentService {

    ApplicationDocument saveFile(ApplicationDocument applicationDocument, MultipartFile file) throws IOException;

}
