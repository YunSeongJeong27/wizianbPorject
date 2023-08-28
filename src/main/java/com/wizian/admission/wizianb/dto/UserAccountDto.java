package com.wizian.admission.wizianb.dto;

import com.wizian.admission.wizianb.domain.ApplicationInfo;
import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Getter
public class UserAccountDto extends User {

    private final ApplicationInfo member;

    public UserAccountDto(ApplicationInfo member) {
        super(member.getLoginId(), member.getPw(), List.of(new SimpleGrantedAuthority("ROLE_USER")));
        this.member = member;
    }
}
