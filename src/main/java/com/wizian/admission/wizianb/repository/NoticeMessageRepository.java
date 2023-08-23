package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.NoticeMessage;

import java.util.List;

public interface NoticeMessageRepository {

    List<NoticeMessage> findNoticeList(String rcrtNo);

    void insertNotice(NoticeMessage data);
    void updateNotice(NoticeMessage data);

}
