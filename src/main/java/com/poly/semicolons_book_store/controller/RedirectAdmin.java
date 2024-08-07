package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.dao.DonHangDAO;
import com.poly.semicolons_book_store.dao.NguoiDungDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectAdmin {
	
	@Autowired
	NguoiDungDAO nDao;
	
	@Autowired
	DonHangDAO dDao;
	
	@RequestMapping("/indexAdmin")
	public String index(Model model) {
		model.addAttribute("songuoidung", nDao.findAll().size());
		model.addAttribute("sodonhang", dDao.findAll().size());
		return "admin/index";
	}
	
	
	
}
