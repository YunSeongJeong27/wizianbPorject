package com.wizian.admission.wizianb.domain;


import lombok.*;

import java.util.Date;

@Builder
@Getter
@Setter
@AllArgsConstructor
public class ApplicationEdu {

    /*지원서학력사항*/
    private int acdmSeq;
    private String aplyNo;
    private String rcrtNo;
    private Date startDate;
    private Date endDate;
    private String gradeDiv;
    private String gradeStatusDiv;
    private String orgName;
    private String deptName;

}
