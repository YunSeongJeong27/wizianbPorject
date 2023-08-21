package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class ApplicationWrite {
    private String rcrtNo;
    private String entYear;
    private String courseName;
    private String courseDiv;
    private String termDiv;
    private String nthCode;
    private String eduStartDate;
    private String eduEndDate;
    private String courseMonth;
    private String statusDiv;
    private int rcrtCnt;
    private int aplyCnt;
    private int selCnt;
    private String note;
    private String stepDiv;

    private int schdlSeq;
    private String schdlName;
    private String startDate;
    private String endDate;

    private String msgDiv;
    private String msgCont;

    private String email;
    private String birthday;
}
