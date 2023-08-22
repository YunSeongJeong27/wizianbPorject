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

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
    public ToastUiResponseDto insertRecruitment(JsonNode inputRows) {
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = 0;
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            for (JsonNode row : inputRows) {
                String eduStartDateStr = row.get("eduStartDate").asText();
                String eduEndDateStr = row.get("eduEndDate").asText();

                LocalDate eduStartDate = LocalDate.parse(eduStartDateStr, dateFormatter);
                LocalDate eduEndDate = LocalDate.parse(eduEndDateStr, dateFormatter);

                int month = eduStartDate.getMonthValue();
                int termDiv = (month - 1) / 3 + 1;

                long diffInDays = ChronoUnit.DAYS.between(eduStartDate, eduEndDate);
                int courseMonth = (int) Math.floor((double) diffInDays / 30.0);

                Recruitment recruitVo = Recruitment.builder()
                        .rcrtNo(generateRecruitmentNo(row.get("courseDiv").asText(), eduStartDateStr))
                        .courseDiv(row.get("courseDiv").asText())
                        .courseName(row.get("courseName").asText())
                        .termDiv(String.valueOf(termDiv))
                        .eduStartDate(row.get("eduStartDate").asText())
                        .eduEndDate(row.get("eduEndDate").asText())
                        .courseMonth(courseMonth)
                        .statusDiv(RecruitmentStatus.준비중)
                        .note(row.get("note").asText())
                        .build();
                result = recruitmentRepository.insert(recruitVo);
            }
            resultMap.put("message", "입력하신"+ result +" 건의 모집전형이 저장되었습니다.");
        } catch (Exception e) {
            log.debug("insertRecruitment 에러남 : {}", e.getMessage());
        }
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateRecruitment(JsonNode inputRows) {
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = 0;
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            for (JsonNode row : inputRows) {
                String eduStartDateStr = row.get("eduStartDate").asText();
                String eduEndDateStr = row.get("eduEndDate").asText();

                LocalDate eduStartDate = LocalDate.parse(eduStartDateStr, dateFormatter);
                LocalDate eduEndDate = LocalDate.parse(eduEndDateStr, dateFormatter);

                int month = eduStartDate.getMonthValue();
                int termDiv = (month - 1) / 3 + 1;

                long diffInDays = ChronoUnit.DAYS.between(eduStartDate, eduEndDate);
                int courseMonth = (int) Math.floor((double) diffInDays / 30.0);

                Recruitment recruitVo = Recruitment.builder()
                        .rcrtNo(row.get("rcrtNo").asText())
                        .courseDiv(row.get("courseDiv").asText())
                        .courseName(row.get("courseName").asText())
                        .termDiv(String.valueOf(termDiv))
                        .eduStartDate(row.get("eduStartDate").asText())
                        .eduEndDate(row.get("eduEndDate").asText())
                        .courseMonth(courseMonth)
                        .statusDiv(RecruitmentStatus.준비중)
                        .note(row.get("note").asText())
                        .build();
                result = recruitmentRepository.update(recruitVo);
            }
            resultMap.put("message", "입력하신"+ result +" 건의 모집전형이 수정되었습니다.");
        } catch (Exception e) {
            log.debug("insertRecruitment 에러남 : {}", e.getMessage());
        }
        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    private String generateRecruitmentNo(String courseDiv, String eduStartDate) {
        String twoDigitYear = eduStartDate.substring(2, 4);
        String prefix = courseDiv.charAt(0) + twoDigitYear;

        int sequence = 1;
        String currentRcrtNo;
        while (true) {
            currentRcrtNo = String.format("%sC%03d", prefix, sequence);
            String existingRcrtNo = recruitmentRepository.findRcrtNo(currentRcrtNo);
            if (existingRcrtNo == null) {
                break;
            }
            sequence++;
        }

        return currentRcrtNo;
    }
}