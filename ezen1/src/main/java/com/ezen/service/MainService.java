package com.ezen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dto.Notice;

@Service
public class MainService {

	@Autowired
	Notice notice;
	
	
}
