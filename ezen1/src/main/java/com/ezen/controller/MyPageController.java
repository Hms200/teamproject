package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("myPage")
public class MyPageController {

	@RequestMapping("/memberInfo")
	public String memberInfo() {
		return "myPage/memberInfo";
	}
	
	@RequestMapping("/memberList")
	public String memberList() {
		return "myPage/memberList";
	}
	
	@RequestMapping("/memberListpopup")
	public String memberListpopup() {
		return "myPage/memberListpopup";
	}
	
	@RequestMapping("/myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	@RequestMapping("/purchaseList")
	public String purchaseList() {
		return "myPage/purchaseList";
	}
	
	@RequestMapping("/reviewpopup")
	public String reviewpopup() {
		return "myPage/reviewpopup";
	}
	
	
}
