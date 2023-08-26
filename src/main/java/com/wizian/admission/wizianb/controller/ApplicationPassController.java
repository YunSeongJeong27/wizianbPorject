package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import com.wizian.admission.wizianb.domain.NoticeMessage;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.domain.Schedule;
import com.wizian.admission.wizianb.service.ApplicationPassService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationPassController {

    private final ApplicationPassService applicationPassService;


    @GetMapping("/pass")
    public String pass(Model model,HttpSession session){
        ApplicationInfo member = (ApplicationInfo) session.getAttribute("login");

        if(member != null) {
            List<Recruitment> courseList = applicationPassService.courseList(member.getLoginId());

            if (!courseList.isEmpty()) {
                String rcrtNo = courseList.get(0).getRcrtNo();

                ApplicationInfo application = applicationPassService.findApplication(member.getLoginId(), rcrtNo);
                model.addAttribute("application", application);
                model.addAttribute("message", applicationPassService.findNoticeMessage(application.getDocPassYn(), application.getFnlPassYn(), rcrtNo));
                model.addAttribute("scheduleDoc", applicationPassService.findSchedule(rcrtNo, "서류합격자발표"));
                model.addAttribute("scheduleFnl", applicationPassService.findSchedule(rcrtNo, "최종합격자발표"));
            }

            model.addAttribute("title", "합격자발표");
            model.addAttribute("courseList", courseList);

            return "/application/applicationPass";
        } else {
            return "/application/applicationLogin";
        }
    }

    @GetMapping("/pass/findApplication/{rcrtNo}")
    public ResponseEntity<Model> findApplication(@PathVariable String rcrtNo, Model model, HttpSession session){

        ApplicationInfo member = (ApplicationInfo) session.getAttribute("login");

        ApplicationInfo application = applicationPassService.findApplication(member.getLoginId(), rcrtNo);
        NoticeMessage message = applicationPassService.findNoticeMessage(application.getDocPassYn(), application.getFnlPassYn(), rcrtNo);
        Schedule scheduleDoc = applicationPassService.findSchedule(rcrtNo, "서류합격자발표");
        Schedule scheduleFnl = applicationPassService.findSchedule(rcrtNo, "최종합격자발표");

        model.addAttribute("application", application);
        model.addAttribute("message", message);
        model.addAttribute("scheduleDoc", scheduleDoc);
        model.addAttribute("scheduleFnl", scheduleFnl);

        return ResponseEntity.status(HttpStatus.OK).body(model);
    }

    @GetMapping("/pledge/{rcrtNo}/{aplyNo}")
    public String pledge(@PathVariable String rcrtNo, @PathVariable String aplyNo, Model model){
        model.addAttribute("title","등록서약/포기");

        model.addAttribute("course", applicationPassService.findCourse(rcrtNo));
        model.addAttribute("aplyNo", aplyNo);

        return "/application/applicationPledge";
    }

    @PostMapping("/pledge/{rcrtNo}/{aplyNo}")
    public String pledgeSave(@PathVariable String rcrtNo, @PathVariable String aplyNo, @RequestParam("aplyStsDiv")String aplyStsDiv){
        applicationPassService.pledgeSave(rcrtNo, aplyNo, aplyStsDiv);

        return "redirect:/pass";
    }
}
