package com.wizian.admission.wizianb.service;


import com.wizian.admission.wizianb.domain.AppWriteInfo;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.repository.AppWriteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AppWriteServiceImpl implements AppWriteService {

    private final AppWriteRepository appWriteRepository;
    private final ServletContext servletContext;

    @Override
    public void fileUpload(MultipartFile fileUpload, ApplicationInfo member, AppWriteInfo appInfo) throws IOException {
        String rcrtNo=  member.getRcrtNo();
        String aplyNo=member.getAplyNo();
        String contextPath = servletContext.getRealPath("/pdf/");

        if(!fileUpload.isEmpty()) {
            //getRealPath() 메소드는 웹 애플리케이션의 루트 경로를 반환합니다
            AppWriteInfo filedto=AppWriteInfo.builder()
                    .contextPath("contextPath")
                    .uuid(UUID.randomUUID().toString())
                    .fileName(fileUpload.getOriginalFilename())
                    .build();

            File newFileName= new File(contextPath +filedto.getUuid()+"_"
                    +filedto.getFileName());
            fileUpload.transferTo(newFileName);

            //데이터베이스에 저장을위해
            appInfo.setFileNo(filedto.getUuid()+"_"
                    +filedto.getFileName());
        }
        else {
            //hidden에 값을 요청해둠
            System.out.println("파일이 입력안됨 "
                    + "기존 파일로 다시나오게 dto에 기존꺼 매핑해둠");
        }
        appInfo.setRcrtNo(rcrtNo);
        appInfo.setAplyNo(aplyNo);
        appWriteRepository.fileUpload(appInfo);

    }



@Override
   public HashMap<String,String> fileInfo(ApplicationInfo member){
    List<AppWriteInfo> fileList=appWriteRepository.fileInfo(member);
    HashMap<String,String> fileDoc= new HashMap<>();
    for(AppWriteInfo data: fileList){
       fileDoc.put(data.getDocDiv(),data.getFileNo());
    }
    return fileDoc;
}
@Override
    public ResponseEntity<Object> fileDownload(String fileNo) throws IOException {
    //데이터베이스 저장을 위해 board에 filename과 filepath저장
    String contextPath = servletContext.getRealPath("/pdf/");
    Path path= Paths.get(contextPath+"/"+fileNo);
    HttpHeaders headers = new HttpHeaders();

    headers.setContentDisposition(ContentDisposition.builder("attachment").
            filename(fileNo, StandardCharsets.UTF_8 ).build());
    Resource resource =  new InputStreamResource(Files.newInputStream(path));

    return new ResponseEntity<>(resource, headers, HttpStatus.OK);
}



}
