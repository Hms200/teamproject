package com.ezen.security;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter{

	@Autowired
	private TokenProvider tokenProvider;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		try {
			//log.info("토큰 가져오기를 시도합니다.");
			String token = parseBearerToken(request);
			// 토큰 검사하기
			if(token != null && !token.equalsIgnoreCase("null")) {
				
				//log.info("토큰 가져오기 성공. 토큰을 검증합니다.");
				// user_idx 가져오고 위조된경우 예외처리함.
				String user_idx = tokenProvider.validateAndGetUserIdx(token);
			//	log.info("토큰 검증 완료. 권한을 설정합니다.");
				// 사용자 권한 설정. 관리자의 user_idx = 2임.
				Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
				if(user_idx.equals("2")) {
					grantedAuthorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
				//	log.info("사용자 권한 : ADMIN");
				}else {
					grantedAuthorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
				//	log.info("사용자 권한 : MEMBER");
				}
				//log.info("권한설정 완료. SecurityContextHolder에 등록합니다.");
				// SecurityContextHolder에 등록
				AbstractAuthenticationToken authentication = new UsernamePasswordAuthenticationToken
							(user_idx, null, grantedAuthorities);
				authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
				SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
				securityContext.setAuthentication(authentication);
				SecurityContextHolder.setContext(securityContext);
				//log.info("인증을 마쳤습니다.");
			}
			
		} catch (Exception e) {
			log.error("jwt 인증 실패 {}",e);
			
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
			}
		}
		if(StringUtils.hasText(token) && token.startsWith("Bearer")) {
			return token.substring(6);
		}
		return null;

	}
	
	
	
	
}
