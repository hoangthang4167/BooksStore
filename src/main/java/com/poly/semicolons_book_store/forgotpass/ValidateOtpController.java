package com.poly.semicolons_book_store.forgotpass;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
@Controller
public class ValidateOtpController {

    @PostMapping("/validateOtp")
    public String validateOtp(@RequestParam("otp") Integer enteredOtp,
                              HttpSession session, Model model) {
        Integer storedOtp = (Integer) session.getAttribute("otp");

        if (enteredOtp != null && storedOtp != null && enteredOtp.intValue() == storedOtp.intValue()) {
            model.addAttribute("email", session.getAttribute("email"));
            return "redirect:/newPasswordForm";
        } else {
            model.addAttribute("message", "Wrong OTP");
            return "EnterOtp";
        }
    }

    @GetMapping("/validateOtp")
    public String showEnterOtpForm() {
        return "EnterOtp";
    }
}





