package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationDocument;
import com.wizian.admission.wizianb.service.ApplicationDocumentService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationDocumentController {

    private final ApplicationDocumentService applicationDocumentService;

    @PostMapping("/uploadFile")
    public ResponseEntity<String> uploadFile(@ModelAttribute ApplicationDocument applicationDocument, @RequestParam MultipartFile uploadFile, Model model) throws IllegalStateException, IOException {
        try {
            ApplicationDocument appFile = applicationDocumentService.saveFile(applicationDocument, uploadFile);
            String savedFileName = Integer.toString(appFile.getFileNo());
            return ResponseEntity.ok(savedFileName);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("File upload failed.");
        }
    }
}
