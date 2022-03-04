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
	public Model filteredMemberList(int cat, String searchText, Model model) {
		ArrayList<User> userList;
		// Id로 정렬
		if(cat == 0) {
			userList = userDAO.searchUserById("%"+searchText+"%");
		}else if(cat == 1) {
			userList = 
		}
		
	}
	
}
