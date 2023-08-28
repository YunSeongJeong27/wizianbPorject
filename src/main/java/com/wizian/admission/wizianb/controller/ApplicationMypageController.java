package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.annotation.CurrentUser;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.ApplicationMypage;
import com.wizian.admission.wizianb.domain.ApplicationWrite;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import com.wizian.admission.wizianb.service.ApplicationMypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
public class ApplicationMypageController {

    private final ApplicationMypageService applicationMypageService;

    @GetMapping("/checked")
    public String check(@CurrentUser ApplicationInfo member, Model model){
        HashMap<String, List<ApplicationMypage>> map = new HashMap<>();
        if(member != null){
            model.addAttribute("title","마이페이지");

            List<ApplicationMypage> courseNameList =  applicationMypageService.getCourseNameList(member.getMemId());
            model.addAttribute("courseNameList",courseNameList);

            List<String> applyNo = applicationMypageService.getApplyNo(member.getMemId());
            for(int i=0; i<applyNo.toArray().length ; i++){
                map.put(applyNo.get(i), applicationMypageService.getApplyMkList(applyNo.get(i)));
            }
            model.addAttribute("mapList",map);
            return "/application/applicationChecked";
        }else{
            return "/application/applicationLogin";
        }
    }

    @PostMapping("/checked/info")
    @ResponseBody
    public ApplicationMypage checkedInfo(@RequestBody ApplicationMypage applicationMypage){
        String rcrtNo = applicationMypage.getRcrtNo();
        String applyNo = applicationMypage.getAplyNo();

        ApplicationMypage masterList =  applicationMypageService.getApplyMasterList(rcrtNo, applyNo);

        // Ajax 호출 결과를 리턴
        return masterList;
    }
    @PostMapping("/checked/edu")
    @ResponseBody
    public ApplicationMypage checkedEdu(@RequestBody ApplicationMypage applicationMypage){
        String rcrtNo = applicationMypage.getRcrtNo();
        String applyNo = applicationMypage.getAplyNo();

        ApplicationMypage applyAcdm =  applicationMypageService.getApplyAcdm(rcrtNo, applyNo);

        // Ajax 호출 결과를 리턴
        return applyAcdm;
    }
    @PostMapping("/checked/exp")
    @ResponseBody
    public ApplicationMypage checkedExp(@RequestBody ApplicationMypage applicationMypage){
        String rcrtNo = applicationMypage.getRcrtNo();
        String applyNo = applicationMypage.getAplyNo();

        ApplicationMypage applyCareer =  applicationMypageService.getApplyCareer(rcrtNo, applyNo);

        // Ajax 호출 결과를 리턴
        return applyCareer;
    }
    @PostMapping("/checked/introduce")
    @ResponseBody
    public List<ApplicationMypage> checkedIntroduce(@RequestBody ApplicationMypage applicationMypage){
        String rcrtNo = applicationMypage.getRcrtNo();
        String applyNo = applicationMypage.getAplyNo();

        List<ApplicationMypage> applyCareerList =  applicationMypageService.getApplyIntroList(rcrtNo, applyNo);

        // Ajax 호출 결과를 리턴
        return applyCareerList;
    }

    @PostMapping("/checked/updateStatus")
    @ResponseBody
    public ApplicationMypage updateStatus(@RequestBody ApplicationMypage applicationMypage){
        String areaDiv = applicationMypage.getAreaDiv();
        String rcrtNo = applicationMypage.getRcrtNo();
        String applyNo = applicationMypage.getAplyNo();
        String statusDiv = applicationMypage.getStatusDiv();

        applicationMypageService.updateStatus(areaDiv, rcrtNo, applyNo, statusDiv);

        return applicationMypage;
    }

    @PostMapping("/checked/finalSubmission")
    @ResponseBody
    public Boolean finalSubmission(@RequestBody ApplicationMypage applicationMypage){
        String rcrtNo = applicationMypage.getRcrtNo();
        String applyNo = applicationMypage.getAplyNo();
        boolean finalSubmissionResult = true;

        List<String> statusDivList = applicationMypageService.statusDivList(rcrtNo, applyNo);
        for (String status : statusDivList) {
            if (!status.equals("확인완료")) {
                finalSubmissionResult = false;
            }
        }
        return finalSubmissionResult;
    }
}