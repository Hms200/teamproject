package com.ezen.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;

@Service
public class AdminService {

	@Autowired
	IuserDAO userDAO;
	
	// MemberList filter
	public Model MemberListBySearch(String searchText, Model model) {
		ArrayList<User> userList = userDAO.searchUserById("%"+searchText+"%");
		model.addAttribute("userlist", userList);
		return model;
		
	}
	
}
