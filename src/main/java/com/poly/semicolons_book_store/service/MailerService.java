package com.poly.semicolons_book_store.service;

import javax.mail.MessagingException;

public interface MailerService {
		void send(MailInfo mail) throws MessagingException;
}
