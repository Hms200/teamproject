package com.ezen.config;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;


import com.ezen.security.JwtAuthenticationFilter;


@EnableWebSecurity(debug = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	JwtAuthenticationFilter jwtAuthenticationFilter;
	


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		// http 시큐리티 빌더
		http.cors()
			.and()
				.csrf()   // 우선 disable
					.disable()
				.httpBasic()   // token인증이므로 basic인증은 disable
					.disable()
				.sessionManagement()  // session 생성 설정
					.sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
			.and()
				.authorizeRequests()   // 다음 경로는 인증 안해도 됨
					.antMatchers(
							"/", "/main", "/aboutUs", "/siteMap",
							"/goodsList/goodsList", "goodsList/goosDetail","/login/**",
							"/js/**", "/img/**", "/css/**").permitAll()
					.antMatchers("/admin/**").hasRole("ADMIN")
				.anyRequest()  // 위 경로 외에는 인증 해야 함
					.authenticated()
			.and()
				.formLogin()
					.loginPage("/login/login")
					.usernameParameter("user_id")
					.passwordParameter("user_pw")
					.loginProcessingUrl("/login/loginAction")
					.failureForwardUrl("/error/error")
					.defaultSuccessUrl("/main")
			.and()
				.logout()
					.logoutUrl("/login/logoutAction")
					.deleteCookies("Authorization")
					.logoutSuccessUrl("/main");
			
		// 필터 등록. 매 요청마다 SecurityContextHolderAwareRequestFilter 실행한 후 jwtAuthenticationFilter를 실행함.
		http.addFilterAfter(jwtAuthenticationFilter,  SecurityContextHolderAwareRequestFilter.class)
			.exceptionHandling()
				.accessDeniedPage("/error/error");
	}


	
	
}
