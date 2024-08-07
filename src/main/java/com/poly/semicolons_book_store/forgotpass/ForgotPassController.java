package com.poly.semicolons_book_store.forgotpass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/forgotPassword")
public class ForgotPassController {

    @Autowired
    private ForgotPasswordService forgotPasswordService;

    @GetMapping
    public String showForgotPasswordForm() {
        return "forgotPassword";
    }

    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam("otp") int enteredOtp,
                            HttpSession session, Model model) {
        int storedOtp = (int) session.getAttribute("otp");

        if (enteredOtp == storedOtp) {
            // Nếu OTP đúng, chuyển hướng đến form đổi mật khẩu
            return "redirect:/newPassword";
        } else {
            model.addAttribute("error", "Invalid OTP. Please try again.");
            return "EnterOtp"; // Trở lại trang nhập OTP
        }
    }

    @GetMapping("/resetPassword")
    public String showResetPasswordForm() {
        return "newPassword";
    }


    @PostMapping
    public String forgotPassword(@RequestParam("email") String email, Model model) {
        if (email != null && !email.isEmpty()) {
            int otpvalue = forgotPasswordService.generateOTP();
            forgotPasswordService.sendOTPEmail(email, otpvalue);

            model.addAttribute("message", "OTP is sent to your email id");
            model.addAttribute("otp", otpvalue);
            model.addAttribute("email", email);

            return "EnterOtp";
        } else {
            model.addAttribute("error", "Email is required");
            return "forgotPassword";
        }
    }
}

