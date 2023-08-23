package com.wizian.admission.wizianb.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@AllArgsConstructor
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