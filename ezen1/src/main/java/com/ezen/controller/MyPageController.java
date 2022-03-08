package com.ezen.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.dao.IreviewDAO;
import com.ezen.dto.Review;
import com.ezen.dto.User;
import com.ezen.service.MyPageService;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping("/memberInfo")
	public String memberInfo() {
		return "myPage/memberInfo";
	}
	@RequestMapping("/userUpdateAction")
	public String userUpdateAction(@RequestBody User user) {
		return"";
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
	public String reviewWriteAction(@ModelAttribute Review review) {
		String str = review.toString();
		String result = myPageService.getNewReview(review); 
		return "";
	}
	
	
}
