package com.wizian.admission.wizianb.domain;


import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Recruitment {

    private String id;
    private String courseCode;
    private String courseName;
    private String courseType;
    private String courseSeasonYear;
    private String courseQuarter;
    private String courseStartDate;
    private String courseEndDate;
    private RecruitmentStatus recruitmentStatus;
    private int recruitmentPeople;
    private int applyPeopleCount;
    private int recruitmentPeopleMax;
}
