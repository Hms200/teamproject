package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IfaqDAO;
import com.ezen.dao.IonetooneDAO;
import com.ezen.dao.IquestionDAO;
import com.ezen.dto.FaQ;
import com.ezen.dto.OneToOne;
import com.ezen.dto.Question;
import com.ezen.service.CustomerService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	IonetooneDAO onetooneDao;
	
	//고객센터 이동시 FAQ로 리다이렉트
	@RequestMapping("")
	public String customer() {
		return "redirect:customer/faq";
	}
	
	//자주묻는질문(FAQ List)
	@RequestMapping("faq")
	public String faq(Model model, HttpServletRequest request) {
		
		ArrayList<FaQ> getFaqList = faqDao.getFaqList();
		model.addAttribute("getFaqList", getFaqList);
		
		return "customer/faq";
	}
	
	//FAQ 카테고리 선택
	
	//FAQ등록
	@RequestMapping("faqWriteAction")
	@ResponseBody
	public String faqWriteAction(@RequestParam("faq_title") String faq_title,
								  @RequestParam("faq_contents") String faq_contents,
								  @RequestParam("faq_cat") String faq_cat,
								  HttpServletRequest request, Model model) {
		
		int result = customerService.FaqWrite(faq_title, faq_contents, faq_cat);
		if(result == 1) {
			return "<script>alert('작성 성공'); location.href='/customer/faq';</script>";
		}
		else {
			return "<script>alert('작성 실패');</script>";
		}
	}
	
	//FAQ 삭제
	@RequestMapping("deleteAction")
	@ResponseBody
	public String faqDeleteAction(@RequestParam("faq_idx") String faq_idx, HttpServletRequest reuqest) {
		
		int result = faqDao.faqDeleteByFaqIdx(faq_idx);
		if(result == 1) {
			return "<script>alert('삭제 성공'); location.href='/customer/faq';</script>";
		}
		else {
			return "<script>alert('삭제 실패'); location.href='/customer/faq';</script>";
		}
	}
	
	//내문의내역(myAsk)
	@RequestMapping("/myAsk")
	public String myAsk(Model model, HttpServletRequest request) {
		
		ArrayList<OneToOne> getOneToOneList = onetooneDao.getOneToOneList();
		model.addAttribute("getOneToOneList", getOneToOneList);
		
		System.out.println(getOneToOneList);
		return "customer/myAsk";
	}
	
	//내문의내역 카테고리 선택
	
	//문의하기 페이지(ask)
	@RequestMapping("ask")
	public String ask() {
		return "customer/ask";
	}
	
	//문의하기 액션
	@RequestMapping("qnaQuestionAction")
	public String qnaQuestionAction(@RequestParam("onetoone_title") String onetoone_title,
								     @RequestParam("onetoone_cat") String onetoone_cat,
								     @RequestParam("onetoone_contents") String onetoone_contents
								     ) {
		int result = customerService.insertOneToOne(onetoone_title, onetoone_cat, onetoone_contents);
		if(result == 1) {
			return "<script>alert('작성 성공'); location.href='/customer';</script>";
		}
		else {
			return "<script>alert('작성 실패');</script>";
		}
	}
}

