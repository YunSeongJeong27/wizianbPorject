package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Careers {

    private String careerSeq;
    private String aplyNo;
    private String rcrtNo;
    private String startDate;
    private String endDate;
    private String plcName;
    private String plcJob;
    private String note;
}
