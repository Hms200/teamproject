package com.ezen.controller;




import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import com.ezen.dto.Notice;
import com.ezen.service.GoodsListService;
import com.ezen.service.MainService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
	
	
	@Autowired
	MainService mainService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	GoodsListService goodsListService;
	

	@RequestMapping("")
	public String root() {
		return "redirect:main";
	}
	 
	@RequestMapping("main")
	public String main( Model model) {
  		// 장바구니 숫자뱃지
		// session에서 로그인된 user_idx 불러옴. 비로그인이면 user_idx = 0
		
		int user_idx;
		try {
			user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
		} catch (Exception e) {
			log.error("{}",e);
			user_idx = 0;
		}
		// 뱃지 숫자 설정. 
		int cartBedgNum = 0;
		if(user_idx != 0) {
			try {
				cartBedgNum = goodsListService.getCountOfGoodsInCart(user_idx);
				session.setAttribute("cart", cartBedgNum);
				log.info("장바구니 숫자 설정됨 : {}",cartBedgNum);
			} catch (Exception e) {
				log.error("{}",e);
				return "login/login";
			}
		}
		// 메인용 공지사항
		model = mainService.noticeForMain(model);
		// 카드 표시용 데이터 
		// entireGoods card
		model = mainService.entireItemCardData( model);
		if(model.getAttribute("entireItemCardMode") == null) {
		model.addAttribute("entireItemCardMode", 0);
		}
		// bestItems card
		model = mainService.bestItemsCardDate(model);
		// MD Pick card
		model = mainService.mdPickCardData(model);
		// 이달의 할인 card
		model = mainService.monthDiscountCardData(model);
		// best review
		model = mainService.BestReviewCard(model);
		return "main";
	}
	
	@RequestMapping("aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	@RequestMapping("siteMap")
	public String siteMap() {
		return "siteMap";
	}
	
	@RequestMapping("notice")
	public String notice(@RequestParam(required = false, defaultValue = "1")String currentPage, Model model) {
		model = mainService.noticeList(currentPage, model);
		return "notice";
	}
	
	// main검색
	@GetMapping("mainsearchAction")
	public String mainSearch(@RequestParam String searchtext,@RequestParam(required = false, defaultValue = "1")String currentPage ,Model model) {
		model = mainService.goodsSearch(searchtext, model);
		return main(model);
	}
	
	// 공지사항 내용 변경
	@PostMapping("noticeUpdateAction")
	@ResponseBody
	public String noticeUpdate(@ModelAttribute Notice notice) {
		String result = mainService.noticeUpdate(notice);
		return result;
	}
	// 공지사항 작성
	@PostMapping("noticeWriteAction")
	@ResponseBody
	public String noticeWrite(@ModelAttribute Notice notice) {
		String result = mainService.noticeWrite(notice);
		return result;
	}
	// 공지사항 삭제
	@PostMapping("noticeDeleteAction")
	@ResponseBody
	public String deleteNotice(@RequestParam int notice_idx) {
		String result = mainService.deleteNotice(notice_idx);
		return result;
	}
	
	
}
