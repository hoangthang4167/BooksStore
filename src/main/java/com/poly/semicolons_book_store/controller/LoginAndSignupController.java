package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.service.CartCookieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.semicolons_book_store.dao.NguoiDungDAO;
import com.poly.semicolons_book_store.entity.NguoiDung;
import com.poly.semicolons_book_store.service.SessionService;

@Controller
public class LoginAndSignupController {
	@Autowired
	NguoiDungDAO nguoiDungDAO;

	@Autowired
	SessionService session;

	@Autowired
	private CartCookieService cartCookieService;

	@PostMapping("/login")
	public String login(Model model, @RequestParam("tenDangNhap") String tenDangNhap,
						@RequestParam("matKhau") String matKhau) {
		if (tenDangNhap.isBlank() || matKhau.isBlank()) {
			model.addAttribute("errRong", true);
			return "customer/login";
		}

		NguoiDung nguoiDung = nguoiDungDAO.findByTenDangNhapAndMatKhau(tenDangNhap, matKhau);
		if (nguoiDung == null) {
			model.addAttribute("errACC", true);
			return "customer/login";
		} else {
			session.set("nguoiDung", nguoiDung);
			if (nguoiDung.isVaiTro()) {
				return "redirect:/indexAdmin";
			} else {
				return "redirect:/indexCustomer";
			}
		}
	}


	@PostMapping("/signup")
	public String signup(@ModelAttribute("acc") @Validated NguoiDung nguoiDung,
						 BindingResult errors, Model model, @RequestParam("xNMatKhau") String xNMatKhau) {
		NguoiDung item = nguoiDungDAO.findByTenDangNhap(nguoiDung.getTenDangNhap());
		if (item != null) {
			model.addAttribute("errUserNameExist", true);
		}else {
			if (xNMatKhau.isBlank()) {
				model.addAttribute("err", true);
			}else {
				if (!xNMatKhau.equals(nguoiDung.getMatKhau())) {
					model.addAttribute("errNoEquals", true);
				}else {
					if (errors.hasErrors()) {
					} else {
						nguoiDungDAO.save(nguoiDung);
						model.addAttribute("mess", true);
					}
				}
			}
		}
		model.addAttribute("xnMK", xNMatKhau);
		return "customer/signup";
	}
}
