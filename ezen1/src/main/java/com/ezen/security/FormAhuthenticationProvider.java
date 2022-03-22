package com.ezen.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
@RequiredArgsConstructor
public class FormAhuthenticationProvider implements AuthenticationProvider{

	@Autowired
	UserDetailsServieceImpl userDetailsServieceImpl;
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
	return new BCryptPasswordEncoder();
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		
		log.info("로그인 요청  >>>>> 검증대상 id : {}", username);
		
		CustomUserDetails userDetails = (CustomUserDetails) userDetailsServieceImpl.loadUserByUsername(username);
		String passwordFormDB = userDetails.getPassword();

		
		if(!passwordEncoder().matches(password, passwordFormDB)) {
			log.info("비밀번호 불일치");
			throw new BadCredentialsException("비밀번호가 틀립니다.");
		}
		log.info("비밀번호 검증 완료");
		
		return new UsernamePasswordAuthenticationToken(userDetails.getUsername(), null, userDetails.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {

		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
