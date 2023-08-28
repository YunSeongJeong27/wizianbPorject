package com.wizian.admission.wizianb.repository;


import com.wizian.admission.wizianb.domain.AppWriteInfo;
import com.wizian.admission.wizianb.domain.ApplicationInfo;

import java.util.List;

public interface AppWriteRepository {
    void fileUpload(AppWriteInfo appInfo);
    List<AppWriteInfo> fileInfo(ApplicationInfo member);
}
