package com.poly.semicolons_book_store.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "BOOKS")
public class Sach implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MASACH")
	private Long maSach;

	@Column(name = "TENSACH")
	@NotNull(message = "Không được để trống tên sách")
	private String tenSach;

	@Column(name = "HINH")
	@NotNull(message = "Không được để trống hình")
	private String hinh;

	@Column(name = "SOLUONG")
	@NotNull(message = "Không được để trống số lượng sách")
	private int soLuong;

	@ManyToOne
	@JoinColumn(name = "MALOAI")
	@NotNull(message = "Không được để trống mã loại sách")
	private LoaiSach loaiSach;

	@Column(name = "TACGIA")

	private String tacGia;
	@NotNull(message = "Không được để trống tác giả")
	@Column(name = "GIA")
	private int gia;

	@Column(name = "NAMXUATBAN")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull(message = "Không được để trống năm xuất bản")
	private Date namXuatBan;

	@Column(name = "NHAXUATBAN")
	@NotNull(message = "Không được để trống nhà xuất bản")
	private String nhaXuatBan;

	@Column(name = "XEMTRUOC", columnDefinition = "TEXT")
	@NotNull(message = "Không được để trống xem trước")
	private String xemTruoc;
}
