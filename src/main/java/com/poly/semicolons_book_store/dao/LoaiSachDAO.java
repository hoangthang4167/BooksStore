package com.poly.semicolons_book_store.dao;


import org.springframework.data.jpa.repository.JpaRepository;


import com.poly.semicolons_book_store.entity.LoaiSach;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LoaiSachDAO extends JpaRepository<LoaiSach, Long> {
    @Query("SELECT l.maLoai, l.tenLoai, l.moTa, COUNT(s) \n" +
            "FROM LoaiSach l \n" +
            "LEFT JOIN l.dsSach s \n" +
            "GROUP BY l.maLoai, l.tenLoai, l.moTa")
    List<Object[]> getLoaiSachWithBookCount();

    LoaiSach findByTenLoai(String tenString);
}
