package com.wizian.admission.wizianb.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.domain.RecruitmentStatus;
import com.wizian.admission.wizianb.repository.RecruitmentRepository;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class RecruitmentServiceImpl implements RecruitmentService {

    private final RecruitmentRepository recruitmentRepository;

    @Override
    public ToastUiResponseDto findAll() {
        List<Recruitment> recruitmentList = recruitmentRepository.findAll();

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", recruitmentList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto insertRecruitment(JsonNode recruitment) {
        HashMap<String, Object> resultMap = new HashMap<>();
        JsonNode createdRows = recruitment.get("createdRows");
        List<Recruitment> recruitmentList = new ArrayList<>();
        try {
            for (JsonNode row : createdRows) {

                String eduStartDateStr = row.get("eduStartDate").asText();
                String eduEndDateStr = row.get("eduEndDate").asText();

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
                Date eduStartDate = dateFormat.parse(eduStartDateStr);
                Date eduEndDate = dateFormat.parse(eduEndDateStr);

                System.out.println(eduStartDateStr);
                System.out.println(yearFormat.parse(eduStartDateStr));
                String dateStr = dateFormat.format(eduStartDate);
                int month = Integer.parseInt(dateStr.substring(5, 7));
                int entYear = (month - 1) / 3 + 1;

                long diffInMilliseconds = eduEndDate.getTime() - eduStartDate.getTime();
                long diffInDays = diffInMilliseconds / (1000 * 60 * 60 * 24);
                int courseMonth = (int) Math.floor(diffInDays / 30.0);
                Recruitment recruitVo = Recruitment.builder()
                        .rcrtNo(generateRecruitmentNo(row.get("courseDiv").asText()))
                        .courseDiv(row.get("courseDiv").asText())
                        .courseName(row.get("courseName").asText())
                        .nthCode(generateCourseSerialNumber(row.get("courseDiv").asText()))
                        .entYear(String.valueOf(yearFormat.parse(eduStartDateStr)))
                        .termDiv(String.valueOf(entYear))
                        .eduStartDate(row.get("eduStartDate").asText())
                        .eduEndDate(row.get("eduEndDate").asText())
                        .courseMonth(courseMonth)
                        .statusDiv(RecruitmentStatus.PREPARED)
                        .note(row.get("note").asText())
                        .build();
                recruitmentList.add(recruitVo);
            }
        } catch (Exception e) {
            log.debug("insertRecruitment 에러남 : {}", e.getMessage());
        }
        recruitmentRepository.save(recruitmentList);
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }
    private static int courseCounter = 1;

    private String generateRecruitmentNo(String courseDiv) {
        String prefix;
        switch (courseDiv) {
            case "Java":
                prefix = "J";
                break;
            case "Python":
                prefix = "P";
                break;
            case "C++":
                prefix = "C";
                break;
            default:
                prefix = "O";
        }

        String currentYearAndMonth = new SimpleDateFormat("yyMM").format(new Date());
        String counterString = String.format("C%04d", courseCounter);

        String serialNumber = prefix + currentYearAndMonth + counterString;

        courseCounter++;
        return serialNumber;
    }
    private static int javaCounter = 10;
    private static int pythonCounter = 20;
    private static int cppCounter = 30;
    private String generateCourseSerialNumber(String courseDiv) {
        int currentCounter = 0;
        String prefix;

        switch (courseDiv) {
            case "Java":
                currentCounter = javaCounter++;
                prefix = "10";
                break;
            case "Python":
                currentCounter = pythonCounter++;
                prefix = "20";
                break;
            case "C++":
                currentCounter = cppCounter++;
                prefix = "30";
                break;
            default:
                prefix = "";
        }

        return prefix + "-" + String.format("%03d", currentCounter);
    }
}
