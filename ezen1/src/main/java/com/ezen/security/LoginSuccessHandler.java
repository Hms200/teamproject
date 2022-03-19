package com.ezen.security;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.ezen.dao.IuserDAO;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	
	@Autowired
	TokenProvider tokenProvider;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	IuserDAO userDAO;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("로그인 인증성공. 인증토큰발급시작");
		
		@SuppressWarnings("static-access")
		CustomUserDetails userDetails = (CustomUserDetails) securityContextHolder().getContext().getAuthentication().getPrincipal();
		String user_id = userDetails.getUsername();
		int user_idx = userDAO.getUserIdx(user_id);
		String userIdx = String.valueOf(user_idx);
		// jwt 인증 토큰 생성
		final String token = tokenProvider.create(userIdx);
		
		// cookie에 저장
		Cookie cookie = new Cookie("Authorization", "Bearer"+token);
		
		// 만료기간은 1시간
		cookie.setMaxAge(60*60);
		// optional properties
		cookie.setSecure(true);
		cookie.setHttpOnly(true);
		cookie.setPath("/");
		// add cookie to response
		response.addCookie(cookie);
		
		// session에 user_id와 user_idx 넣어줌
		
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_idx", userIdx);
		
		// myPage로 redirect
		System.out.println("myPage로 redirect합니다.");
		response.sendRedirect("../myPage/myPage");
		
	}
	
	@Bean
	public SecurityContextHolder securityContextHolder() {
		return new SecurityContextHolder();
	}

}
