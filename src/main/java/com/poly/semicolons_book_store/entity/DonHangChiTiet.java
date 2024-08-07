package com.poly.semicolons_book_store.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ORDERDETAILS")
public class DonHangChiTiet implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MADONHANGCHITIET")
    private Long maDonHangChiTiet;

    @ManyToOne
    @JoinColumn(name = "MADONHANG")
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "MASACH")
    private Sach sach;

    @Column(name = "SOLUONG")
    private int soLuong;
}
