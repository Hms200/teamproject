package com.ezen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dao.IreviewDAO;
import com.ezen.dto.Review;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	IreviewDAO reviewDAO;

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
	
	@RequestMapping("/reviewWriteAction")
	public String reviewWriteAction(@RequestBody Review review) {
		
		int result = reviewDAO.insertReview(review);
		
		return "";
	}
	
	
}
