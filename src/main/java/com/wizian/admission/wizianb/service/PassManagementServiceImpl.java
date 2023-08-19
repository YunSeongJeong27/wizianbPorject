package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.PassManagement;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.PassManagementRepository;
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
public class PassManagementServiceImpl implements PassManagementService {

    private final PassManagementRepository passManagementRepository;

    @Override
    public ToastUiResponseDto findAll() {
        List<PassManagement> passManagementList = passManagementRepository.findAll();

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", passManagementList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto findByRcrtNo(String rcrtNo){
        List<PassManagement> passManagementList = passManagementRepository.findByRcrtNo(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", passManagementList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updatePass(JsonNode jn) {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        JsonNode jnArr = jn.get("updatedRows");

        for (int i=0; i<jnArr.size(); i++) {
            PassManagement data = PassManagement.builder()
                    .aplyNo(jnArr.get(i).get("aplyNo").asText())
                    .rcrtNo(jnArr.get(i).get("rcrtNo").asText())
                    .docPassYn(jnArr.get(i).get("docPassYn").asText()).build();

            passManagementRepository.updatePass(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }
}
