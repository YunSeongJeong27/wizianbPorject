package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationInfoController {

    private final ApplicationInfoService applicationInfoService;

    @GetMapping("/application/info")
    public List<ApplicationInfo> getAplyInfo(@RequestParam("memId") String memId,@RequestParam("courseDiv") String courseDiv){
        return applicationInfoService.findAplyInfoByMemIdAndCourseDiv(memId, courseDiv);
    }


}
