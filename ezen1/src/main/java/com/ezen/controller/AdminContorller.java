package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminContorller {

	@RequestMapping("main")
	public String adminMain() {
		return "admin/main";
	}
	
	@RequestMapping("memberList")
	public String memberList() {
		return "admin/memberList";
	}
	
	@RequestMapping("memberListpopup")
	public String memberListpopup() {
		return "admin/memberListpopup";
	}
	
	@RequestMapping("stock")
	public String stock() {
		return "admin/stock";
	}
	
	@RequestMapping("goods")
	public String goods() {
		return "admin/goods";
	}
	
	@RequestMapping("review")
	public String review() {
		return "admin/review";
	}
	
	@RequestMapping("transaction")
	public String transaction() {
		return "admin/transaction";
	}
	
	@RequestMapping("transactionpop")
	public String transactionpop() {
		return "admin/transactionpop";
	}
	
	@RequestMapping("eventConfig")
	public String eventConfig() {
		return "admin/eventConfig";
	}
	
}
