package com.poly.semicolons_book_store.controller;


import com.poly.semicolons_book_store.dao.LoaiSachDAO;
import com.poly.semicolons_book_store.entity.LoaiSach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/loaiSachForm")
public class LoaiSachAdminController {
	@Autowired
	LoaiSachDAO daoLS;
	
	@RequestMapping("")
	public String formsach(Model model, @RequestParam("p") Optional<Integer> p) {
		LoaiSach item = new LoaiSach();
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<LoaiSach> page = daoLS.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/formloaisach";
	}

	@RequestMapping("/createLoaiSach")
	public String createLoaiSach(@ModelAttribute("item")LoaiSach item , Model model) {
		daoLS.save(item);
		return "redirect:/loaiSachForm";
	}

	@RequestMapping("/editLoaiSach/{maloai}")
	public String editLoaiSach(Model model, @PathVariable("maloai") Long maloai ,@RequestParam("p") Optional<Integer> p) {
		LoaiSach item = daoLS.findById((maloai)).get();
		model.addAttribute("item", item);
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<LoaiSach> page = daoLS.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/formloaisach";
	}

	@RequestMapping("/updateLoaiSach")
	public String updateLoaiSach(LoaiSach item) {
		daoLS.save(item);
		return "redirect:/loaiSachForm/editLoaiSach/" + item.getMaLoai();
	}
	
	@RequestMapping("/deleteLoaiSach/{maLoai}")
	public String deleteLoaiSach(@PathVariable("maLoai")Long maloai) {
		daoLS.deleteById(maloai);
		return "redirect:/loaiSachForm";
	}
}
