package com.ezen.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.dao.IreviewIMGSDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Review;
import com.ezen.dto.ReviewIMGS;
import com.ezen.dto.User;
import com.ezen.service.FileService;
import com.ezen.service.MyPageService;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	@Autowired
	IuserDAO userDAO;
	@Autowired
	FileService fileService;
	@Autowired
	IreviewIMGSDAO reviewImgsDAO;
	@Autowired
	HttpSession session;
	
	//회원정보 수정 리스트
	@RequestMapping("/memberInfo")
	public String memberInfo(HttpServletRequest request,Model model) {
		String id;
		try {
			id = (String)session.getAttribute("user_id");
			id.isEmpty();
		} catch (NullPointerException e) {
			return "login/login";
		}
		String user_id = id;
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
	
	//마이페이지 화면보여주기
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		try {
			String id = (String)session.getAttribute("user_id");
			id.isEmpty();
		} catch (NullPointerException e) {
			return "login/login";
		}
		return "myPage/myPage";
	}
	
	//user_id해당 구매내역 보여주기
	@RequestMapping("/purchaseList")
	public String purchaseList(HttpServletRequest request,Model model,
							   @RequestParam(name = "cat", required = false) Integer cat) {
		String id;
		try {
			id = (String)session.getAttribute("user_id");
			id.isEmpty();
		} catch (NullPointerException e) {
			return "login/login";
		}
		String user_id = id;
		if(cat == null ) {
		myPageService.purchaseList(user_id, model);
		}else {
		myPageService.purchaseListByCat(user_id, model , cat);
		}
		return "myPage/purchaseList";
	}
	
	//구매리스트 환불신청
	@RequestMapping("/purchaseRefundAction")
	public @ResponseBody String purchaseRefundAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskRefund")String ask) {
		String result = myPageService.changeStatement(purchase_idx,ask);
		return result;
	}
	
	//구매리스트 교환신청
	@RequestMapping("/purchaseChangeAction")
	public @ResponseBody String purchaseChangeAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskChange")String ask) {
		String result = myPageService.changeStatement(purchase_idx, ask);
		return result;
	}
	
	//구매리스트 취소신청
	@RequestMapping("/purchaseCancleAction")
	public @ResponseBody String purchaseCancleAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskCancle") String ask) {
		String result = myPageService.changeStatement(purchase_idx, ask);
		return result;
		
	}
	
	//리뷰작성화면
	@RequestMapping("/reviewpopup")
	public String reviewpopup(HttpServletRequest request,Model model) {
		
		try {
			String id = (String)session.getAttribute("user_id");
			id.isEmpty();
		} catch (NullPointerException e) {
			return "login/login";
		}
		String goods_idx = request.getParameter("goods_idx");
		model.addAttribute("goods_idx",goods_idx);
		return "myPage/reviewpopup";
	}
	
	
	//리뷰등록
	@PostMapping("reviewWriteAction")
	public @ResponseBody String reviewWriteAction(@RequestBody Review review) {
		String result = myPageService.insertReview(review);
		return result;
	}
	//리뷰 이미지 등록
	@PostMapping("uploadReviewImgAction")
	public @ResponseBody String reviewImgUpload(@RequestParam("reviewFile") MultipartFile MultipartFile,
												@RequestParam("review_idx")String idx) throws UnsupportedEncodingException {
		int review_idx = Integer.parseInt(idx);
		String review_img = fileService.fileUploader("reviews", MultipartFile);
		System.out.println(review_img);
		ReviewIMGS reviewImg = ReviewIMGS.builder().review_idx(review_idx).review_img(review_img).build();
		int result = reviewImgsDAO.insertReviewImg(reviewImg);
		
		return "<script>alert('리뷰등록 성공'); location.href='/main'; </script> ";
	}
	
	
}
