package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dto.Cart;
import com.ezen.dto.Question;
import com.ezen.service.GoodsListService;

@Controller
@RequestMapping("goodsList")
public class GoodsListController {

	@Autowired
	GoodsListService goodsListService;
	
	@Autowired
	HttpSession session;
	
    //전체상품 페이지
	@RequestMapping("/goodsList")
	public String goodsList(Model model) {
		model = goodsListService.goodsList(model);
		return "goodsList/goodsList";
	}
	
	////////////////////////
    //상품 상세 페이지
	///////////////////////
	@RequestMapping("/goodsDetail")
	public String goodsDetail(@RequestParam("goods_idx")int goods_idx,
							  Model model) {
		model = goodsListService.goodsDetail(goods_idx, model);
		return "goodsList/goodsDetail";
	}
	// 상품문의 작성
	@RequestMapping("/productQnaWriteAction")
	public String productQnaWriteAction(Question question) {
		
		
		return"";
	}
	// 장바구니에 추가
	@PostMapping("toShoppingCartAction")
	@ResponseBody
	public String toShoppingCart(@RequestBody Cart cart, HttpSession session) {
		System.out.println(cart.toString());
		String result = goodsListService.addGoodsInCart(cart);
		
		int cartNum;
		try {
			cartNum = (int) session.getAttribute("cart");
		} catch (NullPointerException e) {
			cartNum = 0;
		}
		cartNum += 1;
		session.setAttribute("cart", cartNum);
		return result;
	}
	
	///////////////////////////////////
    //장바구니 페이지
	//////////////////////////////////
	@RequestMapping("/cart")
	public String cart(Model model) {
		// 로그인 되어있지 않으면 로그인페이지로 이동
		int user_idx;
		try {
			user_idx = (int) session.getAttribute("user_idx");
		} catch (NullPointerException e) {
			return "login/login";
		}
		model = goodsListService.getGoodsInCart(user_idx, model);
		return "goodsList/cart";
	}
    //구매 페이지
	@RequestMapping("/purchase")
	public String purchase() {
		return "goodsList/purchase";
	}
}
