package com.ezen.controller;




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
		return main(currentPage, model);
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
