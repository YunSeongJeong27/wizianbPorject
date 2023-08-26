package com.wizian.admission.wizianb.dto;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Getter
public class UserAccountDto extends User {

    private final ApplicationInfo applicationInfo;

    public UserAccountDto(ApplicationInfo applicationInfo) {
        super(applicationInfo.getLoginId(), applicationInfo.getPw(), List.of(new SimpleGrantedAuthority("ROLE_USER")));
        this.applicationInfo = applicationInfo;
    }
}
