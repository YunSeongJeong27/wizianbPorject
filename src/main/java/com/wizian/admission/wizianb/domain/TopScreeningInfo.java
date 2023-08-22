package com.wizian.admission.wizianb.domain;

import lombok.Getter;

@Getter
public class TopScreeningInfo {
    // 모집전형정보 (EntrySelMaster)
    private String rcrtNo;      // 모집전형정보(pk)
    private String courseDiv;   // 과정구분
    private String courseName;  // 과정명
    private String termDiv;     // 분기
    private String stepDiv;     // 전형평가단계

    // 전형평가단계(EntrySelSchdl)
    private int schdlSeq;       // 일정일련번호(pk)
    private String recruitStartDate;   // 모집 시작일시
    private String recruitEndDate;     //모집 종료일시
    private String announcementStartDate;   //최종발표 시작일시
    private String announcementEndDate;     //최종 종료일시
    private String schdlName;   // 일정명(=전형일정)


}
