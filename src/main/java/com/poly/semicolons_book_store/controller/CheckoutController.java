package com.poly.semicolons_book_store.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.poly.semicolons_book_store.dao.DonHangChiTietDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.semicolons_book_store.dao.DonHangDAO;
import com.poly.semicolons_book_store.dao.SachDAO;
import com.poly.semicolons_book_store.entity.CartItem;
import com.poly.semicolons_book_store.entity.DonHang;
import com.poly.semicolons_book_store.entity.DonHangChiTiet;
import com.poly.semicolons_book_store.entity.NguoiDung;
import com.poly.semicolons_book_store.service.CartCookieService;
import com.poly.semicolons_book_store.service.SessionService;
@Controller
public class CheckoutController {
	@Autowired
	private CartCookieService cartCookieService;
	@Autowired
	SessionService session;

	@Autowired
	DonHangDAO dDao;

	@Autowired
	SachDAO sDao;

	@Autowired
	DonHangChiTietDAO dHCTDAO;

	@RequestMapping("/cart-to-checkout")
	public String carttocheckout(@CookieValue(name = "cart", required = false) String cartCookie,
								 HttpServletResponse response, Model model) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		if (cart != null) {
			model.addAttribute("cartsize", cart.size());
		}
		int tongtien=0;
		for (CartItem cartItem : cart) {
			tongtien += (int) (cartItem.getSoluong()*cartItem.getGia());
		}
		model.addAttribute("tongtien", tongtien);
		model.addAttribute("cart", cart);
		return "customer/checkout";
	}


	@RequestMapping("/checkout")
	public String checkout(@CookieValue(name = "cart", required = false) String cartCookie,
						   HttpServletResponse response, Model model) {
		List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
		NguoiDung nguoiDung = session.get("nguoiDung");
		System.out.println(nguoiDung.getDiaChi());
		DonHang donHang = new DonHang();
		donHang.setNguoiDung(nguoiDung);
		donHang.setDiaChi(nguoiDung.getDiaChi());
		donHang.setNgayDatHang(new Date());
		donHang = dDao.save(donHang);


////		donHangChiTiet.setDonhang(donHang);
		//OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
		for (CartItem cartItem : cart) {

			DonHangChiTiet donHangChiTiet = new DonHangChiTiet();
			donHangChiTiet.setDonHang(donHang);
			Long i = cartItem.getMasach();
			donHangChiTiet.setSach(sDao.findById(i).get());
			donHangChiTiet.setSoLuong(cartItem.getSoluong());
			/*System.out.println(donHangChiTiet.getSach().getTenSach());
			System.out.println(donHangChiTiet.getSoLuong());
			System.out.println(donHangChiTiet.getDonHang().getMaDonHang());*/
			dHCTDAO.save(donHangChiTiet);
			System.out.println("Lưu ĐHCT Thành Công");
		}

		cart = null;
		cartCookieService.updateCartCookie(response, cart);
		model.addAttribute("cartsize", 0);
		return "customer/thankyou";
	}
}
