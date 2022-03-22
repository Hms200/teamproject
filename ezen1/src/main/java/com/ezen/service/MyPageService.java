package com.ezen.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IcartDAO;
import com.ezen.dao.IcartListDAO;
import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IpurchaseDAO;
import com.ezen.dao.IreviewDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Cart;
import com.ezen.dto.Review;
import com.ezen.dto.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyPageService {

	@Autowired
	IreviewDAO reviewDAO;
	@Autowired
	IuserDAO userDAO;
	@Autowired
	IcartDAO cartDAO;
	@Autowired
	IgoodsDAO goodsDAO;
	@Autowired
	IcartListDAO cartListDAO;
	@Autowired
	IpurchaseDAO purchaseDAO;
	//입력받은 정보로 회원정보 변경
	public String updateUserInfo(User user) {
		int result = userDAO.UpdateMemberInfo(user);
		log.info("{}", result);
		if(result==1) {
			return "<script>alert('회원정보가 변경되었습니다.');location.href='/main';</script>";
		}else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}
	}
	//해당 매개변수에 해당하는 purchaseList만듬
	public Model purchaseList(String user_id,Model model) {
		int user_idx = userDAO.getUserIdx(user_id);
		ArrayList<Cart> isDoneList = cartDAO.getCartIsDone(user_idx);
		ArrayList<HashMap<String, String>> purchaseList = new ArrayList<>();
		isDoneList.forEach(result ->{
			ArrayList<HashMap<String, String>> map = purchaseDAO.getpurchaseArrayList(result.getUser_idx(), result.getCart_list_idx(), result.getGoods_idx());
			purchaseList.addAll(map);
		});
		model.addAttribute("purchaseList",purchaseList);
		return model;
	}
	//넘어온 ask에 따라 현재상태를 변경해줌
	public String changeStatement(int purchase_idx, String ask) {
		String result = null;
		switch (ask) {
		case "환불신청":
			purchaseDAO.updatePurchaseStatementByMyPage(purchase_idx, ask);
			result=  "<script>alert('환불신청이 완료되었습니다.'); location.href='/myPage/myPage'; </script>";
			break;
		case "교환신청":
			purchaseDAO.updatePurchaseStatementByMyPage(purchase_idx, ask);
			result=  "<script>alert('교환신청이 완료되었습니다.'); location.href='/myPage/myPage'; </script>";
			break;
		case "취소신청":
			purchaseDAO.updatePurchaseStatementByMyPage(purchase_idx, ask);
			result=  "<script>alert('취소신청이 완료되었습니다.'); location.href='/myPage/myPage'; </script>";
			break;
		}
		return result;
	}
	//cat별로 위에 purchaseList 에서 현재상태가 해당되는것만 가져옴
	public Model purchaseListByCat(String user_id, Model model, Integer cat) {
		int user_idx = userDAO.getUserIdx(user_id);
		String str = null;
		switch (cat) {
		case 1: str = "주문접수";
			break;
		case 2: str = "상품배송중";
			break;
		case 3: str = "배송준비중";
			break;
		case 4: str = "배송중";
			break;
		case 5: str = "배송완료";
			break;
		case 6: str = "환불신청";
			break;
		case 7: str = "교환신청";
			break;
		case 8: str = "반품접수중";
			break;
		}
		String search = str.toString();
		
		ArrayList<HashMap<String, String>> catList = purchaseDAO.getCartIsDoneAndByCat(user_idx,search);
		model.addAttribute("purchaseList",catList);
		
		return model;
		
	}
	//리뷰등록,최근에 등록된 리뷰idx가져옴
	public String insertReview(Review review) {
		int result = reviewDAO.insertReview(review);
		String resultString;
		if(result==1) {
			int idx = reviewDAO.getNewestReviewIdx();
			resultString = String.valueOf(idx);
			return resultString;
		}else {
			resultString = "false";
			return resultString;
		}
	}
}
