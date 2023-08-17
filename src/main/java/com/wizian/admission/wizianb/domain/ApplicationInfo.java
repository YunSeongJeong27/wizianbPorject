package com.wizian.admission.wizianb.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@AllArgsConstructor
@Getter
@Setter
public class ApplicationInfo {

    /*지원자직업,비밀번호,비밀번호확인*/
    private String aplyNo;
    private String courseDiv;
    private String nameKor;
    private String nameEng;
    private int picFileNo;
    private String birthday;
    private String gender;
    private String email;
    private String emailValidDiv;
    private String zipcode;
    private String addrLocal;
    private String addrDetail;
    private String telLocal;
    private String hpLocal;
    private String aplyStsDiv;
    private String aplyDate;
    private String docPassYn;
    private String FnlPassYn;
    private int aplyPdfFileNo;
    private String memId;


}
