package com.ezen.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.dao.IgoodsDAO;
import com.ezen.dao.IuserDAO;
import com.ezen.dto.Goods;
import com.ezen.dto.User;

@Service
public class AdminService {

	@Autowired
	IuserDAO userDAO;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	IgoodsDAO goodsDAO;
	
	// MemberList filter
	public Model MemberListBySearch(String searchText, Model model) {
		ArrayList<User> userList = userDAO.searchUserById("%"+searchText+"%");
		model.addAttribute("userlist", userList);
		return model;
		
	}
	
	// goods page 상품등록	
	public String insertGoods(Goods goods) {
		int result = goodsDAO.insertGoods(goods);
		String resultString;
		if(result == 1) {
			int idx = goodsDAO.getNewestGoodsIdx();
			resultString = String.valueOf(idx);
			System.out.println(resultString);
			return resultString;
		}else {
			resultString = "false";
			return resultString;
		}
	}

}
