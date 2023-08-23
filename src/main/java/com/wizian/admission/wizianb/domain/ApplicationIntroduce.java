package com.wizian.admission.wizianb.domain;

import lombok.*;

@Builder
@AllArgsConstructor
@Getter
@Setter
public class ApplicationIntroduce {

    private int itemNo;
    private String rcrtNo;
    private String itemName;
    private int maxChar;
    private String itemExpl;


}
