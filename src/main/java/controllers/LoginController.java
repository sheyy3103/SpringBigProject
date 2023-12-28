package controllers;

import org.springframework.lang.Nullable;

import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import entities.AccountDetails;

@Controller
public class LoginController {
	@RequestMapping(value = { "/dang-nhap" }, method = RequestMethod.GET)
	public String login(@Nullable @RequestParam(value = "loi") String error, Model model) {
		if (error != null) {
			model.addAttribute("msg", "Đăng nhập sai!");
		}
		return "login";
	}

	@RequestMapping(value = "/checkrole")
	public String checkRole(Model model) {
		// lấy thông tin tài khoản
		AccountDetails account = (AccountDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// duyệt role để kiểm tra và điều hướng

		for (var g : account.getAuthorities()) {
			if (g.getAuthority().equals("ROLE_ADMIN")) {
				return "redirect:/quan-tri";
			}
			if (g.getAuthority().equals("ROLE_CLIENT")) {
				return "redirect:/";
			}
		}
		return "redirect:/403";
	}

	@RequestMapping("/dang-xuat")
	public String logout(Model model) {
		model.addAttribute("msg", "Đăng xuất thành công!!!");
		return "login";
	}

	@RequestMapping("/403")
	public String accessDenied(Model model) {
		model.addAttribute("msg", "BẠN KHÔNG CÓ QUYỀN TRUY CẬP VÀO TRANG NÀY");
		return "403";
	}
}
