package com.ezen.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dto.Goods;
import com.ezen.dto.Question;
import com.ezen.dto.Review;
import com.ezen.service.GoodsListService;

@Controller
@RequestMapping("goodsList")
public class GoodsListController {

	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	GoodsListService goodsListService;
    //전체상품 페이지
	@RequestMapping("/goodsList")
	public String goodsList(Model model) {
		ArrayList<Goods> list = goodsDAO.getAllGoodsList();
		model.addAttribute("list",list);
		return "goodsList/goodsList";
	}
    //상품 상세 페이지
	@RequestMapping("/goodsDetail")
	public String goodsDetail(@RequestParam("goods_idx")int goods_idx,
							  Model model) {
		
		Goods goods = goodsDAO.getGoodsInfo(goods_idx);
		String name = goods.getGoods_name();
		String thumb = goods.getGoods_thumb();
		String detail = goods.getGoods_detail();
		int price = goods.getGoods_price();
		ArrayList<Review> reviewList = goodsDAO.getGoodsReview(goods_idx);
		model.addAttribute("name",name);
		model.addAttribute("thumb",thumb);
		model.addAttribute("price", price);
		model.addAttribute("detail", detail);
		model.addAttribute("reviewList", reviewList);
		return "goodsList/goodsDetail";
	}
	@RequestMapping("/productQnaWriteAction")
	public String productQnaWriteAction(Question question) {
		
		
		return"";
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
