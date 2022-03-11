package com.ezen.service;

import java.util.ArrayList;

import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IfaqDAO;
import com.ezen.dao.IonetooneDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.FaQ;
import com.ezen.dto.OneToOne;

@Service
public class CustomerService {
	
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	IonetooneDAO onetooneDao;
	@Autowired
	IuserDAO userDao;
	
	//FAQ카테고리 선택
	public Model faqListByFaqCat(String faq_cat, Model model) {
		ArrayList<FaQ> allFaqList = faqDao.getFaqList();
		ArrayList<FaQ> faqListByCat = new ArrayList<>();
		if(faq_cat.equals("상품문의")) {
			allFaqList.forEach(FaQ -> {
				if(FaQ.getFaq_cat().equals(faq_cat)) {
					faqListByCat.add(FaQ);
				}
			});
		}else if (faq_cat.equals("배송문의")) {
			allFaqList.forEach(FaQ -> {
				if(FaQ.getFaq_cat().equals(faq_cat)) {
					faqListByCat.add(FaQ);
				}
			});
		}else if (faq_cat.equals("결제문의")) {
			allFaqList.forEach(FaQ -> {
				if(FaQ.getFaq_cat().equals(faq_cat)) {
					faqListByCat.add(FaQ);
				}
			});
		}
		model.addAttribute("getFaqList", faqListByCat);
		return model;
	}
	
	//FAQ작성
	public String FaqWrite(FaQ Faq) {
		
		int result = faqDao.FaqWrite(Faq);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/faq'</script>";
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/faq'</script>";
		}
		return returnString;
	}
	
	//내문의내역
	/*
	 * public ArrayList<Model> byUserIdx(int user_idx, Model model) {
	 * 
	 * }
	 */
		
	
	//내문의내역 카테고리 선택
	
	
	//onetoone작성
	public String insertOneToOne(OneToOne onetoone) {
		
		int result = onetooneDao.insertOneToOne(onetoone);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/faq'</script>";
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/faq'</script>";
		}
		return returnString;
	}
	
}
