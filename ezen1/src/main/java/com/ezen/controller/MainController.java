package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("")
	public String root() {
		return "redirect:main";
	}
	
	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
//		int cartBedgeNum = session.getAttribute(String(cart));	
//		model.addAttribute("cartBedgeNum", cartBedgeNum);
		return "main";
	}
}
