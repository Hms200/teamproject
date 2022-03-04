package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.service.MainService;

@Controller
public class MainController {
	
	
	@Autowired
	MainService mainService;

	@RequestMapping("")
	public String root() {
		return "redirect:main";
	}
	
	@RequestMapping("main")
	public String main(@RequestParam(required = false, defaultValue = "1")String currentPage, Model model) {
//		int cartBedgeNum = session.getAttribute(String(cart));	
//		model.addAttribute("cartBedgeNum", cartBedgeNum);
		
		// 메인용 공지사항
		model = mainService.noticeForMain(model);
		// 카드 표시용 데이터 
		// entireGoods card
		model = mainService.entireItemCardData(currentPage, model);
		System.out.println(model.toString());
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
	public String notice() {
		return "notice";
	}
	
	// main검색
	@GetMapping("mainsearchAction")
	public String mainSearch(@RequestParam String searchtext,@RequestParam(required = false, defaultValue = "1")String currentPage ,Model model) {
		model = mainService.goodsSearch(searchtext, model);
		return main(currentPage, model);
	}
}
