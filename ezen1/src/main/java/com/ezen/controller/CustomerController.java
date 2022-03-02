package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
//	FAQ 전체 리스트
	@RequestMapping("/customer")
	public String faq( Model model, HttpServletRequest request) {
		List<FaQ> list = faqDao.getFaqList();
		model.addAttribute("list", list);
		model.addAttribute("customer", "customer/faq.jsp");
		
		System.out.println(list);
		
		return "customer/faq";
	}
	
//	FAQ 작성
	@RequestMapping("faqWriteAction")
	@ResponseBody
	public String faqWriteAction(@RequestBody FaQ FaQ) {
	
		int result = customerService.FaqWrite(FaQ);
	
		if( result == 1) {
			return "<script>alert('작성 성공'); location.href='/customer/faq';</script>";
		}
		else {
			return "<script>alert('작성 실패'); history.back(-1);</script>";
		}
	}


}
