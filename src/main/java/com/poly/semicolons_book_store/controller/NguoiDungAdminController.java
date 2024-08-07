package com.poly.semicolons_book_store.controller;

import com.poly.semicolons_book_store.dao.NguoiDungDAO;
import com.poly.semicolons_book_store.entity.NguoiDung;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/nguoidung")
public class NguoiDungAdminController {
	@Autowired
	NguoiDungDAO daoNG;

	@RequestMapping("")
	public String paginate(Model model, @RequestParam("p") Optional<Integer> p) {
		NguoiDung item = new NguoiDung();
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<NguoiDung> page = daoNG.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/formnguoidung";
	}
	
	@RequestMapping("/edit/{maNguoiDung}")
	public String edit(Model model, @PathVariable("maNguoiDung") Long manguoidung,@RequestParam("p") Optional<Integer> p) {
		
		NguoiDung item = daoNG.findById(manguoidung).get();

		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<NguoiDung> page = daoNG.findAll(pageable);
		model.addAttribute("page", page);
		
		model.addAttribute("item", item);

		return "admin/formnguoidung";
	}
	
	@RequestMapping("/delete/{manguoidung}")
	public String create(@PathVariable("manguoidung") Long manguoidung) {
		daoNG.deleteById(manguoidung);

		return "redirect:/nguoidung";
	}
}
