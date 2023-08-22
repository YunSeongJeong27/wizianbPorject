package com.wizian.admission.wizianb.domain;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class EvTarget {

    private String aplyNo;
    private String rcrtNo;
    private String detailCourseDiv;
    private int ev1Score;
    private int ev2Score;
    private int ev3Score;
    private String rsltDiv;
    private int prelOrd;
    private String note;
    private String masDiv;
    private String msgCont;
    private int evPdfFileNo;

    // 면접 전형 대상자 추가
    @Builder
    EvTarget(String rcrtNo, String aplyNo){
        this.rcrtNo=rcrtNo;
        this.aplyNo=aplyNo;
    }
}
