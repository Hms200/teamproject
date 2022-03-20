package com.ezen.service;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;
import com.ezen.security.TokenProvider;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class LoginService {

	@Autowired
	IuserDAO userDao;
	
	@Autowired
	TokenProvider tokenProvider;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	DisposablePasswordGenerator passwordGenerator;
	
	
//	 로그인
//	 MALL_USER에 있는 user_id 값 조회 후 null값일 경우 js로 이전 페이지로 이동 
//	 user_id가 있을 경우 user_id과 매치되는 userPw값과 MALL_USER에 있는 userPw값 일치할 경우
//	 session에 user_id와, user_id와 매칭되는 user_idx값 저장. js로 메인페이지로 이동 
//	
//	public String login(String user_id, String user_pw, HttpServletResponse response) {
//			
//		String result = "<script>alert('로그인 실패!'); location.reload;</script>";
//		
//		String userID = userDao.getUserID(user_id);
//		if(userID == null) {
//			return result;
//		}
//
//		String userPw = userDao.getUserPw(user_id);
//		if(user_pw.equals(userPw)) {
//				
//			int user_idx = userDao.getUserIdx(user_id);
//			
//			session.setAttribute("user_id", user_id);
//			session.setAttribute("user_idx", user_idx);	
//				
//			result = "<script>alert('로그인 성공!'); location.href='/main';</script>";
//			return result;
//		}
//		return result;									
//	}

	
	//아이디찾기
	//mapper를 통해 입력받은 user_name와 user_email과 매칭되는 user_id값 조회
	//null 값일 경우 이전 페이지 이동, 값이 존재할 경우 자바스크립트 alert을 이용해 user_id 전달
	public String findId( String user_name, String user_email) {
		
		String user_id = userDao.getUserIdByFindId(user_name, user_email);
		
		if( user_id == null ) {
			return "<script>alert('아이디를 찾을 수 없습니다.'); history.back(-1);</script>";			
		} else {
			return "<script>alert('고객님의 아이디는" + user_id + " 입니다.'); location.href='login';</script>";
		}	
	}
	
	//비밀번호찾기 
	public String findPW( String user_id, String user_name, String user_email) {
		
		String user_pw = userDao.getUserPwByFindPw( user_id, user_name, user_email);
	
		if( user_pw == null ) {
			return "<script>alert('일치하는 정보를 찾을 수 없습니다.'); location.href='../login/login';</script>";
			
		} else {
			// 임시비밀번호 생성기
			String disposablePW = passwordGenerator.generateDisposablePassword();
			log.info("1회용 비밀번호 : {}", disposablePW );
			// 임시비밀번호로 db update
			while(true) {
				int result = userDao.updateUserPwByDisposablePassword(user_id, disposablePW);
				if(result == 1) {
					log.info("id : {} 임시밀번호 설정됨. pw = {}", user_id, disposablePW);
					break;
				}
			}
			return "<script>alert('고객님의 임시 비밀번호는 " + disposablePW + " 입니다. 로그인하여 비밀번호를 변경해주세요.'); location.href='login';</script>";
		}
	}
	
	//아이디 중복확인 구동
	public int idCheckAjax( String user_id ) {
		
		String userID = userDao.getUserID( user_id );
		if( userID == null ) {
			return 0; // int값이 0일 경우 중복없음 -> 사용가능한 아이디			
		} else {
			return 1; // int값이 1일 경우 중복있음 -> 사용불가한 아이디
		}		
		
	}
	
	//회원가입 
	//입력받은 user정보를 User user값에 insert
	public String join(User user) {
		String pw = user.getUser_pw();
		pw = bCryptPasswordEncoder.encode(pw);
		user.setUser_pw(pw);
		int result = userDao.insertUser(user);
		if( result == 1 ) {
			return "<script>alert('회원가입되었습니다.'); location.href='login';</script>";
		}
		else {
			return "<script>alert('회원가입 실패'); history.back(-1);</script>";
		}
	}
	
}
