package com.ezen.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.InoticeDAO;
import com.ezen.dto.Goods;
import com.ezen.dto.Notice;

@Service
public class MainService {

	@Autowired
	Notice notice;
	
	@Autowired
	InoticeDAO noticeDAO;
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	@Autowired
	IgoodsIMGSDAO goodsIMGSDAO;
	
	@Autowired
	Pagenation pagenation;
	
	// main화면용 공지사항 조회
	public Model noticeForMain(Model model) {
		ArrayList<Notice> noticeForMain = noticeDAO.getNoticeForMain();
		model.addAttribute(noticeForMain);
		return model;
	}
	
	// main 검색창
	public Model goodsSearch(String searchtext, Model model) {
		// 검색된 상품리스트
		ArrayList<Goods> goodsListForMainSearch = goodsDAO.getGoodsListBySearch(searchtext);
		
		model.addAttribute("searched",goodsListForMainSearch);
		model.addAttribute("searchResult", 1);
		return model;
	}
	
	// entireItem card
	public Model entireItemCardData(String currentPage, Model model) {
		//전체 상품 갯수
		int countOfGoods = goodsDAO.countOfGoods();
		int numberOfGoodsOnCard = 8;
		int numberOfPagenation = 5;
		
		pagenation = pagenation.pagenation(currentPage, countOfGoods, numberOfGoodsOnCard, numberOfPagenation);

		ArrayList<Goods> goods = goodsDAO.getGoodsList(pagenation.getStartNumOfRow(), pagenation.getEndNumOfRow());
		
		model.addAttribute("goodsList", goods );
		model.addAttribute("pagenation", pagenation);
		return model;
	}
}
