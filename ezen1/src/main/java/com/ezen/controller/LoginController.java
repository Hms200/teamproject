package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
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
			
			String result = loginService.login(user_id, user_pw);
			System.out.println("result:"+result);
			
			session.setAttribute("user_id", user_id);
			
			return result;
			
		}

	

}
