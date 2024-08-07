package com.poly.semicolons_book_store.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.poly.semicolons_book_store.dao.LoaiSachDAO;
import com.poly.semicolons_book_store.dao.SachDAO;
import com.poly.semicolons_book_store.entity.CartItem;
import com.poly.semicolons_book_store.entity.LoaiSach;
import com.poly.semicolons_book_store.entity.Sach;
import com.poly.semicolons_book_store.service.CartCookieService;
import com.poly.semicolons_book_store.service.LoaiSachService;
import com.poly.semicolons_book_store.service.SessionService;

@Controller
@RequestMapping("/shopCustomer")
public class ShopCustomerController {

	@Autowired
	SachDAO sachDAO;

	@Autowired
	LoaiSachDAO loaiSachDAO;

	@Autowired
	SessionService session;

	@Autowired
	private CartCookieService cartCookieService;

	@Autowired
	LoaiSachService loaiSachService;


	@RequestMapping("")
	public String loadShopCustomer(Model model, @RequestParam("p") Optional<Integer> p,
								   @RequestParam("sortOrder") Optional<String> sortOrder,
								   @CookieValue(name = "cart", required = false) String cartCookie) {

		Pageable pageable;
		if (sortOrder.isPresent() && sortOrder.get().equals("az")) {
			pageable = PageRequest.of(p.orElse(0), 9, Sort.by("tensach").ascending());
		} else if (sortOrder.isPresent() && sortOrder.get().equals("za")) {
			pageable = PageRequest.of(p.orElse(0), 9, Sort.by("tensach").descending());
		} else if (sortOrder.isPresent() && sortOrder.get().equals("lth")) {
			pageable = PageRequest.of(p.orElse(0), 9, Sort.by("gia").ascending());
		} else if (sortOrder.isPresent() && sortOrder.get().equals("htl")) {
			pageable = PageRequest.of(p.orElse(0), 9, Sort.by("gia").descending());
		} else {
			pageable = PageRequest.of(p.orElse(0), 9);
		}
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}

		Page<Sach> dsSach = sachDAO.findAll(pageable);
		model.addAttribute("dsSach", dsSach);
		model.addAttribute("dsLoaiSachVaSoLuong", loaiSachService.getLoaiSachVoiSoLuongSach());
		model.addAttribute("showSearch", true);
		return "customer/shop";
	}

	@RequestMapping(value = "/loaiSach", method = RequestMethod.GET)
	public String loadLoaiSach(@RequestParam("mL") Long maLoai, @RequestParam("p") Optional<Integer> p, Model model) {
		Optional<LoaiSach> loaiSach = loaiSachDAO.findById(maLoai);
		if (loaiSach.isPresent()) {
			Pageable pageable = PageRequest.of(p.orElse(0), 9);
			Page<Sach> dsSachTheoLoai = sachDAO.findSachByLoaiSach(loaiSach.get(), pageable);
			model.addAttribute("dsSach", dsSachTheoLoai);
			model.addAttribute("dsLoaiSachVaSoLuong", loaiSachService.getLoaiSachVoiSoLuongSach());
			model.addAttribute("showSearch", true);
			return "customer/shop";
		} else {
			// Xử lý khi không tìm thấy loại sách
			return "redirect:/error-page";
		}
	}

	@RequestMapping(value = "/timSach", method = RequestMethod.GET)
	public String loadTimSach(
			@RequestParam("tenSach") String tenSach,
			@RequestParam("p") Optional<Integer> p,
			Model model,
			@CookieValue(name = "cart", required = false) String cartCookie) {

		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Sach> dsSachTimTheoTen = sachDAO.findByTenSachContainingIgnoreCase(tenSach, pageable);

		model.addAttribute("dsSach", dsSachTimTheoTen);
		model.addAttribute("dsLoaiSachVaSoLuong", loaiSachService.getLoaiSachVoiSoLuongSach());
		model.addAttribute("tenSach", tenSach);
		model.addAttribute("showSearch", true);

		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}

		return "customer/shop";
	}

	@RequestMapping(value = "/shop-singleCustomer", method = RequestMethod.GET)
	public String loadShopSingle(Model model, @RequestParam("maSach") Long maSach,
								 @CookieValue(name = "cart", required = false) String cartCookie) {
		Sach sach = sachDAO.findById(maSach).get();
		model.addAttribute("sach", sach);
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}
		return "customer/shop-single";
	}
}
