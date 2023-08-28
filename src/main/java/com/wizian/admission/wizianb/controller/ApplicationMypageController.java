package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.AppWriteInfo;
import com.wizian.admission.wizianb.domain.ApplicationMypage;
import com.wizian.admission.wizianb.domain.ApplicationWrite;
import com.wizian.admission.wizianb.service.AppWriteService;
import com.wizian.admission.wizianb.service.ApplicationInfoService;
import com.wizian.admission.wizianb.service.ApplicationMypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Controller
@RequiredArgsConstructor
public class ApplicationMypageController {

    private final ApplicationMypageService applicationMypageService;
    private final AppWriteService appWriteService;

    @GetMapping("/checked")
    public String check(HttpSession session, Model model){
        HashMap<String, List<ApplicationMypage>> map = new HashMap<>();
        String memberId = (String)session.getAttribute("memberId");
        if(memberId != null){
            model.addAttribute("title","마이페이지");

            List<ApplicationMypage> courseNameList =  applicationMypageService.getCourseNameList(memberId);
            model.addAttribute("courseNameList",courseNameList);

            List<String> applyNo = applicationMypageService.getApplyNo(memberId);
            for(int i=0; i<applyNo.toArray().length ; i++){
                map.put(applyNo.get(i), applicationMypageService.getApplyMkList(applyNo.get(i)));
            }
            model.addAttribute("mapList",map);

            //파일정보가져오기
            AppWriteInfo member=appWriteService.memInfo(memberId);
            HashMap<String,String> fileInfo=appWriteService.fileInfo(member);
            Set<String> keys = fileInfo.keySet();
            for (String key : keys) {
                String value = fileInfo.get(key);
                model.addAttribute(key,value); //docDiv가 key이고 fileNo가 vale이다
                System.out.println("Key: " + key + ", Value: " + value); //지우기
            }
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

    @PostMapping("/checked/fileinsert")
    public String fileInsert(@RequestParam("fileUpload") MultipartFile fileUpload,
                             AppWriteInfo appInfo, HttpSession session) throws Exception {
        String memberId=(String)session.getAttribute("memberId");
        AppWriteInfo member=appWriteService.memInfo(memberId);

        appWriteService.fileUpload(fileUpload,member,appInfo);
        return "redirect:/checked";
    }
    @GetMapping("/checked/filedownload/{fileNo}")
    public ResponseEntity<Object> fileDownload(@PathVariable String fileNo) throws IOException {
        return appWriteService.fileDownload(fileNo);
    }



}