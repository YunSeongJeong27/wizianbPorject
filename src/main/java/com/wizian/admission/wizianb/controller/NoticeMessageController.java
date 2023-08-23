package com.wizian.admission.wizianb.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.NoticeMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class NoticeMessageController {

    private final NoticeMessageService noticeMessageService;

    // 안내문 리스트 조회
    @GetMapping("/notice/list")
    public ResponseEntity<ToastUiResponseDto> findNoticeList(@RequestParam("rcrtNo") String rcrtNo){
        return ResponseEntity.ok(noticeMessageService.findNoticeList(rcrtNo));
    }

    // 안내문 저장
    @PutMapping("/notice/save")
    public ResponseEntity<?> saveNotice(@RequestBody JsonNode noticeList){
        List<ToastUiResponseDto> response = new ArrayList<>();
        System.out.println(noticeList);
        if(noticeList.get("createdRows") != null){
            JsonNode data = noticeList.get("createdRows");
            ToastUiResponseDto insert = noticeMessageService.insertNotice(data);
            response.add(insert);
        }
        if (noticeList.get("updatedRows") != null){
            JsonNode data = noticeList.get("updatedRows");
            ToastUiResponseDto update = noticeMessageService.updateNotice(data);
            response.add(update);
        }
        return ResponseEntity.ok(response);
    }

    // 안내문 삭제 (update)
    @DeleteMapping("/notice/delete")
    public ResponseEntity<ToastUiResponseDto> deleteNotice(@RequestBody JsonNode noticeList) {
        System.out.println(noticeList);
        return ResponseEntity.ok(noticeMessageService.deleteNotice(noticeList));
    }
}
