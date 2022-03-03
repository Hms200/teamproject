package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IfaqDAO;
import com.ezen.dto.FaQ;
import com.ezen.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private IfaqDAO faqDao;
	
	//자주묻는질문(FAQ)
	@RequestMapping("/customer")
	public String faq(Model model, HttpServletRequest request) {
		
		List<FaQ> getFaqList = faqDao.getFaqList();
		model.addAttribute("getFaqList", getFaqList);
		
		return "customer/faq";
	}
	
	public String getFaqListByCat(@RequestParam(value="faq_cat", required = false) String faq_cat,
								   HttpServletRequest request, Model model) {
		
		List<FaQ> getFaqListByCat = null;
		
		if()
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
