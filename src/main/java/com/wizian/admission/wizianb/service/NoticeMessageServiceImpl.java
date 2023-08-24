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
    public ToastUiResponseDto findNotice(String rcrtNo, String msgDiv) {
        NoticeMessage noticeMessage = noticeMessageRepository.findNotice(rcrtNo, msgDiv);

        HashMap<String, Object> resultMap = new HashMap<>();

        resultMap.put("contents", noticeMessage);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto insertNotice(JsonNode jnArr) {
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
    public ToastUiResponseDto deleteNotice(String rcrtNo, String msgDiv) {
        System.out.println("deleted:"+msgDiv);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        String[] msgCode = msgDiv.split(",");

        for (String code : msgCode) {
            System.out.println("deleted1:" + code);
            NoticeMessage data = NoticeMessage.builder()
                    .rcrtNo(rcrtNo)
                    .msgDiv(code).build();

            noticeMessageRepository.deleteNotice(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }

    @Override
    public void updateContent(JsonNode jn) {
        System.out.println("얍"+jn);
        NoticeMessage data = NoticeMessage.builder()
                .rcrtNo(jn.get("rcrtNo").asText())
                .msgDiv(jn.get("msgDiv").asText())
                .msgCont(jn.get("msgCont").asText()).build();

        noticeMessageRepository.updateContent(data);
    }
}
