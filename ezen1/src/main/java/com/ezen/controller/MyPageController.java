package com.ezen.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.Review;
import com.ezen.dto.User;
import com.ezen.service.MyPageService;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	@Autowired
	IuserDAO userDAO;
	
	@RequestMapping("/memberInfo")
	public String memberInfo(HttpServletRequest request,Model model) {
		String user_id = request.getParameter("user_id");
		User user = userDAO.getMemberInfo(user_id);
		model.addAttribute("user",user);
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
