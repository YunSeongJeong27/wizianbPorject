package com.wizian.admission.wizianb.domain;

import lombok.*;
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TopScreeningInfo {
    // 모집전형정보 (EntrySelMaster)
    private String rcrtNo;      // 모집전형정보(pk)
    private String courseDiv;   // 과정구분
    private String courseName;  // 과정명
    private String termDiv;     // 분기
    private String stepDiv;     // 전형평가단계
    private String eduStartDate;  //교육시작일
    private String eduEndDate; //교욱종료일

    // 전형평가단계(EntrySelSchdl)
    private int schdlSeq;       // 일정일련번호(pk)
    private String startDate;
    private String endDate;
    private String recruitStartDate;   // 모집 시작일시
    private String recruitEndDate;     //모집 종료일시
    private String recruitPeriod;       //모집기간
    private String announcementStartDate;   //최종발표 시작일시
    private String announcementEndDate;     //최종 종료일시
    private String announcementPeriod;       //최종발표기간
    private String schdlName;   // 일정명(=전형일정)
    private String statusDiv;   //진행상태

    public void formatterPeriod(String recruitStartDate,String recruitEndDate,
                                 String announcementStartDate,String announcementEndDate){
       if(recruitStartDate !=null && recruitEndDate !=null ) {
           this.recruitPeriod = recruitStartDate + "~" + recruitEndDate;
       }
        if(announcementStartDate !=null && announcementEndDate !=null ) {
            this.announcementPeriod = announcementStartDate + "~" + announcementEndDate;
        }
    }


}
