package com.wizian.admission.wizianb.utill;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import static com.wizian.admission.wizianb.utill.Constant.IMAGE_PATH;

@Service
public class ImageService {
    public int saveStoreImage(MultipartFile multipartFile) throws IOException {

        // 저장할 디렉토리 생성
        File directory = new File(IMAGE_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // 이미 저장된 파일의 수를 파악하여 다음에 저장될 파일 이름 결정
        File[] existingFiles = directory.listFiles();
        int nextFileNumber = existingFiles != null ? existingFiles.length + 1 : 1;

        String newFileName = nextFileNumber + ".png";

        String imageUrl = IMAGE_PATH + newFileName;
        Path saveImagePath = Paths.get(imageUrl);

        // 파일을 저장할 경로 생성
        File destinationFile = new File(saveImagePath.toUri());

        // MultipartFile을 파일로 저장
        multipartFile.transferTo(destinationFile);

        return nextFileNumber;
    }
}








