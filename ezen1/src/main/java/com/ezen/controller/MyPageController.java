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

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public String memberInfo(Model model) {
		int user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
		
		User user = userDAO.getMemberInfoByUserIdx(user_idx);
		model.addAttribute("user",user);
		return "myPage/memberInfo";
	}
	
	//회원정보 업데이트action
	@PostMapping("/userUpdateAction")
	@ResponseBody
	public String userUpdateAction(User user) {
		log.info("다음 정보로 user를 업데이트 합니다. user : {}", user.toString());
		String result = myPageService.updateUserInfo(user);
		return result;
	}
	
	//마이페이지 화면보여주기
	@RequestMapping("/myPage")
	public String myPage() {
		
		return "myPage/myPage";
	}
	
	//user_id해당 구매내역 보여주기
	@RequestMapping("/purchaseList")
	public String purchaseList(Model model,
							   @RequestParam(name = "cat", required = false) Integer cat) {
		int user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));

		if(cat == null ) {
		myPageService.purchaseList(user_idx, model);
		}else {
		myPageService.purchaseListByCat(user_idx, model , cat);
		}
		return "myPage/purchaseList";
	}
	
	//구매리스트 환불신청
	@RequestMapping("/purchaseRefundAction")
	@ResponseBody
	public String purchaseRefundAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskRefund")String ask) {
		String result = myPageService.changeStatement(purchase_idx,ask);
		return result;
	}
	
	//구매리스트 교환신청
	@RequestMapping("/purchaseChangeAction")
	@ResponseBody
	public String purchaseChangeAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskChange")String ask) {
		String result = myPageService.changeStatement(purchase_idx, ask);
		return result;
	}
	
	//구매리스트 취소신청
	@RequestMapping("/purchaseCancleAction")
	@ResponseBody
	public String purchaseCancleAction(@RequestParam("purchase_idx")int purchase_idx,
									   @RequestParam("AskCancle") String ask) {
		String result = myPageService.changeStatement(purchase_idx, ask);
		return result;
		
	}
	
	//리뷰작성화면
	@RequestMapping("/reviewpopup")
	public String reviewpopup(HttpServletRequest request,Model model) {
		
		String goods_idx = request.getParameter("goods_idx");
		model.addAttribute("goods_idx",goods_idx);
		return "myPage/reviewpopup";
	}
	
	
	//리뷰등록
	@PostMapping("reviewWriteAction")
	@ResponseBody
	public String reviewWriteAction(@RequestBody Review review) {
		log.info("다음 내용으로 리뷰를 작성합니다. 내용 - {}",review.toString());
		String result = myPageService.insertReview(review);
		return result;
	}
	//리뷰 이미지 등록
	@PostMapping("uploadReviewImgAction")
	@ResponseBody
	public String reviewImgUpload(@RequestParam("reviewFile") MultipartFile MultipartFile,
												@RequestParam("review_idx")String idx) throws UnsupportedEncodingException {
		int review_idx = Integer.parseInt(idx);
		if(MultipartFile.isEmpty() ==  false) {
			String review_img = fileService.fileUploader("reviews", MultipartFile);
			log.info("다음 경로를 db에 저장합니다. - {}",review_img);
			ReviewIMGS reviewImg = ReviewIMGS.builder().review_idx(review_idx).review_img(review_img).build();
			int result = reviewImgsDAO.insertReviewImg(reviewImg);
		}else {
			return "<script>alert('리뷰파일이 잘못 지정되어 리뷰작성에 실패하였습니다.'); </script>";
		}
		return "<script>alert('리뷰등록 성공'); location.href='../goodsList/purchaseList'; </script> ";
	}
	
	
}
