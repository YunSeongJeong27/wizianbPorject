package com.wizian.admission.wizianb.utill;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import static com.wizian.admission.wizianb.utill.Constant.FILE_PATH;

@Service
public class FileService {

    public int saveFile(MultipartFile multipartFile) throws IOException{

        File directory = new File(FILE_PATH);
        if (!directory.exists()){
            directory.mkdirs();
        }

        File[] existingFiles = directory.listFiles();
        int nextFileNumber = existingFiles !=null? existingFiles.length+1 : 1;

        String newFileName = nextFileNumber+".pdf";

        String pdfUrl = FILE_PATH + newFileName;
        Path saveFilePath = Paths.get(pdfUrl);

        File destinationFile = new File(saveFilePath.toUri());

        multipartFile.transferTo(destinationFile);

        return nextFileNumber;
    }
}
