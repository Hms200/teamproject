package com.ezen.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	
	//FAQ List 카테고리 선택
	//faqList가 리턴한 Model 배열을 전체순환하면서 faq_cat가 파라미터로 넘겨받은 faq_cat와 일치하는 Model만 골라내 새로운 ArrayList로 만들어 리턴
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
	//넘겨받은 Faq에 담긴 데이터를 확인해서 IfaqDAO.faqWrtie을 통해 DB에 insert
	public String FaqWrite(FaQ Faq) {
		
		int result = faqDao.FaqWrite(Faq);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/faq'</script>";
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/faq'</script>";
		}
		return returnString;
	}
	
	//내 문의 내역 (myAsk List)
	//allOneToOne가 리턴한 Model 배열을 전체순환하면서 user_idx가 파라미터로 넘겨받은 user_idx와 일치하는 Model만 골라내 새로운 ArrayList로 만들어 리턴
	public Model byUserIdx(int user_idx, Model model, HttpSession session) {
		ArrayList<OneToOne> allOneToOne = onetooneDao.getOneToOneList();
		ArrayList<OneToOne> myOneToOne = new ArrayList<>();
			allOneToOne.forEach(OnetoOne -> {
				if(OnetoOne.getUser_idx() == user_idx) {
					myOneToOne.add(OnetoOne);
				}
			});
		model.addAttribute("getOneToOneList", myOneToOne);
		return model;
	}
	  
	//myAsk List 카테고리 선택
	////myOneToOne가 리턴한 Model 배열을 전체순환하면서 faq_cat가 파라미터로 넘겨받은 faq_cat와 일치하는 Model만 골라내 새로운 ArrayList로 만들어 리턴
	public Model onetooneByCat(int user_idx, String onetoone_cat, Model model, HttpSession session) {
		ArrayList<OneToOne> myOneToOne = onetooneDao.getOnetoOneByUserIdx(user_idx);
		ArrayList<OneToOne> oneToOneByCat = new ArrayList<>();
		if(onetoone_cat.equals("상품문의")) {
			myOneToOne.forEach(OnetoOne -> {
				if(OnetoOne.getOnetoone_cat().equals(onetoone_cat)) {
					oneToOneByCat.add(OnetoOne);
				}
			});
		}else if(onetoone_cat.equals("배송문의")) {
			myOneToOne.forEach(OnetoOne -> {
				if(OnetoOne.getOnetoone_cat().equals(onetoone_cat)) {
					oneToOneByCat.add(OnetoOne);
				}
			});
		}else if(onetoone_cat.equals("결제문의")) {
			myOneToOne.forEach(OnetoOne -> {
				if(OnetoOne.getOnetoone_cat().equals(onetoone_cat)) {
					oneToOneByCat.add(OnetoOne);
				}
			});
		}
		model.addAttribute("getOneToOneList", oneToOneByCat);
		return model;
	}
	
	//onetoone 작성(문의하기)
	//넘겨받은 Question에 담긴 데이터를 확인해서 IonetooneDAO.insertOneToOne을 통해 DB에 insert
	public String insertOneToOne(OneToOne onetoone) {
		
		int result = onetooneDao.insertOneToOne(onetoone);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/faq'</script>";
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/faq'</script>";
		}
		return returnString;
	}
	
}
