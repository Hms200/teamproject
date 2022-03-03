package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.IfaqDAO;
import com.ezen.dto.FaQ;

@Service
public class CustomerService {
	
	@Autowired
	IfaqDAO faqDao;
	
	public List<FaQ> getFaqListByCat(String faq_cat) {
		
		List<FaQ> getFaqListByCat = null;
		if(getFaqListByCat.equals("faq_cat")) {
			getFaqListByCat = faqDao.getFaqListByCat(faq_cat);
		}
		return getFaqListByCat;
	}
	
}
