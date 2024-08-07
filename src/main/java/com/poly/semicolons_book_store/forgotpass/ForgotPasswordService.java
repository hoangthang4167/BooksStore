package com.poly.semicolons_book_store.forgotpass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class ForgotPasswordService {

    @Autowired
    private JavaMailSender javaMailSender;

    public int generateOTP() {
        Random rand = new Random();
        return rand.nextInt(1255650);
    }

    public void sendOTPEmail(String email, int otpvalue) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Hello");
        message.setText("your OTP is: " + otpvalue);
        javaMailSender.send(message);
    }
}
