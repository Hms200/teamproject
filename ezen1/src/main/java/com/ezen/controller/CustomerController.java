package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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

import com.ezen.dao.IfaqDAO;
import com.ezen.dao.IonetooneDAO;
import com.ezen.dto.FaQ;
import com.ezen.dto.OneToOne;
import com.ezen.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("customer")
@Slf4j
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	IonetooneDAO onetooneDao;
	
	//고객센터 이동시 FAQ로 리다이렉트
	//("customer")로 매핑시 ("customer/faq")로 처리 해줌
	@RequestMapping("")
	public String customer() {
		return "redirect:customer/faq";
	}
	
	//자주묻는질문(FAQ List)
	//IfaqDAO.getFaqList등록된 모든 데이터를 가져옴
	@RequestMapping("faq")
	public String faq(Model model, HttpServletRequest request) {
		
		ArrayList<FaQ> getFaqList = faqDao.getFaqList();
		model.addAttribute("getFaqList", getFaqList);
		
		return "customer/faq";
	}
	
	//FAQ List 카테고리 선택
	//("faqCatAction") faq_cat을 파라미터로 받아 CustomerService.byFaqCat으로 넘겨준 뒤 리턴된 ArrayList<Model>을 페이지로 넘김
	@GetMapping("faqCatAction")
	public String faqCatAction(@RequestParam String faq_cat, String faqcat, Model model) {
		model = customerService.faqListByFaqCat(faq_cat, faqcat, model);
		return "customer/faq";
	}
	
	//FAQ 등록
	//("faqWriteAction")에서 입력받은 내용들을 파라미터 값으로 받고 Faq로 담아 CustomerService.faqWrite로 보내준다
	@PostMapping("faqWriteAction")
	@ResponseBody
	public String faqWriteAction(@ModelAttribute FaQ Faq) {
		String result = customerService.FaqWrite(Faq);
		return result;
	}
	
	//FAQ 삭제
	//("faqDeleteAction") faq_idx를 파라미터로 받아 IfaqDAO,faqDelete로 보내준다
	@RequestMapping("faqDeleteAction")
	@ResponseBody
	public String faqDeleteAction(@RequestParam("faq_idx") String faq_idx, HttpServletRequest reuqest) {
		
		int result = faqDao.faqDeleteByFaqIdx(faq_idx);
		if(result == 1) {
			System.out.println("삭제 성공");
			return "<script>alert('삭제 성공'); location.href='/customer/faq';</script>";
		}
		else {
			System.out.println("삭제 실패");
			return "<script>alert('삭제 실패'); location.href='/customer/faq';</script>";
		}
	}
	
	//내 문의 내역(myAsk List)
	//("myAsk")로 매핑시 로그인한 사용자 user_idx를 읽어 CustomerService.byUserIdx로 넘겨준 뒤
	//리턴된 ArrayList<Model>을 페이지로 넘김, 사용자 정보가 없는 경우 login으로 리다이렉트
	@RequestMapping("myAsk")
	public String myAsk(Model model, HttpServletRequest request, HttpSession session) {
		int user_idx;
		try {
			user_idx = (int)session.getAttribute("user_idx");
		} catch (Exception e) {
			log.error("{}",e);
			return "redirect:../login/login";
		}	
		model = customerService.byUserIdx(user_idx, model, session);
		return "customer/myAsk";
	}
	
	//myAsk List 카테고리 선택
	//("myAskCatAction") onetoone_cat을 파라미터로 받아 CustomerService.onetooneByCat으로 넘겨준 뒤 리턴된 ArrayList<Model>을 페이지로 넘김
	@GetMapping("myAskCatAction")
	public String myAskCatAction(@RequestParam String onetoone_cat, String onetoonecat, Model model, HttpSession session) {
		int user_idx;
		try {
			user_idx = (int)session.getAttribute("user_idx");
		} catch (Exception e) {
			log.error("{}",e);
			return "redirect:../login/login";
		}
		model = customerService.onetooneByCat(user_idx, onetoone_cat, onetoonecat, model, session);
		return "customer/myAsk";
		}
	
	//문의하기 페이지(ask)
	//사용자 정보가 없는 경우 login으로 리다이렉트
	@RequestMapping("ask")
	public String ask(HttpSession session) {
		int user_idx;
		try {
			user_idx = (int)session.getAttribute("user_idx");
		} catch (Exception e) {
			log.error("{}",e);
			return "redirect:../login/login";
		}	
		return "customer/ask";
	}
	
	//문의하기 액션
	//("qnaQuestionAction")에서 입력받은 내용들을 파라미터 값으로 받고 Question으로 담아 CustormerService.insertOneToOne으로 보내준다
	@PostMapping("qnaQuestionAction")
	@ResponseBody
	public String qnaQuestionAction(@ModelAttribute OneToOne onetoone, HttpSession session) {
		int user_idx;
		try {
			user_idx = (int)session.getAttribute("user_idx");
		} catch (Exception e) {
			log.error("{}",e);
			return "../redirect:login/login";
		}
		String result = customerService.insertOneToOne(onetoone);
		return result;
	}
}

