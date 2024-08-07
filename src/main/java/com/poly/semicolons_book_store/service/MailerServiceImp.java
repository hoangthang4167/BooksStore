package com.poly.semicolons_book_store.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class MailerServiceImp implements MailerService {
	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfo mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		// Sử dụng Helper để thiết lập các thông tin cần thiết cho message
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getMessage()	, true);
		helper.setReplyTo(mail.getFrom());
		// Gửi message đến SMTP server
		sender.send(message);
		// Gửi email trả lời tự động cho khách hàng
		sendAutoReply(mail);
	}

	private void sendAutoReply(MailInfo mail) throws MessagingException {
		String replySubject = "Cảm ơn bạn đã liên hệ";
		String replyMessage = "Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi lại sớm nhất có thể.";

		MimeMessage autoReplyMessage = sender.createMimeMessage();
		MimeMessageHelper autoReplyHelper = new MimeMessageHelper(autoReplyMessage, true, "utf-8");

		autoReplyHelper.setFrom(mail.getTo()); // Địa chỉ email người gửi
		autoReplyHelper.setTo(mail.getFrom()); // Địa chỉ người nhận là email của của khách hàng nhập vào
		autoReplyHelper.setSubject(replySubject);
		autoReplyHelper.setText(replyMessage, true);
		sender.send(autoReplyMessage);
	}
}

