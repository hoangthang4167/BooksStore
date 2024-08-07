package com.poly.semicolons_book_store.service;

import java.util.ArrayList;
import java.util.List;

import com.poly.semicolons_book_store.dao.LoaiSachDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.semicolons_book_store.dao.LoaiSachDAO;
import com.poly.semicolons_book_store.entity.LoaiSach;

@Service
public class LoaiSachService {

    @Autowired
    private LoaiSachDAO loaiSachDao;

    public List<LoaiSach> getLoaiSachVoiSoLuongSach() {
        List<LoaiSach> loaiSachList = new ArrayList<>();

        List<Object[]> results = loaiSachDao.getLoaiSachWithBookCount();
        for (Object[] result : results) {
            Long maLoai = (Long) result[0];
            String tenLoai = (String) result[1];
            String moTa = (String) result[2];
            Long totalCount = ((Number) result[3]).longValue();

            LoaiSach loaiSach = new LoaiSach();
            loaiSach.setMaLoai(maLoai);
            loaiSach.setTenLoai(tenLoai);
            loaiSach.setMoTa(moTa);
            loaiSach.setSoluongsach(totalCount);

            loaiSachList.add(loaiSach);
        }
        return loaiSachList;
    }
}
