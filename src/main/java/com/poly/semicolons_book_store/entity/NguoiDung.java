package com.poly.semicolons_book_store.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ACCOUNTS")
public class NguoiDung implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MANGUOIDUNG")
	private Long maNguoiDung;

	@Column(name = "TENDANGNHAP", unique = true)
	@NotBlank(message  = "Vui lòng nhập Tên Đăng Nhập")
	private String tenDangNhap;

	@Column(name = "MATKHAU")
	@NotBlank(message  = "Vui lòng nhập Mật Khẩu")
	private String matKhau;

	@Column(name = "TENNGUOIDUNG")
	@NotBlank(message  = "Vui lòng nhập Họ Và Tên")
	private String tenNguoiDung;

	@Column(name = "DIACHI")
	@NotBlank(message  = "Vui lòng nhập Địa Chỉ")
	private String diaChi;

	@Column(name = "SODIENTHOAI")
	@NotBlank(message  = "Vui lòng nhập Số Điện Thoại")
	private String soDienThoai;

	@Column(name = "EMAIL")
	@NotBlank(message  = "Vui lòng nhập Email")
	private String email;

	@Column(name = "VAITRO")
	private boolean vaiTro = false;

	@OneToMany(mappedBy = "nguoiDung")
	private List<DonHang> dsDonHang;

}
