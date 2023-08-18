package com.wizian.admission.wizianb.domain;


import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Schedule {

    private int schdlSeq;
    private String rcrtNo;
    private String schdlName;
    private String startDate;
    private String endDate;
    private RecruitmentStatus statusDiv;
}
