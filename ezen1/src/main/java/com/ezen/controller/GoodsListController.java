package com.ezen.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dto.Cart;
import com.ezen.dto.Goods;
import com.ezen.dto.Question;
import com.ezen.dto.Review;
import com.ezen.service.GoodsListService;

@Controller
@RequestMapping("goodsList")
public class GoodsListController {

	@Autowired
	GoodsListService goodsListService;
	
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
	
    //장바구니 페이지
	@RequestMapping("/cart")
	public String cart() {
		return "goodsList/cart";
	}
    //구매 페이지
	@RequestMapping("/purchase")
	public String purchase() {
		return "goodsList/purchase";
	}
}
