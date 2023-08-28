package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Introduce {

    //항목
    private int itemNo;
    private String itemName;
    private int maxChar;
    private String itemExpl;
    private String rcrtNo;

    
    //문항
    private String aplyNo;
    private String answer;
}
