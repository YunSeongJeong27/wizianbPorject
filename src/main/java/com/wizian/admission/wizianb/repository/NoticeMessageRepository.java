package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.NoticeMessage;

import java.util.List;

public interface NoticeMessageRepository {

    List<NoticeMessage> findNoticeList(String rcrtNo);

    NoticeMessage findNotice(String rcrtNo, String msgDiv);

    void insertNotice(NoticeMessage data);
    void updateNotice(NoticeMessage data);
    void deleteNotice(NoticeMessage data);

    void updateContent(NoticeMessage data);

}
