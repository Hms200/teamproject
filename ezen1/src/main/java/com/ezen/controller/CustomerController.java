package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.dao.IfaqDAO;
import com.ezen.dto.FaQ;
import com.ezen.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	IfaqDAO faqDao;
	
	//고객센터 이동시 FAQ로 리다이렉트
	@RequestMapping("/customer")
	public String customer() {
		return "redirect:/customer/faq";
	}
	
	//자주묻는질문(FAQ List)
	@RequestMapping("/customer/faq")
	public String faq(Model model, HttpServletRequest request) {
		
		ArrayList<FaQ> getFaqList = faqDao.getFaqList();
		model.addAttribute("getFaqList", getFaqList);
		
		System.out.println(getFaqList);
		
		return "customer/faq";
	}
	
	//FAQ 카테고리 선택
	@RequestMapping("faqCatAction")
	public String faqCatAction(@RequestParam(value="faq_cat", required=false) String faq_cat,
								   HttpServletRequest request, Model model) {
		
		System.out.println(faq_cat);
		
		ArrayList<FaQ> getFaqList = null;
		
		if(StringUtils.hasText(faq_cat)) {
			getFaqList = customerService.faqListByFaqCat(faq_cat);
		}
		
		model.addAttribute("getFaqList", getFaqList);
		
		return "/customer/faq";
	}
	
	//FAQ등록
	@RequestMapping("faqWriteAction")
	public String faqWriteAction(@RequestBody FaQ faQ) {
		
		int result = faqDao.FaqWrite(faQ);
		if(result == 1) {
			return "<script>alert('작성 성공'); location.href='/customer/faq';</script>";
		}
		else {
			return "<script>alert('작성 실패');</script>";
		}
	}
	
	//내문의내역(myAsk)
	@RequestMapping("/customer/myAsk")
	public String myAsk() {
		return "customer/myAsk";
	}
	
	//문의하기(ask)
	@RequestMapping("/customer/ask")
	public String ask() {
		return "customer/ask";
	}
	


}
