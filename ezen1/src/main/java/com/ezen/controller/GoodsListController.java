package com.ezen.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dto.Cart;
import com.ezen.dto.Purchase;
import com.ezen.dto.Question;
import com.ezen.service.GoodsListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("goodsList")
public class GoodsListController {

	@Autowired
	GoodsListService goodsListService;
	
	@Autowired
	HttpSession session;
	
	////////////////////////
    //전체상품 페이지
	////////////////////////
	@RequestMapping("goodsList")
	public String goodsList(Model model) {
		model = goodsListService.goodsList(model);
		return "goodsList/goodsList";
	}
	
	////////////////////////
    //상품 상세 페이지
	///////////////////////
	@RequestMapping("goodsDetail")
	public String goodsDetail(@RequestParam("goods_idx")int goods_idx,
							  Model model) {
		model = goodsListService.goodsDetail(goods_idx, model);
		return "goodsList/goodsDetail";
	}
	// 상품문의 작성
	@PostMapping("/productQnaWriteAction")
	@ResponseBody
	public String productQnaWriteAction(@ModelAttribute Question question) {
		String resultOfInsert = goodsListService.writeQna(question);
		String returnString;
		String goods_idx = String.valueOf(question.getGoods_idx());
		if(resultOfInsert.equals("true")) {
			returnString = "<script>alert('등록되었습니다.'); location.href = 'goodsDetail?goods_idx="+goods_idx+"';</script>";
		}else {
			returnString = "<script>alert('등록에 실패하였습니다. 다시 시도해주세요.'); location.href = 'goodsDetail?goods_idx="+goods_idx+"';</script>";
		}
		return returnString;
	}
	// 장바구니에 추가
	@PostMapping("toShoppingCartAction")
	@ResponseBody
	public String toShoppingCart(@RequestBody Cart cart, HttpSession session) {
		
		goodsListService.addGoodsInCart(cart);
		
		int cartNum;
		try {
			cartNum = (int) session.getAttribute("cart");
		} catch (Exception e) {
			log.error("{}",e);
			cartNum = 0;
		}
		cartNum += 1;
		session.setAttribute("cart", cartNum);
		
		return String.valueOf(cartNum); 
	}
	
	///////////////////////////////////
    //장바구니 페이지
	//////////////////////////////////
	@RequestMapping("cart")
	public String cart(Model model) {
		// 로그인 되어있지 않으면 로그인페이지로 이동
		int user_idx;
		try {
			user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
		} catch (Exception e) {
			log.error("{}",e);
			return "login/login";
		}
		if(user_idx == 0) {
			return "login/login";
		}
		model = goodsListService.getGoodsInCart(user_idx, model);
		return "goodsList/cart";
	}
	// 수량,옵션 변경
	@PostMapping("changeValueAction")
	@ResponseBody
	public void changeValue(@RequestBody HashMap<String, String> param) {
		goodsListService.changeValueOfCart(param);
	}
	// 장바구니에서 상품 삭제
	@PostMapping("removeGoodsFromCartAction")
	@ResponseBody
	public void removeGoods(@RequestBody HashMap<String, String> param) {
		goodsListService.removeGoodsFromCart(param);
	}
	// 장바구니 개별항목 리스트로 묶기 
	@PostMapping("listingGoodsAction")
	@ResponseBody
	public String listingGoods(@RequestBody HashMap<String, String> list) {
		String result = goodsListService.listingGoods(list);
		return result;
	}
	
	/////////////////////////////
    //구매 페이지
	/////////////////////////////
	@GetMapping("purchase")
	public String purchase(@RequestParam String cart_list_idx, Model model) {
		model = goodsListService.getListedGoods(Integer.parseInt(cart_list_idx), model);
		return "goodsList/purchase";
	}
	// 구매 전 비밀번호 재확인
	@PostMapping("checkPwAction")
	@ResponseBody
	public String checkPw(@RequestBody HashMap<String, String> pw) {
		String password = pw.get("inputtedPw");
		String result = goodsListService.checkPw(password);
		log.info("비밀번호 일치여부 검증결과 : {}", result);
		return result;
	}
	// 구매 프로세스 진행 완료 후 구매기록 저장 & 장바구니항목 구매됨으로 변경 & 상품 구매카운터 증가
	// 각 상품 구매 후 남은 재고 없으면 품절처리
	@PostMapping("makePurchaseAction")
	@ResponseBody
	public String makePurchase(@RequestBody Purchase purchase) {
		String returnString = goodsListService.makePurchase(purchase);
		int cart_list_idx = purchase.getCart_list_idx();
		goodsListService.makeCartIsDone(cart_list_idx);
		goodsListService.increaseCountOfPurchasedAndCheckGoodsStock(cart_list_idx);
		return returnString;
	}
	
}
