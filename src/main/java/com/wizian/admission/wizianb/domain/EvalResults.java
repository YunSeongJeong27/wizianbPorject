package com.wizian.admission.wizianb.domain;

import lombok.*;

import java.util.List;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class EvalResults {
    //모집전형 테이블
    private String rcrtNo;
    private String courseDiv;
    private String courseName;
    private String nthCode;
    private String entYear;
    private String termDiv;
    private int selCnt;
    private RecruitmentStatus statusDiv;
    private String stepDiv;

    //지원서기본정보 테이블
    private String aplyNo;
    private String docPassYn;
    private String nameKor;

    //전형평가대상자 테이블
    private int evPdfFileNo;
    private String note;

    //문항별평가점수 테이블
    private int ev1Score;
    private int ev2Score;
    private int ev3Score;
    private int total;

    //점수업데이트
    @Builder
    EvalResults(String rcrtNo,String aplyNo,
            int ev1Score,int ev2Score,int ev3Score){
        this.rcrtNo=rcrtNo;
        this.aplyNo=aplyNo;
        this.ev1Score=ev1Score;
        this.ev2Score=ev2Score;
        this.ev3Score=ev3Score;

    }

}
