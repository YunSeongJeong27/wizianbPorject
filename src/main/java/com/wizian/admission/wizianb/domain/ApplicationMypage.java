package com.wizian.admission.wizianb.domain;

import lombok.*;

import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ApplicationMypage {
    /*지원서기본정보*/
    private String aplyNo;
    private String rcrtNo;
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

    //entry_sel_master
    private String memId;
    private String courseName;
    private String termDiv;
    private String eduStartDate;
    private String eduEndDate;
    private String courseMonth;
    private String statusDiv;
    private int rcrtCnt;
    private int aplyCnt;
    private int selCnt;
    private String note;
    private String stepDiv;

    //entry_apply_mk
    private String areaDiv;

    //entry_apply_acdm
    private String startDate;
    private String endDate;
    private String gradeDiv;
    private String gradeStatusDiv;
    private String orgName;
    private String deptName;

    //entry_apply_career
    private String plcName;
    private String plcJob;

    //entry_apply_intro
    private String answer;

    //entry_sel_intro
    private int itemNo;
    private String itemName;
    private int maxChar;
    private String itemExpl;

}
