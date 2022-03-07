package com.ezen.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.ognl.ASTSubtract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IfaqDAO;
import com.ezen.dao.IonetooneDAO;
import com.ezen.dto.FaQ;

@Service
public class CustomerService {
	
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	IonetooneDAO onetooneDao;
	
	//FAQ카테고리 선택
	
	//FAQ작성
	public int FaqWrite(String faq_title, String faq_contents, String faq_cat) {
		
		int result = faqDao.FaqWrite(faq_title, faq_contents, faq_cat);
		return result;
	}
	
	//onetoone작성
	public int insertOneToOne(String onetoone_title, String onetoone_cat, String onetoone_contents) {
		
		int result = onetooneDao.insertOneToOne(onetoone_title, onetoone_cat, onetoone_contents);
		return result;
	}
	
}
