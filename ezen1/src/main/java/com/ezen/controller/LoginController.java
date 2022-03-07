package com.ezen.controller;

import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping("test")
	public String test() {
		
		return "login/test";
	}
	

	@RequestMapping("loginAction")
	@ResponseBody
	public String loginAction(
				@RequestParam("user_id") String user_id,
				@RequestParam("user_pw") String user_pw,
				HttpSession session) {
			
			String result = loginService.login(user_id, user_pw, session);			
			return result;
		}

	//로그아웃 기능
	@RequestMapping("logoutAction")
	@ResponseBody
	public String loginAction(HttpServletRequest request) {
			
		//세션객체 초기화
		request.getSession().invalidate();
		return "<script>alert('로그아웃 되었습니다.'); location.href='test';</script>";
			
	}
	
	//아이디찾기(미완성)
	@RequestMapping("idFindAction")
	@ResponseBody
	public String idFindAction( @RequestParam("user_name") String user_name,
								@RequestParam("user_email") String user_email) {
		
		
		String result = loginService.findId(user_name, user_email);
		System.out.println("컨트롤러 user_name:" + user_name);
		System.out.println("user_email:" + user_email);
		System.out.println("result:" + result);
		return result;	
	}
	
	//비밀번호찾(미완성)
		@RequestMapping("pwFindAction")
		@ResponseBody
		public String pwFindAction( 
				@RequestParam("user_id") String user_id,
				@RequestParam("user_name") String user_name,
				@RequestParam("user_email") String user_email) {
			
			
			String result = loginService.findPW(user_id, user_name, user_email);
			System.out.println("컨트롤러 user_name:" + user_name);
			System.out.println("user_email:" + user_email);
			System.out.println("result:" + result);
			return result;	
		}
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

	//회원탈퇴성공 / 겟 어트리뷰트 없이 동작되는지 다시 테스트해보기. 
	@RequestMapping("quitAction")
	@ResponseBody
	public String quitAction(@RequestParam("user_id") String user_id,HttpSession session) {
		
		session.getAttribute(user_id);
		
		System.out.println("컨트롤러 user_id:" + user_id);
		int result = userDao.deleteUser(user_id);
		if( result == 1){
			System.out.println("회원탈퇴");
				
			return "<script>alert('회원탈퇴 성공!'); location.href='/';</script>";
		}else {
			
			return "<script>alert('회원탈퇴 실패!'); history.back(-1);</script>";		
		}		
	}
}
