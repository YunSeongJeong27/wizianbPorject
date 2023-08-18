package com.wizian.admission.wizianb.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class EvalResults {
    //모집전형 테이블
    private String rcrtNo;
    private String courseDiv;
    private String courseName;
    private String nthCode;
    private String entYear;
    private String termDiv;
    private int selCnt;
    private String statusDiv;
    private String stepDiv;

    //지원서기본정보 테이블
    private String aplyNo;//
    private String docPassYn;
    private String nameKor;

    //전형평가대상자 테이블
    private int evPdfFileNo;//
    private String note;

    //문항별평가점수 테이블
    private int ev1Score;//
    private int ev2Score;
    private int ev3Score;
    private int total;


}
