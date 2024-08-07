package com.poly.semicolons_book_store.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ORDERS")
public class DonHang implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MADONHANG")
	private Long maDonHang;

	@ManyToOne
	@JoinColumn(name = "MANGUOIDUNG")
	private NguoiDung nguoiDung;

	@Column(name = "NGAYDATHANG")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngayDatHang = new Date();

	@Column(name = "DIACHI")
	private String diaChi;

	@OneToMany(mappedBy = "donHang")
	private List<DonHangChiTiet> dsDonHangChiTiet;

}
