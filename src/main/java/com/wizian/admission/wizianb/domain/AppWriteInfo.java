package com.wizian.admission.wizianb.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class AppWriteInfo {

    //지원서기본정보
    private  String memId;

    //지원서륲제출
    private int docSeq;
    private  String aplyNo;
    private  String rcrtNo;
    private  String docDiv;
    private String fileNo;

    //uploadFile
    private String contextPath;
    private String uuid;
    private String fileName;  //파일번호


    @Builder
    AppWriteInfo(String contextPath, String uuid, String fileName){
        this.contextPath=contextPath;
        this.uuid=uuid;
        this.fileName=fileName;
    }



}
