package com.ezen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IuserDAO;
import com.ezen.dto.User;
import com.ezen.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	IuserDAO userDao;
	
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
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
	public String join(HttpSession session) {
		
		int user_idx;
		try {
			user_idx = (int) session.getAttribute("user_idx");
		} catch (NullPointerException e) {
			user_idx = 0;
		}
		System.out.println(user_idx);
		if( user_idx != 0 ) {	
			return "redirect:/login/login";
		}
		return "login/join";
	}
	
	@RequestMapping("quit")
	public String quit(HttpSession session) {
		
		int user_idx;
		try {
			user_idx = (int) session.getAttribute("user_idx");
		} catch (NullPointerException e) {
			user_idx = 0;
		}
		System.out.println(user_idx);
		if( user_idx == 0 ) {	
			return "redirect:/main";
		}
		return "login/quit";
	}
//	
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
	public String quitAction(@RequestParam("user_id") String user_id,
							 HttpServletRequest request) {
			
		int result = userDao.deleteUser(user_id);
		if( result == 1){	
			request.getSession().invalidate();
			return "<script>alert('회원탈퇴 성공!'); location.href='/';</script>";
		} else {			
			return "<script>alert('회원탈퇴 실패!'); history.back(-1);</script>";		
		}		
	}
	
}
