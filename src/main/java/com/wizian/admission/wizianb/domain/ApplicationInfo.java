package com.wizian.admission.wizianb.domain;

import lombok.*;

import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ApplicationInfo {

    /*지원서기본정보*/
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
    private String docNReason;
    private String FnlPassYn;
    private int aplyPdfFileNo;


    /*회원정보*/
    private String memId;
    private String pw;
    private String loginId;
    private String memDiv;
    private Date pwdChgDate;
    private Date pwdErrDate;
    private Date lastLoginDate;


    private String rcrtNo;


}
