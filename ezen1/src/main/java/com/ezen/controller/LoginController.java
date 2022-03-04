package com.ezen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dto.User;
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
	@RequestMapping("test")
	public String test() {
		
		return "login/test";
	}
	
	//로그인_ 수정필요 현재 user_id정보만 불러와짐 RequestParam 외 정보(idx) or Model 이용으로 변경생각하기.
	@RequestMapping("loginAction")
	@ResponseBody
	public String loginAction(
				@RequestParam("user_id") String user_id,
				@RequestParam("user_pw") String user_pw,
				HttpSession session, Model model) {
			
			String result = loginService.login(user_id, user_pw, model);
			System.out.println("result:"+result);
			
			session.setAttribute("user_id", user_id);
			
			return result;
			
		}

	//아이디찾기(미완성)
//	@RequestMapping("idFindAction")
//	@ResponseBody
//	public String idFindAction( @RequestParam("user_name") String user_name,
//								@RequestParam("user_email") String user_email) {
//			
//		String result = loginService.findId(user_name, user_email);
//		System.out.println("user_name:" + user_name);
//		System.out.println("user_email:" + user_email);
//		return result;	
//	}
	//회원가입
	@RequestMapping("idCheckAjax")
	@ResponseBody
	public int idCheckAjax(@RequestParam("user_id") String user_id) {
			
		int result = loginService.idCheckAjax( user_id );
		System.out.println("result:" + result);
			
		return result;
	}
	
	@RequestMapping("joinAction")
	@ResponseBody
	public String joinAction( 
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw,
			@RequestParam("user_name") String user_name,
			@RequestParam("user_phone") String user_phone,
			@RequestParam("user_email") String user_email,
			HttpServletRequest request, Model model) {
		
		String sample6_address = request.getParameter("sample6_address");
		String sample6_detailAddress = request.getParameter("sample6_detailAddress");
		String user_address = "";
		if( StringUtils.hasText(sample6_address)) {
			user_address += sample6_address;
		}
		if( StringUtils.hasText(sample6_detailAddress)) {
			user_address += " " + sample6_detailAddress;
		}
		System.out.println("user_address:"+user_address);
		
		int result = loginService.join(user_id, user_pw, user_name, user_phone, user_address,  user_email);
		if( result == 1 ) {
			return "<script>alert('회원가입되었습니다.'); location.href='login';</script>";
		}
		else {
			return "<script>alert('회원가입 실패'); history.back(-1);</script>";
		}
	}	
}
