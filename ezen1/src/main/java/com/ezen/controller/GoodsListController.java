package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("goodsList")
public class GoodsListController {

//	전체상품 페이지
	@RequestMapping("/goodsList")
	public String goodsList() {
		return "goodsList/goodsList";
	}
// 	상품 상세 페이지
	@RequestMapping("/goodsDetail")
	public String goodsDetail() {
		return "goodsList/goodsDetail";
	}
//	장바구니 페이지
	@RequestMapping("/cart")
	public String cart() {
		return "goodsList/cart";
	}
//	구매 페이지
	@RequestMapping("/purchase")
	public String purchase() {
		return "goodsList/purchase";
	}
}
