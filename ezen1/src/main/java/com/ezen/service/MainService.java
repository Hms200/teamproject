package com.ezen.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.InoticeDAO;
import com.ezen.dto.Notice;

@Service
public class MainService {

	@Autowired
	Notice notice;
	
	@Autowired
	InoticeDAO noticeDAO;
	
	// main화면용 공지사항 조회
	public Model noticeForMain(Model model) {
		ArrayList<Notice> noticeForMain = noticeDAO.getNoticeForMain();
		model.addAttribute(noticeForMain);
		return model;
	}
	
}
