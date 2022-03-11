package com.ezen.service;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Goods;
import com.ezen.dto.User;

@Service
public class AdminService {

	@Autowired
	IuserDAO userDAO;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	IgoodsIMGSDAO goodsImgDAO;
	
	@Autowired
	Pagenation pagenation;
	
	// MemberList filter
	public Model MemberListBySearch(String searchText, Model model) {
		ArrayList<User> userList = userDAO.searchUserById("%"+searchText+"%");
		model.addAttribute("userlist", userList);
		return model;
		
	}
	
	// goods page 상품등록	
	public String insertGoods(Goods goods) {
		
		int result = goodsDAO.insertGoods(goods);
		String resultString;
		if(result == 1) {
			int idx = goodsDAO.getNewestGoodsIdx();
			resultString = String.valueOf(idx);
			System.out.println(resultString);
			return resultString;
		}else {
			resultString = "false";
			return resultString;
		}
	}
	
	// stock page
	public Model getGoodsList(String currentPage, Model model) {
		// pagenation 설정
		int countOfGoods = goodsDAO.countOfGoods();
		int numberOfGoodsOnCard = 8;
		int numberOfPagenation = 5;
		
		pagenation = pagenation.pagenation(currentPage, countOfGoods, numberOfGoodsOnCard, numberOfPagenation);
		
		ArrayList<Goods> goodsList = goodsDAO.getGoodsList(pagenation.getStartNumOfRow(), pagenation.getEndNumOfRow());
		model.addAttribute("goodslist", goodsList);
		model.addAttribute("page", pagenation);
		return model;
	}
	// stock page& eventConfig 상단 검색
	public Model stockSearch(String searchText, String search_cat, Model model) {
		if(search_cat.equals("goods_name")) {
			ArrayList<Goods> goodsList = goodsDAO.getGoodsListBySearch(searchText);
			model.addAttribute("goodslist", goodsList);
			return model;
		}else {
			ArrayList<Goods> allGoodsList = goodsDAO.getAllGoodsList();
			ArrayList<Goods> goodsList = new ArrayList<>();
			if(search_cat.equals("goods_onsale=1")) {
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_onsale() == 1) {
						goodsList.add(goods);
					}
				});
			}else if(search_cat.equals("goods_onsale=0")) {
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_onsale() == 0) {
						goodsList.add(goods);
					}
				});
			}else if(search_cat.equals("goods_cat")) {
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_cat().equals(searchText)) {
						goodsList.add(goods);
					}
				});
			}else if(search_cat.equals("goods_onevent")) {
				int eventCode;
				if(searchText.contains("할인")){
					eventCode = 1;
				}else if(searchText.contains("추천")) {
					eventCode = 2;
				}else if(searchText.contains("이벤트") || searchText.contains("event")) {
					eventCode = 3;
				}else {
					eventCode = 0;
				}
				allGoodsList.forEach(goods -> {
					if(goods.getGoods_onevent() == eventCode) {
						goodsList.add(goods);
					}
				});
			}
			model.addAttribute("goodslist", goodsList);
			return model;
		}
	  	 
	}
	// stock 품절처리
	public void makeGoodsSoldOut(HashMap<String, Boolean> list) {
		list.forEach((k,v) -> { 
			if(v == true) {
				int result = goodsDAO.updateGoodsStockSoldOut(Integer.parseInt(k));
				System.out.println(result);
				}
		});
	}
	// stock 상품 삭제
	public void deleteGoodsOnDB(HashMap<String, String> list) {
		list.forEach((k,v) -> {
			if(v.equals("on")) {
				int result = goodsDAO.deleteGoods(Integer.parseInt(k));
				System.out.println("goods_idx : " + k +" : result - " + String.valueOf(result));
			}
		});
	}
	// stock 상품 발주 = amount에 추가 + onsale 1로 변경
	public void orderGoods(HashMap<String, String> list) {
		int amount = Integer.parseInt(list.get("amount"));
		System.out.println(amount);
		list.remove("amount");
		list.forEach((k,v) -> {
			if(v.equals("true")) {
				goodsDAO.updateGoodsStockOrder(Integer.parseInt(k), amount);
				goodsDAO.updateGoodsStockOnSale(Integer.parseInt(k));
			}
		});
	}
	
	// eventConfig 할인상품등록
	public void registerEventDiscount(HashMap<String, String> list) {
		
		list.forEach((k,v) ->{
			if(v.equals("on")) {
				goodsDAO.updateEvent(Integer.parseInt(k), 1);
			}
		});
	}
	
	// eventConfig 이벤트진행중 상품등록
	public void registerEventEvent(HashMap<String, String> list) {
		list.forEach((k,v) -> {
			if(v.equals("on")) {
				goodsDAO.updateEvent(Integer.parseInt(k), 3);
			}
		});
	}
	// eventConfig 추천상품 등록
	public void registerEventRecommend(HashMap<String, String> list) {
		list.forEach((k,v) -> {
			if(v.equals("on")) {
				goodsDAO.updateEvent(Integer.parseInt(k), 2);
			}
		});
	}
	
}
