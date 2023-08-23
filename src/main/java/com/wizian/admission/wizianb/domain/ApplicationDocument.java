package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ApplicationDocument {

    private int docSeq;
    private String aplyNo;
    private String rcrtNo;
    private String docDiv;
    private int fileNo;
    private int acdmSeq;
    private int careerSeq;


}