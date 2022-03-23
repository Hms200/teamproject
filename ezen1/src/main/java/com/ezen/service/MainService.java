package com.ezen.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IgoodsIMGSDAO;
import com.ezen.dao.InoticeDAO;
import com.ezen.dao.IreviewDAO;
import com.ezen.dao.IreviewIMGSDAO;
import com.ezen.dto.Goods;
import com.ezen.dto.Notice;
import com.ezen.dto.Review;
import com.ezen.dto.ReviewIMGS;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	@Autowired
	IreviewDAO reviewDAO;
	
	@Autowired
	IreviewIMGSDAO reviewIMGSDAO;
	
	// 공지사항 관련
	
	// main화면용 공지사항 조회
	public Model noticeForMain(Model model) {
		ArrayList<Notice> noticeForMain = noticeDAO.getNoticeForMain();
		model.addAttribute(noticeForMain);
		return model;
	}
	
	// notice 페이지용 공지사항 조회
	public Model noticeList(String currentPage, Model model) {
		int countOfArticles = noticeDAO.countOfNotice();
		int numberOfArticlesOnPage = 10;
		int numberOfPagenation = 5;
		
		pagenation = pagenation.pagenation(currentPage, countOfArticles, numberOfArticlesOnPage, numberOfPagenation);
		ArrayList<Notice> notice = noticeDAO.getNoticeLIst(pagenation.getStartNumOfRow(), pagenation.getEndNumOfRow());
		model.addAttribute("noticeList", notice);
		model.addAttribute("pages", pagenation);
		
		return model;
	}
	// 관리자용 공지사항 업데이트
	public String noticeUpdate(Notice notice) {
		int result = noticeDAO.updateNotice(notice);
		String returnString = "<script>alert('수정에 실패하였습니다.') location.href='notice'</script>";
		if(result ==1) {
			returnString = "<script>alert('수정되었습니다.'); location.href='notice'</script>";
		}
		return returnString;
	}
	// 관리자용 공지사항 작성
	public String noticeWrite(Notice notice) {
		
		int result = noticeDAO.insertNotice(notice);
		String returnString = "<script>alert('작성에 실패하였습니다.'); location.href='notice'</script>";
		if(result ==1) {
			returnString = "<script>alert('작성되었습니다.'); location.href='notice'</script>";
		}
		return returnString;
	}
	// 관리자용 공지사항 삭제
	public String deleteNotice(int notice_idx) {
		int result = noticeDAO.deleteNotice(notice_idx);
		String returnString = "<script>alert('삭제에 실패하였습니다.') location.href='notice'</script>";
		if(result ==1) {
			returnString = "<script>alert('삭제되었습니다.'); location.href='notice'</script>";
		}
		return returnString;
	}
	
	
	// main 검색창
	public Model goodsSearch(String searchtext, Model model) {
		// 검색된 상품리스트
		ArrayList<Goods> goodsListForMainSearch = goodsDAO.getGoodsListBySearch(searchtext);
		
		model.addAttribute("searched",goodsListForMainSearch);
		model.addAttribute("entireItemCardMode", 1);
		return model;
	}
	

	
	// entireItem card
	public Model entireItemCardData( Model model) {
		
		ArrayList<Goods> goods = goodsDAO.getAllGoodsList();
		
		model.addAttribute("goodsList", goods );
		
		return model;
	}
	// best item card
	public Model bestItemsCardDate(Model model) {
		ArrayList<Goods> goods = goodsDAO.getBestSellingGoods();
		model.addAttribute("best", goods);
		return model;
	}
	// Md Pick card
	public Model mdPickCardData(Model model) {
		ArrayList<Goods> goods = goodsDAO.getGoodsListByOnEvent(2);
		model.addAttribute("mdPick", goods);
		return model;
	}
	// 이달의 할인 card
	public Model monthDiscountCardData(Model model) {
		ArrayList<Goods> goods = goodsDAO.getGoodsListByOnEvent(1);
		model.addAttribute("discount", goods);
		return model;
	}
	// best review cart
	public Model BestReviewCard(Model model) {
		ArrayList<Review> reviewList = reviewDAO.getAllReviews(1, 10);
		ArrayList<ReviewIMGS> reviewImgsList = reviewIMGSDAO.getAllReviewImgs();
		HashMap<Integer, String> goodsnameList = new HashMap<>();
		reviewList.forEach(item -> {
			goodsnameList.put(item.getGoods_idx(), goodsDAO.getGoodsName(item.getGoods_idx()));
		});
		model.addAttribute("reviewlist", reviewList);
		model.addAttribute("reviewimgslist", reviewImgsList);
		model.addAttribute("goodsnamelist", goodsnameList);
		return model;
	}
}
