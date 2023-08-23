package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PassManagement {

    // 지원서 기본 정보
    private String aplyNo;
    private String rcrtNo;
    private String courseDiv;
    private String nameKor;
    private String birthday;
    private String gender;
    private String email;
    private String docPassYn;
    private String FnlPassYn;

    private float evAvgScore;
    private int prelOrd;

}
