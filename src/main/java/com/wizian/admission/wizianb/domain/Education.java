package com.wizian.admission.wizianb.domain;

import lombok.*;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Education {

    private String acdmSeq;
    private String aplyNo;
    private String rcrtNo;
    private String startDate;
    private String endDate;
    private String gradeDiv;
    private String gradeStatusDiv;
    private String orgName;
    private String deptName;

}
