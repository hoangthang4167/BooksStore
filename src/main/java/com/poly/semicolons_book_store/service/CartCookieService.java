package com.poly.semicolons_book_store.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.poly.semicolons_book_store.entity.CartItem;

@Service
public class CartCookieService {

    public void updateCartCookie(HttpServletResponse response, List<CartItem> cart) {
        String cartJson = CartUtils.cartToJson(cart);
        Cookie cookie = new Cookie("cart", cartJson);
        cookie.setMaxAge(30 * 24 * 60 * 60); // Thời gian tồn tại của cookie (30 ngày)
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public List<CartItem> getCartFromCookie(String cartCookie) {
        if (cartCookie != null) {
            return CartUtils.jsonToCart(cartCookie);
        }
        return null;
    }
}
