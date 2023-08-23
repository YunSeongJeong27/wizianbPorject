package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationDocument;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationDocumentController {

    @PostMapping("/uploadFile")
    public String uploadFile(@RequestParam MultipartFile[] uploadFile, Model model) throws IllegalStateException, IOException {

        return null;
    }

}
