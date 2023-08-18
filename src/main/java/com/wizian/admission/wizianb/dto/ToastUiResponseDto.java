package com.wizian.admission.wizianb.dto;

import lombok.*;
import java.util.HashMap;

@Getter
@ToString
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ToastUiResponseDto {
    private boolean result;
    private HashMap<String, Object> data;

    @Builder
    ToastUiResponseDto(boolean result, HashMap<String, Object> data) {
        this.result = result;
        this.data = data;

    }
}
