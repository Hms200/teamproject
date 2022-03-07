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
	
	//FAQ작성
	public int faqWrite(String faq_title, String faq_contents, String faq_cat) {
		
		int result = faqDao.FaqWrite(faq_title, faq_contents, faq_cat);
		return result;
	}
	
	
}
