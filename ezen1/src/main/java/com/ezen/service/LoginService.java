package com.ezen.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ezen.dao.IuserDAO;


@Service
public class LoginService {


	@Autowired
	IuserDAO userDao;
	
	//로그인
	public String login(String user_id, String user_pw, HttpSession session) {
		
		System.out.println("user_id:"+user_id);
		System.out.println("user_pw:"+user_pw);
			
		String result = "<script>alert('로그인 실패!'); history.back(-1);</script>";
			
		// 입력한 id가 있는지 조회
		String userID = userDao.getUserID(user_id);
		// 없으면 로그인 실패 로그인페이지 로딩
		if(userID == null) {
			return result;
		}
		// 있으면 해당ID의 비밀번호 조회
		String userPw = userDao.getUserPw(user_id);
		// 입력한 id의 비밀번호와 DB의 비밀번호가 같은지 대조
		if(user_pw.equals(userPw)) {
				
			//유저 idx 불러오기 성공.
			int user_idx = userDao.getUserIdx(user_id);
			System.out.println("user_idx:"+user_idx);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_idx", user_idx);	
				
			result = "<script>alert('로그인 성공!'); location.href='/main';</script>";
			return result;
		}
		return result;									
	}

	public String findId( String user_name, String user_email) {
		
		String result;
		String user_id = userDao.getUserIdByFindId(user_name, user_email);
		System.out.println("user_id:"+user_id);
		if( user_id == null ) {
			result = "<script>alert('아이디를 찾을 수 없습니다.'); history.back(-1);</script>";
			
		} else {
			result = "<script>alert('고객님의 아이디는" + user_id + " 입니다.'); location.href='login';</script>";;
		}
		return result;	
	}
	
	public String findPW( String user_id, String user_name, String user_email) {
		
		String result;
		String user_pw = userDao.getUserPwByFindPw( user_id, user_name, user_email);
		System.out.println("user_pw:"+user_pw);
		if( user_pw == null ) {
			result = "<script>alert('비밀번호를 찾을 수 없습니다.'); history.back(-1);</script>";
			
		} else {
			result = "<script>alert('고객님의 비밀번호는 " + user_pw + " 입니다.'); location.href='login';</script>";;
		}
		return result;	
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
