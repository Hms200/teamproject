package com.ezen.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//회원정보 수정 리스트
	@RequestMapping("/memberInfo")
	public String memberInfo(HttpServletRequest request,Model model) {
		String user_id = request.getParameter("user_id");
		User user = userDAO.getMemberInfo(user_id);
		model.addAttribute("user",user);
		return "myPage/memberInfo";
	}
	
	//회원정보 업데이트action
	@PostMapping("/userUpdateAction")
	public @ResponseBody String userUpdateAction(User user) {
		System.out.println(user.toString());
		String result = myPageService.updateUserInfo(user);
		return result;
	}
	
	@RequestMapping("/myPage")
	public String myPage(HttpSession session,Model model) {
		
		return "myPage/myPage";
	}
	
	//user_id해당 구매내역 보여주기
	@RequestMapping("/purchaseList")
	public String purchaseList(HttpServletRequest request,Model model) {
		String user_id =request.getParameter("user_id");
		myPageService.purchaseList(user_id, model);
		return "myPage/purchaseList";
	}
	
	//환불신청
	@RequestMapping("/purchaseRefundAction")
	public @ResponseBody String purchaseRefundAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskRefund")String ask) {
		String result = myPageService.changeStatement(purchase_idx,ask);
		return result;
	}
	
	//교환신청
	@RequestMapping("/purchaseChangeAction")
	public @ResponseBody String purchaseChangeAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskChange")String ask) {
		String result = myPageService.changeStatement(purchase_idx, ask);
		return result;
	}
	
	//취소신청
	@RequestMapping("/purchaseCancleAction")
	public @ResponseBody String purchaseCancleAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskCancle") String ask) {
		String result = myPageService.changeStatement(purchase_idx, ask);
		return result;
		
	}
	
	//현재진행상태별로 정렬하기
	@RequestMapping("/progressAction")
	public String progressAction(@RequestParam("cat")String cat) {
		
		String result = myPageService.sortByProgress(cat);
		return "";
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
