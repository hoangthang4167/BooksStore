package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.dao.DonHangChiTietDAO;
import com.poly.semicolons_book_store.entity.CartItem;
import com.poly.semicolons_book_store.entity.DonHang;
import com.poly.semicolons_book_store.entity.DonHangChiTiet;
import com.poly.semicolons_book_store.service.CartCookieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/donhangchitiet")
public class DonHangChiTietAdminController {
	
	@Autowired 
	DonHangChiTietDAO chiTietDAO;
	
	@RequestMapping("")
	public String formdonhang(Model model, @RequestParam("p") Optional<Integer> p) {
		DonHang item = new DonHang();
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<DonHangChiTiet> page = chiTietDAO.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/formdonhangchitiet";
	}

	@Autowired
	private CartCookieService cartCookieService;
	@RequestMapping("/Bestsellingproductpage")
	public String Bestsellingproductpage(Model model, @CookieValue(name = "cart", required = false) String cartCookie, @RequestParam("p") Optional<Integer> p) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			System.out.println(cart.size());
		} else {
			model.addAttribute("cartsize", 0);
		}
		Pageable pageable = PageRequest.of(0, 5);
		List<DonHangChiTiet> topOrders = chiTietDAO.findAllOrderBySoLuongDescWithLimit(pageable);
		model.addAttribute("topOrders", topOrders);
		return "customer/Bestsellingproduct";
	}
}
