package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class NoticeMessage {

    private int msgSeq;
    private String rcrtNo;
    private String msgDiv;
    private String subject;
    private String msgCont;
}
