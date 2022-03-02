package com.ezen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.IfaqDAO;
import com.ezen.dto.FaQ;

@Service
public class CustomerService {
	
	@Autowired
	IfaqDAO faqDao;
	

	
}
