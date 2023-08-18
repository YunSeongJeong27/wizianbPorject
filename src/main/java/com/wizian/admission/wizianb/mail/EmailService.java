package com.wizian.admission.wizianb.mail;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {

    void sendEmail(EmailMessage emailMessage);
}
