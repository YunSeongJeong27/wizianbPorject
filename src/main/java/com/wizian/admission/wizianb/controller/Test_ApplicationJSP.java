package com.wizian.admission.wizianb.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//마이페이지
@Controller
public class Test_ApplicationJSP {
    @GetMapping("/app1")
    public String test1(Model model){

        return "/application/applicationChecked";
    }

    //원서작성페이지
    @GetMapping("/app2")
    public String test2(){

        return "/application/applicationWrite";
    }

    //원서작성페이지 임시데이터로 불러와봄
    @GetMapping("/getTestData")
    public ResponseEntity<List<Map<String, String>>> getTestData( ) throws Exception { // 데이터베이스에서 저장된 이벤트 정보 가져오기 로직을 여기에 구현하세요.

        List<Map<String, String>> dataList = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Map<String, String> dataMap = new HashMap<>();
            dataMap.put("status", "준비중");
            dataMap.put("title", "2023년 야간과정");
            dataMap.put("subtitle", "2023/2023년 야간과정");
            dataMap.put("progressNum", "2023년 정규과정 16기");
            dataMap.put("submitPeriod", "2023-03-30 09:00 ~ 2023-08-30 00:00" );
            dataMap.put("passDocumentPre", "2023-01-10 06:01:20" );
            dataMap.put("writeDocumentPre", "2023-02-28 11:02:30" );
            dataMap.put("finalDocumentPre", "2023-03-30 18:03:59" );

            dataList.add(dataMap);
        }


        return new ResponseEntity<>(dataList, HttpStatus.OK);
    }

    //합격자발표페이지
    @GetMapping("/app3")
    public String test3(){

        return "/application/applicationPass";
    }

    @GetMapping("/app4")
    public String test4(){

        return "/application/applicationPledge";
    }


    @GetMapping("/app5")
    public String test5(){

        return "/admin/nthTopScreening";
    }


    }




