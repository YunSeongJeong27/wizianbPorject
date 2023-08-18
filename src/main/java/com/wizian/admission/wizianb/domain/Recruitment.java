package com.wizian.admission.wizianb.domain;


import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Recruitment {

    private String rcrtNo;
    private String entYear;
    private String courseName;
    private String courseDiv;
    private String termDiv;
    private String nthCode;
    private String eduStartDate;
    private String eduEndDate;
    private RecruitmentStatus statusDiv;
    private int rcrtCnt;
    private int aplyCnt;
    private int selCnt;
    private int courseMonth;
    private String note;
}
