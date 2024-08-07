package com.poly.semicolons_book_store.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
	private Long masach;
	private String tensach;
	private int gia;
	private int soluong;
	private String hinh;
}
