package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.dao.DonHangChiTietDAO;
import com.poly.semicolons_book_store.dao.DonHangDAO;
import com.poly.semicolons_book_store.entity.DonHang;
import com.poly.semicolons_book_store.entity.DonHangChiTiet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/donhang")
public class DonHangAdminController {
	@Autowired
	DonHangDAO daoDH;

	@Autowired
	DonHangChiTietDAO daodonHangChiTiet;
	@RequestMapping("")
	public String formdonhang(Model model, @RequestParam("p") Optional<Integer> p) {
		DonHang item = new DonHang();
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<DonHang> page = daoDH.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/formdonhang";
	}

	@RequestMapping("/editDonHang/{madonhang}")
	public String editDonHang(Model model, @PathVariable("madonhang") Long madonhang,@RequestParam("p") Optional<Integer> p) {
		
		DonHang item = daoDH.findById(madonhang).get();


		model.addAttribute("item", item);

		List<DonHangChiTiet> list = item.getDsDonHangChiTiet();
		model.addAttribute("list", list);

		Pageable pageable = PageRequest.of(p.orElse(0),6);
		Page<DonHang> page = daoDH.findAll(pageable);
		model.addAttribute("page", page);
		
		return "admin/formdonhang";
	}

	@RequestMapping("/deleteDonHang/{madonhang}")
	public String deleteDonHang(@PathVariable("madonhang") Long madonhang) {
		daoDH.deleteById(madonhang);

		return "redirect:/donhang";
	}
}
