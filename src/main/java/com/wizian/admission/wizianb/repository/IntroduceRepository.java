package com.wizian.admission.wizianb.repository;

import com.wizian.admission.wizianb.domain.Introduce;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IntroduceRepository {

    List<Introduce> findAll(String rcrtNo);
}
