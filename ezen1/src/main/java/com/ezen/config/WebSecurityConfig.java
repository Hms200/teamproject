package com.ezen.config;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.ezen.security.CustomAuthFailureHandler;
import com.ezen.security.FormAhuthenticationProvider;
import com.ezen.security.JwtAuthenticationFilter;
import com.ezen.security.LoginSuccessHandler;


// spring security를 이용한 보안설정
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	// Jwt토큰 검증필터
	@Autowired
	JwtAuthenticationFilter jwtAuthenticationFilter;
	
	// 로그인 성공시 수행할 작업(토큰발급)
	@Autowired
	LoginSuccessHandler loginSuccessHandler;
	
	// 로그인 실패시 수행할 작업(실패원인 분석)
	@Autowired
	CustomAuthFailureHandler customAuthFailureHandler;
	
	// id, pw check 클래스
	@Autowired
	FormAhuthenticationProvider formAhuthenticationProvider;
	
	// fromAhuthenticationProvider 등록
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception{
		//auth.userDetailsService(userdetailsserviceImpl).passwordEncoder(passwordEncoder());
		auth.authenticationProvider(formAhuthenticationProvider);
	}
	
	// static 자원은 보안설정 적용하지 않음
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**","/img/**","/css/**","/js/**");
	}

	// 설정
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		// http 시큐리티 빌더
		http.cors()
			.and()
				.csrf()   				 // 사용하지 않으므로 disable
					.disable()
				.httpBasic()  			 // token인증이므로 basic인증 disable
					.disable()
				.authorizeRequests()  	 // 다음 경로는 인증 안해도 됨
					.antMatchers(
							"/", "/main", "/aboutUs", "/siteMap", "/goodsList/**", "/login/**"
							).permitAll()
					.antMatchers("/admin/**").hasRole("ADMIN") // /admin/** 은  admin만 허용
				.anyRequest() 			 // 위 경로 외에는 인증 해야 함
					.authenticated()
			.and()
				.formLogin()	 		  // spring security login 인증 설정
					.loginPage("/login/login")
					.loginProcessingUrl("/login/loginAction")
					.usernameParameter("user_id")
					.passwordParameter("user_pw")
					.defaultSuccessUrl("/main")
					.successHandler(loginSuccessHandler)
					.failureHandler(customAuthFailureHandler)
					.permitAll()
			.and()
				.logout()				  // spring security logout 설정  로그아웃시 쿠키와 세션 초기화.
					.logoutRequestMatcher(new AntPathRequestMatcher("/login/logoutAction"))
					.deleteCookies("Authorization", "JSESSIONID")
					.invalidateHttpSession(true)
					.clearAuthentication(true)
					.logoutSuccessUrl("/main")
			.and()
				.sessionManagement()	  // session 관리
					.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);
				//	.maximumSessions(1)					// 최대 허용 session 1
				//	.maxSessionsPreventsLogin(true);		// 중복 로그인 허용 안함
		
		// custom AhuthenticationProvider 등록
		http.authenticationProvider(formAhuthenticationProvider); 
		
			
		// 필터 등록. 매 요청마다 SecurityContextHolderAwareRequestFilter 실행한 후 jwtAuthenticationFilter를 실행하여 토큰검사
		http.addFilterAfter(jwtAuthenticationFilter,  SecurityContextHolderAwareRequestFilter.class)
			.exceptionHandling()
				.accessDeniedPage("/error/error");
		
	}
	
}
