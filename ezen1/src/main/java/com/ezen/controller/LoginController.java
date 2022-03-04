package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dao.IuserDAO;
import com.ezen.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	IuserDAO userDao;
	
	
	@RequestMapping("login")
	public String login() {
		
		return "login/login";
	}
	
	@RequestMapping("join")
	public String join() {
		
		return "login/join";
	}
	
	@RequestMapping("quit")
	public String quit() {
		
		return "login/quit";
	}
	
	//로그인
	@RequestMapping("loginAction")
	@ResponseBody
	public String loginAction( 
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw, 
			HttpSession session, Model model) {
		
		String user_idx = loginService.login(user_id, user_pw);
		System.out.println("user_idx:"+user_idx);
		
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_idx", user_idx);
		
		return user_idx;
		
	}
	
	//아이디찾기(미완성)
	@RequestMapping("idFindAction")
	@ResponseBody
	public String idFindAction( @RequestParam("user_name") String user_name,
								@RequestParam("user_email") String user_email) {
		
		String user_id = loginService.findId(user_name, user_email);
		
		System.out.println("user_name:" + user_name);
		System.out.println("user_email:" + user_email);
		System.out.println("user_id:" + user_id);
			
		if( StringUtils.hasText(user_id) ) {			
			return "<script>alert('고객님의 아이디는" + user_id + " 입니다.'); location.href='/login/login';</script>";
		}else {
			return "<script>alert('아이디를 찾을 수 없습니다.'); history.back(-1);</script>";
		}
				
		
	}
	//비밀번호찾기 
	
	
	//회원가입 
	@RequestMapping("idCheckAjax")
	@ResponseBody
	public int idCheckAjax(@RequestParam("user_id") String user_id) {
		
		int result = loginService.idCheckAjax( user_id );
		System.out.println("result:" + result);
		
		return result;
		
	}
}
