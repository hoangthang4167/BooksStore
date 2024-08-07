package com.poly.semicolons_book_store.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.semicolons_book_store.entity.CartItem;
import com.poly.semicolons_book_store.service.CartCookieService;

@Controller
public class CartController {

	@Autowired
	private CartCookieService cartCookieService;

	@PostMapping("/add-to-cart")
	public String addToCart(@CookieValue(name = "cart", required = false) String cartCookie,
							@RequestParam("soLuong") String soLuong, @RequestParam("maSach") Long maSach,
							@RequestParam("tenSach") String tenSach, @RequestParam("gia") String gia, @RequestParam("hinh") String hinh,
							HttpServletResponse response) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart == null) {
			cart = new ArrayList<>();
		}
		boolean dkAddtoCart = true;
		CartItem item = new CartItem(maSach, tenSach, Integer.valueOf(gia), Integer.valueOf(soLuong), hinh);
		for (CartItem cartItem : cart) {
			if (cartItem.getMasach().equals(item.getMasach())) {
				cartItem.setSoluong(cartItem.getSoluong() + Integer.valueOf(soLuong));
				dkAddtoCart = false;
				break;
			}
		}
		if (dkAddtoCart) {
			cart.add(item);
		}
		cartCookieService.updateCartCookie(response, cart);
		return "redirect:/view-to-cart";
	}

	@RequestMapping("/view-to-cart")
	public String viewToCart(@CookieValue(name = "cart", required = false) String cartCookie,
							 HttpServletResponse response, Model model) {

		// Xử lý thêm sản phẩm vào giỏ hàng và cập nhật cookie
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart == null) {
			cart = new ArrayList<>();
			model.addAttribute("cartsize", 0);
			model.addAttribute("buttoncheckout", false);
			model.addAttribute("buttonremove", false);
		}
//		if (cart.size() == 0) {
//
//		}
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
			model.addAttribute("buttoncheckout", true);
			model.addAttribute("buttonremove", true);
			System.out.println(cart.size());
			if (cart.size( )== 0) {
				model.addAttribute("buttoncheckout", false);
				model.addAttribute("buttonremove", false);
			}
		}
		int tongtien=0;
		for (CartItem cartItem : cart) {
			tongtien += (int) (cartItem.getSoluong()*cartItem.getGia());
		}
		model.addAttribute("cart", cart);
		model.addAttribute("tongtien", tongtien);
		//System.out.println(tongtien);
		return "customer/cart";
	}
	@GetMapping("/remove-cart")
	public String removeCart(@CookieValue(name = "cart", required = false) String cartCookie, HttpServletResponse response, Model model) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		cart = null;
		if (cart == null) {
			model.addAttribute("buttonremove", false);
		}
		cartCookieService.updateCartCookie(response, cart);
		return "redirect:/view-to-cart";
	}

	@GetMapping("/remove-to-cart")
	public String removeToCart(@CookieValue(name = "cart", required = false) String cartCookie,
							   @RequestParam("maSach") Long maSach, HttpServletResponse response, Model model) {

		// Xử lý thêm sản phẩm vào giỏ hàng và cập nhật cookie
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart == null) {
			cart = new ArrayList<>();
		}
		int index = -1;
		for (CartItem item : cart) {
			if (item.getMasach().equals(maSach)) {
				index = cart.indexOf(item);
			}
		}
		cart.remove(index);

		cartCookieService.updateCartCookie(response, cart);
		return "redirect:/view-to-cart";
	}
}
