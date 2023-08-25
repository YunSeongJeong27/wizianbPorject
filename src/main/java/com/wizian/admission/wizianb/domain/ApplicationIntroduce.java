package com.wizian.admission.wizianb.domain;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ApplicationIntroduce {

    /*자기소개서 문항*/
    private int itemNo;
    private String rcrtNo;
    private String itemName;
    private int maxChar;
    private String itemExpl;

    private List<ApplicationIntroduce> introduceList;

    /*지원자기소개서*/
    private String aplyNo;
    private String answer;
}
