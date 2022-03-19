package com.ezen.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter{

	@Autowired
	private TokenProvider tokenProvider;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		try {
			// 토큰 가져오기
			String token = parseBearerToken(request);
			// 토큰 검사하기
			if(token != null && !token.equalsIgnoreCase("null")) {
				// user_idx 가져오고 위조된경우 예외처리함.
				String user_idx = tokenProvider.validateAndGetUserIdx(token);
				System.out.println("user_idx : " + user_idx);
				// SecurityContextHolder에 등록
				
				AbstractAuthenticationToken authentication = new UsernamePasswordAuthenticationToken
							(user_idx, null, AuthorityUtils.NO_AUTHORITIES);
				authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
				SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
				securityContext.setAuthentication(authentication);
				SecurityContextHolder.setContext(securityContext);
			}
			
		} catch (Exception e) {
			System.out.println("인증실패" + e);
		}
		
		filterChain.doFilter(request, response);
		
	};
	
	private String parseBearerToken(HttpServletRequest request) {
		// cookie에서 토큰정보를 읽어 파싱해 토큰 리턴
		Cookie[] cookies = request.getCookies();
		String token = "";
		for(Cookie c : cookies) {
			if(c.getName().equals("Authorization")) {
				token = c.getValue();
				System.out.println("token : " + token);
			}
		}
		if(StringUtils.hasText(token) && token.startsWith("Bearer")) {
			return token.substring(6);
		}
		return null;

	}
	
	
	
	
}
