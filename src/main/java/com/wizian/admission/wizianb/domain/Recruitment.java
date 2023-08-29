package com.wizian.admission.wizianb.domain;


import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Recruitment {

    private String rcrtNo;
    private String courseName;
    private String courseDiv;
    private String termDiv;
    private String eduStartDate;
    private String eduEndDate;
    private RecruitmentStatus statusDiv;
    private int rcrtCnt;
    private int aplyCnt;
    private int selCnt;
    private int courseMonth;
    private String note;
    private String announcementEndDate; //발표시작일자
    private String announcementStartDate; //발표종료일자
    private String announcementPeriod; //발표일정
    public void formatterPeriod(String announcementStartDate,String announcementEndDate){
        if(announcementStartDate !=null && announcementEndDate !=null ) {
            this.announcementPeriod = announcementStartDate + "~" + announcementEndDate;
        }
    }
}
