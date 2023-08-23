package com.wizian.admission.wizianb.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.service.NoticeMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class NoticeMessageController {

    private final NoticeMessageService noticeMessageService;

    // 안내문 리스트 조회
    @GetMapping("/notice/list")
    public ResponseEntity<ToastUiResponseDto> findNoticeList(@RequestParam("rcrtNo") String rcrtNo){
        return ResponseEntity.ok(noticeMessageService.findNoticeList(rcrtNo));
    }

    // 안내문 저장 (insert)
    @PostMapping("/notice/saveInsert")
    public ResponseEntity<ToastUiResponseDto> insertNotice(@RequestBody JsonNode noticeInsertList){
        return ResponseEntity.ok(noticeMessageService.insertNotice(noticeInsertList));
    }

    // 안내문 저장 (update)
    @PutMapping("/notice/saveUdpate")
    public ResponseEntity<ToastUiResponseDto> updateNotice(@RequestBody JsonNode noticeInsertList) {
        return ResponseEntity.ok(noticeMessageService.updateNotice(noticeInsertList));
    }
}
