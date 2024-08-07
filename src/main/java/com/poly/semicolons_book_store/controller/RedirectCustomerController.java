package com.poly.semicolons_book_store.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.poly.semicolons_book_store.dao.DonHangChiTietDAO;
import com.poly.semicolons_book_store.dao.DonHangDAO;
import com.poly.semicolons_book_store.entity.DonHang;
import com.poly.semicolons_book_store.service.MailInfo;
import com.poly.semicolons_book_store.service.MailerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.poly.semicolons_book_store.dao.NguoiDungDAO;
import com.poly.semicolons_book_store.entity.CartItem;
import com.poly.semicolons_book_store.entity.NguoiDung;
import com.poly.semicolons_book_store.service.CartCookieService;
import com.poly.semicolons_book_store.service.SessionService;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

@Controller
public class RedirectCustomerController {
    @Autowired
    private CartCookieService cartCookieService;

    @Autowired
    SessionService session;

    @Autowired
    NguoiDungDAO nDao;

    @Autowired
    DonHangDAO dDAO;



    @RequestMapping("/loginForm")
    public String loadFormLogin(@ModelAttribute("acc") NguoiDung nguoiDung, Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/login";
    }

    @RequestMapping("/signupForm")
    public String loadFormSignup(@ModelAttribute("acc") NguoiDung nguoiDung, Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/signup";
    }

    @RequestMapping("/indexCustomer")
    public String loadFormIndex(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/index";
    }


    @PostMapping("/editProfile")
    public String editProfile(Model model, @ModelAttribute("nguoiDung") NguoiDung nguoiDung) {
        NguoiDung currentNguoiDung = (NguoiDung) session.get("nguoiDung");

        if (currentNguoiDung != null) {
            currentNguoiDung.setTenDangNhap(nguoiDung.getTenDangNhap());
            currentNguoiDung.setMatKhau(nguoiDung.getMatKhau());
            currentNguoiDung.setDiaChi(nguoiDung.getDiaChi());
            currentNguoiDung.setSoDienThoai(nguoiDung.getSoDienThoai());
            currentNguoiDung.setEmail(nguoiDung.getEmail());

            NguoiDung updatedNguoiDung = nDao.save(currentNguoiDung);
            session.set("nguoiDung", updatedNguoiDung);
            System.out.println("Đã cập nhật thông tin người dùng");
        } else {
            System.out.println("Không tìm thấy người dùng trong session");
        }

        return "redirect:/myprofileCustomer";
    }

    @RequestMapping("/myprofileCustomer")
    public String loadFormMyProfile(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/myprofile";
    }

    @RequestMapping("/logout")
    public String logout() {
        session.remove("nguoiDung");
        return "redirect:/loginForm";
    }

    @RequestMapping("/aboutCustomer")
    public String loadFormAbout(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/about";
    }

    @RequestMapping("/contactCustomer")
    public String loadFormContact(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/contact";
    }

    @RequestMapping("/myOrders")
    public String loadFormMyOrders(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        NguoiDung nguoiDung = session.get("nguoiDung");
        NguoiDung temp = nDao.findById(nguoiDung.getMaNguoiDung()).get();
        model.addAttribute("listOrder", temp.getDsDonHang());
        return "customer/myorders";
    }
    
    @RequestMapping("/FAQCustomer")
    public String loadFAQ(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/FAQ";
    }
    
    @RequestMapping("/eventCustomer")
    public String loadEvents(Model model, @CookieValue(name = "cart", required = false) String cartCookie) {
        List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
        if (cart != null) {
            model.addAttribute("cartsize", cart.size());
            System.out.println(cart.size());
        } else {
            model.addAttribute("cartsize", 0);
        }
        return "customer/events";
    }

    @Autowired
    MailerService mailer;

    @PostMapping("/send/contact")
    public String sendContactForm(Model model, @CookieValue(name = "cart", required = false) String cartCookie, @RequestParam("fname") String fname, @RequestParam("lname") String lname, @RequestParam("from") String from, @RequestParam("subject") String subject, @RequestParam("message") String message) {
        try {
            // Tạo đối tượng MailInfo từ dữ liệu được nhận từ request
            MailInfo mailInfo = new MailInfo();
            mailInfo.setFname(fname);
            mailInfo.setLname(lname);
            mailInfo.setFrom(from);
            mailInfo.setTo("customercare.semicolons@gmail.com"); // Địa chỉ email muốn gửi đến
            mailInfo.setSubject(subject); // Chủ đề email
            mailInfo.setMessage(message);

            // Tạo nội dung email từ thông tin form
            String body = "Họ Và Tên: " + fname + " " + lname + "<br>"
                    + "Email Khách Hàng: " + from + "<br>"
                    + "Chủ Đề: " + subject + "<br>"
                    + "Tin nhắn: " + message + "<br>";
            mailInfo.setMessage(body);
            // Gửi email
            mailer.send(mailInfo);
            model.addAttribute("message", "Gửi Tin Nhắn Thành Công");
            /*List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
            if (cart != null) {
                model.addAttribute("cartsize", cart.size());
                System.out.println(cart.size());
            } else {
                model.addAttribute("cartsize", 0);
            }*/
            return "forward:/contactCustomer";
        } catch (MessagingException e) {
            model.addAttribute("message", "Gửi Tin Nhắn Không Thành Công");
            List<CartItem> cart = cartCookieService.getCartFromCookie(cartCookie);
            if (cart != null) {
                model.addAttribute("cartsize", cart.size());
                System.out.println(cart.size());
            } else {
                model.addAttribute("cartsize", 0);
            }
            return "forward:/contactCustomer";
        }
    }
}
