package com.wizian.admission.wizianb.repository;


import com.wizian.admission.wizianb.domain.AppWriteInfo;

import java.util.List;

public interface AppWriteRepository {
    void fileUpload(AppWriteInfo appInfo);
    AppWriteInfo memInfo(String memberId);
    List<AppWriteInfo> fileInfo(AppWriteInfo member);
}
