package com.poly.semicolons_book_store.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.Base64Utils;

import com.poly.semicolons_book_store.entity.CartItem;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CartUtils {
	private static final ObjectMapper objectMapper = new ObjectMapper();

	public static String cartToJson(List<CartItem> cart) {
		try {
			String cartJson = objectMapper.writeValueAsString(cart);
			String encodedCart = Base64Utils.encodeToUrlSafeString(cartJson.getBytes());
			return encodedCart;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<CartItem> jsonToCart(String encodedCart) {
		try {
			byte[] decodedBytes = Base64Utils.decodeFromUrlSafeString(encodedCart);
			String cartJson = new String(decodedBytes);
			return objectMapper.readValue(cartJson, new TypeReference<List<CartItem>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}
}
