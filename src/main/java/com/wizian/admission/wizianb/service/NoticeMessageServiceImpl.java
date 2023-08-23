package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.NoticeMessage;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.NoticeMessageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class NoticeMessageServiceImpl implements NoticeMessageService {

    private final NoticeMessageRepository noticeMessageRepository;

    @Override
    public ToastUiResponseDto findNoticeList(String rcrtNo) {

        List<NoticeMessage> noticeMessageList = noticeMessageRepository.findNoticeList(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();

        resultMap.put("contents", noticeMessageList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto insertNotice(JsonNode jnArr) {
        System.out.println("created:"+jnArr);
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        for (int i=0; i<jnArr.size(); i++) {
            NoticeMessage data = NoticeMessage.builder()
                    .rcrtNo(jnArr.get(i).get("rcrtNo").asText())
                    .msgDiv(jnArr.get(i).get("msgDiv").asText())
                    .subject(jnArr.get(i).get("subject").asText())
                    .msgCont(jnArr.get(i).get("msgCont").asText()).build();

            noticeMessageRepository.insertNotice(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateNotice(JsonNode jnArr) {
        System.out.println("updated:"+jnArr);
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        for (int i=0; i<jnArr.size(); i++) {
            NoticeMessage data = NoticeMessage.builder()
                    .msgSeq(jnArr.get(i).get("msgSeq").asInt())
                    .rcrtNo(jnArr.get(i).get("rcrtNo").asText())
                    .msgDiv(jnArr.get(i).get("msgDiv").asText())
                    .subject(jnArr.get(i).get("subject").asText())
                    .msgCont(jnArr.get(i).get("msgCont").asText()).build();

            noticeMessageRepository.updateNotice(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto deleteNotice(JsonNode jn) {
        System.out.println("deleted:"+jn);
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        JsonNode jnArr = jn.get("deletedRows");

        for (int i=0; i<jnArr.size(); i++) {
            NoticeMessage data = NoticeMessage.builder()
                    .msgSeq(jnArr.get(i).get("msgSeq").asInt())
                    .rcrtNo(jnArr.get(i).get("rcrtNo").asText()).build();

            noticeMessageRepository.deleteNotice(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }
}
