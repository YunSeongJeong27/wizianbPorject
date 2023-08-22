package com.wizian.admission.wizianb.controller;


import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.TopScreeningService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class TopScreeningController {

    private final TopScreeningService topScreeningService;

    @GetMapping("topscreen/info/{termDiv}/{courseDiv}/{courseName}")
    public ResponseEntity<ToastUiResponseDto> nthInfo(@PathVariable String termDiv, @PathVariable String courseDiv,
                                                      @PathVariable String courseName){
        return ResponseEntity.ok(topScreeningService.nthInfo(termDiv, courseDiv, courseName));
    }


}
