package com.ezen.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;
import com.ezen.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	IuserDAO userDao;
	
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
//		Spring Security 적용으로 기존 코드 사용 안함.		
//		int user_idx;
//		try {
//			user_idx = (int) session.getAttribute("user_idx");
//		} catch (NullPointerException e) {
//			user_idx = 0;
//		}
//		
//		if( user_idx != 0 ) {	
//			return "redirect:../myPage/myPage";
//		} 	
			return "login/login";
		
	}
	
	@RequestMapping("join")
	public String join(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int	user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
			String errorMessage = "이미 가입된 회원은 회원가입을 이용하실 수 없습니다.";
			log.info("이미 가입된 회원의 회원가입 시도 차단.");
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("/login/login").forward(request, response);
		} catch (Exception e) {
			return "login/join";
		}
		
		return "login/join";
	}
	
	@RequestMapping("quit")
	public String quit(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int	user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
		} catch (Exception e) {
			log.error("로그인 하지 않은 사용자의 회원탈퇴 시도." + e);;
			String errorMessage = "로그인하신 후 회원탈퇴 기능을 이용하실 수 있습니다.";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("/login/login").forward(request, response);
			return "login/login";
		}
		return "login/quit";
	}
//	Spring Security 적용으로 로그인, 로그아웃은 Spring Security가 담당하여 기존코드 사용안함.
//	로그인액션
//	@RequestMapping("loginAction")
//	@ResponseBody
//	public String loginAction( @RequestParam("user_id") String user_id,
//							   @RequestParam("user_pw") String user_pw
//							   ) {
//			String result = loginService.login(user_id, user_pw, response);			
//		return "";
//	}
//
//	로그아웃 기능
//	@RequestMapping("logoutAction")
//	@ResponseBody
//	public String loginAction(HttpServletRequest request) {
//			
//		//세션객체 초기화
//		request.getSession().invalidate();
//		return "<script>alert('로그아웃 되었습니다.'); location.href='/main';</script>";
//			
//	} 
//
	
	//아이디찾기
	@RequestMapping("idFindAction")
	@ResponseBody
	public String idFindAction( @RequestParam("user_name") String user_name,
								@RequestParam("user_email") String user_email) {
			
		String result = loginService.findId(user_name, user_email);	
		return result;	
	}
	
	//비밀번호찾기 
	@RequestMapping("pwFindAction")
	@ResponseBody
	public String pwFindAction( @RequestParam("user_id") String user_id,
								@RequestParam("user_name") String user_name,
								@RequestParam("user_email") String user_email) {
							
		String result = loginService.findPW(user_id, user_name, user_email);			
		return result;	
	}
		
	//아이디 중복체크 
	@RequestMapping("idCheckAjax")
	@ResponseBody
	public int idCheckAjax(@RequestParam("user_id") String user_id) {
			
		int result = loginService.idCheckAjax( user_id );			
		return result;
	}
	
	//회원가입 
	@PostMapping("joinAction")
	@ResponseBody
	public String joinAction(@ModelAttribute User user) {
				
		String result = loginService.join(user);		
		return result;		
	}
	
	//회원탈퇴 
	@RequestMapping("quitAction")
	@ResponseBody
	public String quitAction(@RequestParam("user_id") String user_id) {
		
		String result = loginService.quit(user_id);
		return result;			
	}
	
}
