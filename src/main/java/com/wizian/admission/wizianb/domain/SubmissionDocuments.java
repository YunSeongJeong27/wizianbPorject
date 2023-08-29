package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SubmissionDocuments {

    private String docSeq;
    private String docDiv;
    private String fileNo;


    private String aplyNo;
    private String rcrtNo;
}
