package com.poly.semicolons_book_store.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.semicolons_book_store.entity.DonHang;

public interface DonHangDAO extends JpaRepository<DonHang, Long>{

}
