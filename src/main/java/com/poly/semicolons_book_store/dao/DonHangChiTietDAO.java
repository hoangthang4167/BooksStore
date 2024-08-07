package com.poly.semicolons_book_store.dao;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


import com.poly.semicolons_book_store.entity.DonHangChiTiet;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DonHangChiTietDAO extends JpaRepository<DonHangChiTiet, Long> {
    @Query("SELECT d FROM DonHangChiTiet d ORDER BY d.soLuong DESC")
    List<DonHangChiTiet> findAllOrderBySoLuongDescWithLimit(Pageable pageable);
}
