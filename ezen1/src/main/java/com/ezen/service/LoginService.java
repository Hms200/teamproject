package com.ezen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.ui.Model;
import com.ezen.dao.IuserDAO;


@Service
public class LoginService {


	@Autowired
	IuserDAO userDao;
	
	public Model login(String user_id, String user_pw, Model model) {
		
		System.out.println("user_id:"+user_id);
		System.out.println("user_pw:"+user_pw);
		
		// 입력한 id가 있는지 조회
		String userID = userDao.getUserID(user_id);
		// 없으면 로그인 실패 로그인페이지 로딩
		if(userID == null) {
			return null;
		}
		// 있으면 해당ID의 비밀번호 조회
		String userPw = userDao.getUserPw(user_id);
		// 입력한 id의 비밀번호와 DB의 비밀번호가 같은지 대조
		if(user_pw.equals(userPw)) {
			
			//유저 idx 불러오기 성공.s
			//int user_idx = userDao.getUserIdx(user_id);
			//String user_idx = userDao.getUserID(user_id);
			//System.out.println("user_idx:"+user_idx);			
			//model.addAttribute("user_idx", user_idx);			
			//result = "<script>alert('로그인되었습니다.'); location.href='test';</script>";
			model.addAttribute("user_id", user_id);
			return model;
		}
		return null;
		
		
	}

	//아이디 중복확인 구동
	public int idCheckAjax( String user_id ) {
		
		int result;	
		String userID = userDao.getUserID( user_id );
		if( userID == null ) {
			result = 0;
			System.out.println("사용가능한 아이디");						
		} else {
			result = 1;
		}		
		return result;
		
	}
	
	public int join( String user_id, String user_pw, String user_name, String user_phone, String user_address, String user_email) {
		
		int result= userDao.insertUser(user_id,  user_pw,  user_name,  user_phone,  user_address,  user_email);
		System.out.println("result:"+result);
		return result;
	}

}
