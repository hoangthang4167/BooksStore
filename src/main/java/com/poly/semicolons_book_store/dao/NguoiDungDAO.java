package com.poly.semicolons_book_store.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.semicolons_book_store.entity.NguoiDung;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, Long>{
    NguoiDung findByTenDangNhapAndMatKhau(String tenDangNhap, String matKhau);
    NguoiDung findByTenDangNhap(String tenDangNhap);
}