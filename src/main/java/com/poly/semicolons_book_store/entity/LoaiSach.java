package com.poly.semicolons_book_store.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CATEGORIES")
public class LoaiSach implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MALOAI")
	private Long maLoai;

	@Column(name = "TENLOAI", unique = true)
	private String tenLoai;

	@Column(name = "MOTA")
	private String moTa;


	@OneToMany(mappedBy = "loaiSach")
	private List<Sach> dsSach;

	@Transient
	Long soluongsach;
}
