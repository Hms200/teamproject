package com.ezen.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IfaqDAO;
import com.ezen.dto.FaQ;

@Service
public class CustomerService {
	
	@Autowired
	IfaqDAO faqDao;
	
	//FAQ카테고리 선택
	public ArrayList<FaQ> faqListByFaqCat(String faq_cat) {
		
		ArrayList<FaQ> faqListByFaqCat = null;
		if(faqListByFaqCat.equals("faq_cat")) {
			faqListByFaqCat = faqDao.getFaqListByCat(faq_cat);
		}
		return faqListByFaqCat;
	}
	
	
}
