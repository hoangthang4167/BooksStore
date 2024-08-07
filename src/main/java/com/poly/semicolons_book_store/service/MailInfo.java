package com.poly.semicolons_book_store.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MailInfo {
	private String fname;
	private String lname;
	private String from;
	private String to;
	private String subject;
	private String message;
}

