package com.ezen.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IcartDAO;
import com.ezen.dao.IcartListDAO;
import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.IgoodsOptionDAO;
import com.ezen.dao.IpurchaseDAO;
import com.ezen.dto.Cart;
import com.ezen.dto.Goods;
import com.ezen.dto.GoodsIMGS;
import com.ezen.dto.GoodsOption;
import com.ezen.dto.Review;

@Service
public class GoodsListService {
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	IgoodsIMGSDAO goodsIMGDAO;
	
	@Autowired
	IgoodsOptionDAO goodsOptionDAO;
	
	@Autowired
	IcartDAO cartDAO;
	
	@Autowired
	IcartListDAO cartListDAO;
	
	@Autowired
	IpurchaseDAO purchaseDAO;
	
	@Autowired
	Pagenation pagenation;
	
	// 전체상품 페이지
	public Model goodsList(Model model) {
		ArrayList<Goods> list = goodsDAO.getAllGoodsList();
		model.addAttribute("list", list);
		return model;
	}
	
	// 상품 상세페이지
	public Model goodsDetail(int goods_idx, Model model) {
		Goods goods = goodsDAO.getGoodsInfo(goods_idx);
		ArrayList<Review> reviewList = goodsDAO.getGoodsReview(goods_idx);
		ArrayList<String> goodsImgs = goodsIMGDAO.getGoodsImgs(goods_idx);
		ArrayList<GoodsOption> goodsOptions = goodsOptionDAO.getGoodsOptions();
		model.addAttribute("goods", goods);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("goodsImgs", goodsImgs);
		model.addAttribute("goodsOptions", goodsOptions);
		return model;
	}
	
	// 카트에 상품담기
	public String addGoodsInCart(Cart cart) {
		
		int result = cartDAO.insertCart(cart);
		String resultString;
		if(result == 0) {
			resultString = "false";
		}else if(result == 1) {
			resultString = "true";
		}else {
			resultString = "false";
		}
		return resultString;
	}

}
