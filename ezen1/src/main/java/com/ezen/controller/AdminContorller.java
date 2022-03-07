package com.ezen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminContorller {
	
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping("")
	public String adminRoot() {
		return "redirect:admin/main";
	}

	@RequestMapping("main")
	public String adminMain() {
		return "admin/main";
	}
	
	@RequestMapping("memberList")
	public String memberList(Model model) {
		return "admin/memberList";
	}
	
	// memberList 상단 필터
	@GetMapping("userSearchAction")
	public String memberListFilter(@RequestParam(name = "cat")int cat,
									@RequestParam(name = "searchText",required = false)String searchText,
									Model model) {
		if(cat == 0) {
			model = adminService.MemberListBySearch(searchText, model);
		}
		return "";
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
